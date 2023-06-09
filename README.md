# accmath (Accelerated Math)

An experimental accelerated math library for M1/M2 Apple Silicon Macs.
This project **is a work in progress** but will be used as the math backend for
my physics engine.

This project is inspired by raymath from raylib, and will eventually have Matrix
and Quaternion support, but is purely vectors for now.

**Hardware Backends:**

1. Default (C)
2. SIMD
3. vDSP (Apple Accelerate)
4. Arm64 NEON
5. ARM64 Assembler
6. Metal Performance Shaders (Eventually)
7. OpenCL (Eventually)