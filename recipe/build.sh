#! /usr/bin/bash
set -e

mkdir -p build
cd build

cmake .. \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCOVFIE_PLATFORM_CPU=On \
  -DCOVFIE_PLATFORM_CUDA=Off \
  -DCOVFIE_PLATFORM_SYCL=Off \
  -DCOVFIE_PLATFORM_HIP=Off \
  -DCOVFIE_BUILD_BENCHMARKS=Off \
  -DCOVFIE_BUILD_TESTS=Off \
  -DCOVFIE_BUILD_EXAMPLES=Off

NPROC=$(nproc 2>/dev/null || sysctl -n hw.ncpu)
make -j"$NPROC"
make install
