# Troubleshooting

* [CLI Tools Ignore a Running Proxy](cli-ignores-running-proxy.md) — Diagnose and fix CLI
  tools timing out while a proxy runs in the GUI; missing proxy env vars and SOCKS/HTTP port gotchas.
* [SD WebUI SDP Attention OOM](sd-webui-sdp-attention-oom.md) — High-resolution VAE encoding
  OOM on CPU caused by quadratic attention-matrix materialization; memory-aware chunked fallback.
* [MPS convolution_overrideable Crash](mps-convolution-overrideable.md) — Intermittent img2img
  VAE encode/decode crash on Apple Silicon (torch 2.3.1); `--no-half-vae` and code-level fixes.
* [macOS App Launch Issues](macos-app-launch-issues.md) — Diagnose and fix slow or broken
  app launches on Apple Silicon caused by Rosetta, quarantine xattr, and ad-hoc code signing.
