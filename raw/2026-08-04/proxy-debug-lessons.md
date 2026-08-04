# Proxy Debugging Lessons

## Problem

A proxy tool was running and working in the GUI, but terminal CLI tools (`curl`, `wget`, `git`) could not reach the internet — timing out on all connections.

## Root Cause

A proxy daemon (e.g., Xray/V2Ray, bundled with a V2RayN-style GUI client) was running and listening on `127.0.0.1:10808`, but **no environment variables** were set in the shell. CLI tools do not auto-detect a running proxy — they must be explicitly told where it is via `HTTP_PROXY`, `HTTPS_PROXY`, or `ALL_PROXY`.

## Diagnosis Steps

1. **Check if a proxy process is running:**
   ```bash
   ps aux | grep -i 'v2ray\|xray\|clash\|sing'
   ```

2. **Find which ports the proxy listens on:**
   ```bash
   ss -tlnp | grep -i 'v2ray\|xray\|clash'
   ```
   Result: SOCKS5 on `127.0.0.1:10808`

3. **Check if proxy env vars are set:**
   ```bash
   env | grep -i proxy
   ```
   Result: none

4. **Test connectivity:**
   ```bash
   # Fails without proxy
   curl -s -o /dev/null -w "%{http_code}" https://www.google.com
   # → 000 (timeout)

   # Works with proxy
   ALL_PROXY=socks5://127.0.0.1:10808 curl -s -o /dev/null -w "%{http_code}" https://www.google.com
   # → 200
   ```

## Fix

Add to `~/.bashrc`:

```bash
# SOCKS5 proxy for CLI tools
export ALL_PROXY=socks5://127.0.0.1:10808
export all_proxy=socks5://127.0.0.1:10808
```

- `ALL_PROXY` (uppercase) — respected by `curl`, `wget`, `git`, `npm`, `yarn`
- `all_proxy` (lowercase) — some tools (curl included) check this as fallback

Note: `10808`/`10809` are the example default ports for the V2Ray/Xray family of
clients. Check your own client's inbound configuration before hardcoding them.

## Pitfalls

| Pitfall | Detail |
|---------|--------|
| **SOCKS5 port ≠ HTTP proxy** | A proxy client's default inbound is often SOCKS5 (e.g., 10808), not HTTP. Tools that only support HTTP proxies need `socks5://` syntax or a separate HTTP inbound (e.g., 10809). |
| **Interactive shell guard in .bashrc** | Many `.bashrc` files have `case $- in *i*) ;; *) return;; esac` at the top — this causes the file to exit immediately in non-interactive shells (scripts, CI, tool sub-shells). For those, put proxy vars in `~/.profile` or `/etc/environment` instead. |
| **SOCKS port ≠ HTTP port** | In V2Ray/Xray-style clients, 10808 is typically SOCKS5 and 10809 is typically the HTTP inbound (if configured). Don't assume the HTTP port exists. |
| **curl --noproxy ignores ALL_PROXY** | If testing connectivity, don't use `--noproxy '*'` unless you want to bypass the proxy. |

## Quick Litmus Test

```bash
# Should print HTTP code 200 if proxy is working
ALL_PROXY=socks5://127.0.0.1:10808 curl -s -o /dev/null -w "%{http_code}\n" --connect-timeout 5 https://www.google.com
```

## Non-interactive Shells

For CI, cron, or tooling that spawns non-interactive shells, either:
- Put proxy exports in `~/.profile` (sourced by login shells)
- Use `/etc/environment` (system-wide, all shells)
- Or prefix each command: `ALL_PROXY=socks5://127.0.0.1:10808 <command>`
