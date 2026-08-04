# SDP Attention OOM Fix for High-Resolution VAE Encoding

## Problem

When using `--opt-sdp-no-mem-attention` (or `--opt-sdp-attention`) with high-resolution images (e.g. 4096×3072) in img2img, the VAE encoder's `AttnBlock` calls `torch.nn.functional.scaled_dot_product_attention()` which attempts to materialize the full attention matrix in memory.

For a 4096×3072 image, the VAE encoder mid-block operates at 1/8 resolution (512×384 spatial = 196,608 tokens). The attention matrix requires `(196608)² × 4 bytes ≈ 154 GB` in float32, causing:

```
RuntimeError: [enforce fail at alloc_cpu.cpp:127] err == 0. DefaultCPUAllocator: can't allocate memory: you tried to allocate 154618822656 bytes. Error code 12 (Cannot allocate memory)
```

This is especially acute when running on CPU (`--use-cpu all`) because the SDP kernel context manager (`torch.backends.cuda.sdp_kernel`) has no effect on CPU — the implementation defaults to materializing the full attention matrix.

## Fix

**File:** `modules/sd_hijack_optimizations.py`

**Function:** `sdp_attnblock_forward` (line 637)

Added dynamic memory-aware fallback: before executing SDP attention, estimate the memory required and compare against available system RAM/VRAM. If the estimate exceeds 50% of available memory, delegate to `sub_quad_attnblock_forward` which uses chunked (sub-quadratic) attention computation.

### Memory estimate formula

```
sdp_mem_estimate = bytes_per_element × batch × (tokens² + tokens × channels × 3)
```

Breakdown:
- `tokens²`: the (seq_len × seq_len) attention matrix
- `tokens × channels × 3`: q, k, v tensors (each `b × tokens × c`)
- Exit threshold: `sdp_mem_estimate > available_mem × 0.5`

### Why 0.5 safety factor?

The 50% headroom accounts for:
- PyTorch intermediate tensor allocations during SDP computation
- Output tensor and rearrange operations
- Non-model memory pressure (OS, other processes)
- Stacking of multiple attention blocks during VAE encoding

### Behavior across hardware

| RAM Available | Max tokens (float32) | Max image resolution |
|---|---|---|
| 8 GB  | ~22K tokens | ~1400×1400 |
| 16 GB | ~32K tokens | ~2000×2000 |
| 32 GB | ~46K tokens | ~2900×2900 |
| 64 GB | ~63K tokens | ~4000×4000 |

Images that fit within the threshold use SDP attention (faster, more precise). Images exceeding it fall back to sub-quadratic attention (chunked, memory-bounded). In practice, only very high-resolution VAE encoding triggers the fallback — the diffusion U-Net's attention blocks at 64×64 or 128×128 remain on the fast SDP path.

## Reuses existing infrastructure

- `get_available_vram()` — already defined at line 166, returns available GPU VRAM on CUDA or available system RAM on CPU via `psutil.virtual_memory().available`
- `sub_quad_attnblock_forward()` — already defined at line 665, uses `sub_quad_attention()` which already has its own adaptive chunking based on available memory
- `psutil` already imported at line 3

## Related

- The deprecation warning `FutureWarning: torch.backends.cuda.sdp_kernel() is deprecated` seen in the logs is from the `sdp_no_mem_attnblock_forward` wrapper (line 661) and is a separate issue — fixable by updating to a newer PyTorch or using `torch.nn.attention.sdpa_kernel()` instead.
