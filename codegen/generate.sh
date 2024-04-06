#!/bin/bash

./bin/gocc -l -o ../ --package bitmap simd.c --arch avx2   -O1 -s _avx
./bin/gocc -l -o ../ --package bitmap simd.c --arch avx512 -O3 -s _avx512 --function-suffix _avx512
./bin/gocc -l -o ../ --package bitmap simd.c --arch arm64 -O3 -s _arm64
#./bin/gocc -l -o ../ --package bitmap simd.c --arch sve -O3 -s _arm64_sve --function-suffix _sve
