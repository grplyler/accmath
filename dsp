#!/bin/bash

# Builds and Runs the SIMD backend

rm -rf build
cmake -B build -DBACKEND_VDSP=ON
cmake --build build
./math-library