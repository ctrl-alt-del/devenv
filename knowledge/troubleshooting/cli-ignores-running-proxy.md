---
type: Troubleshooting
title: CLI Tools Ignore a Running Proxy
description: Diagnose and fix CLI tools (curl, wget, git) timing out on all connections while a proxy client is running and working in the GUI.
tags: [proxy, network, curl, wget, git, environment-variables, socks5, bashrc, non-interactive-shell]
timestamp: 2026-08-04T00:00:00Z
---

# Overview

A proxy client can be running and fully working from its GUI while every terminal
CLI tool (`curl`, `wget`, `git`) times out on all connections. Root cause: CLI
tools never auto-detect a running proxy. They only use it when told to via
`HTTP_PROXY`, `HTTPS_PROXY`, or `ALL_PROXY` environment variables. If those are
unset, every connection bypasses the proxy and hangs.

# Diagnosis Checklist

Run these 4 checks in order.

| Step | Command | Expected |
|---|---|---|
| 1. Proxy process running? | `ps aux \| grep -i 'v2ray\|xray\|clash\|sing'` | Matching process |
| 2. Listening ports? | `ss -tlnp \| grep -i 'v2ray\|xray\|clash'` | SOCKS5 on `127.0.0.1:10808` |
| 3. Proxy env vars set? | `env \| grep -i proxy` | Non-empty |
| 4. Connectivity test? | `curl -s -o /dev/null -w "%{http_code}" https://www.google.com` | `200` (not `000`) |

If step 3 is empty and step 4 returns `000`, the diagnosis is confirmed: proxy
running, env vars not set.

# Root Cause — Environment Variables Missing

**Symptom:** GUI proxy works; all terminal network commands time out (`curl` → `000`).

**Why:** CLI tools do not auto-detect a running proxy daemon. They consult
`HTTP_PROXY` / `HTTPS_PROXY` / `ALL_PROXY` (and lowercase variants) in the
environment. Unset vars mean direct connections, which fail when direct routing
to the target is unavailable.

**Confirm:**
```bash
# No proxy → 000 (timeout)
curl -s -o /dev/null -w "%{http_code}" https://www.google.com

# With proxy → 200
ALL_PROXY=socks5://127.0.0.1:10808 curl -s -o /dev/null -w "%{http_code}" https://www.google.com
```

**Fix:** export the proxy in your shell configuration:

```bash
export ALL_PROXY=socks5://127.0.0.1:10808
export all_proxy=socks5://127.0.0.1:10808
```

- `ALL_PROXY` (uppercase) — respected by `curl`, `wget`, `git`, `npm`, `yarn`
- `all_proxy` (lowercase) — some tools (curl included) check this as a fallback

# Where to Put the Exports

Choose based on where the variables must apply.

| Location | Applies to | Use when |
|---|---|---|
| `~/.bashrc` | Interactive bash shells | Interactive-only needs; mind the interactive-shell guard (see Pitfalls) |
| `~/.profile` | Login shells | CI, cron, scripts that spawn non-interactive shells |
| `/etc/environment` | All shells system-wide | Universal proxy policy |
| Command prefix | Single invocation | `ALL_PROXY=socks5://127.0.0.1:10808 <command>` one-off tests |

# Pitfalls

1. **SOCKS5 port ≠ HTTP proxy** — A client's default inbound is often SOCKS5
   (e.g., 10808), not HTTP. Tools that only support HTTP proxies need
   `socks5://` syntax or a separate HTTP inbound (e.g., 10809).
2. **Interactive shell guard in `.bashrc`** — `case $- in *i*) ;; *) return;; esac`
   at the top of `.bashrc` makes the file exit immediately in non-interactive
   shells. Put proxy exports in `~/.profile` or `/etc/environment` instead.
3. **SOCKS port ≠ HTTP port** — In V2Ray/Xray-style clients, 10808 is typically
   SOCKS5 and 10809 is typically the HTTP inbound (if configured). Don't assume
   the HTTP port exists.
4. **`curl --noproxy` bypasses proxy** — `--noproxy '*'` intentionally ignores
   proxy vars; don't use it while testing connectivity.

# Quick Reference

```bash
# ── TRIAGE ──
ps aux | grep -i 'v2ray\|xray\|clash\|sing'
ss -tlnp | grep -i 'v2ray\|xray\|clash'
env | grep -i proxy

# ── LITMUS TEST ──
ALL_PROXY=socks5://127.0.0.1:10808 curl -s -o /dev/null -w "%{http_code}\n" --connect-timeout 5 https://www.google.com

# ── FIX (interactive shells) ──
echo 'export ALL_PROXY=socks5://127.0.0.1:10808' >> ~/.bashrc
echo 'export all_proxy=socks5://127.0.0.1:10808' >> ~/.bashrc
```

# Related

- [Shell Configuration](/concepts/shell-configuration.md) — organizing bash config, including where proxy exports belong
- Source: [../../../raw/2026-08-04/proxy-debug-lessons.md](../../../raw/2026-08-04/proxy-debug-lessons.md)

# Citations

[1] [curl: Environment variables](https://curl.se/docs/manpage.html#environment)
