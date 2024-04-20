// Copyright (c) Roman Atachiants and contributors. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for details.

#include <stdint.h>

// gocc: _and(a, b []uint64)
void _and(uint64_t* a, uint64_t a_len, uint64_t a_cap, uint64_t* b, uint64_t b_len, uint64_t b_cap) {
    uint64_t n = a_len < b_len ? a_len : b_len;
    #pragma clang loop vectorize(enable)
    for (uint64_t i = 0; i < n; ++i) {
        a[i] &= b[i];
    }
}

// gocc: _andn(a, b []uint64)
void _andn(uint64_t* a, uint64_t a_len, uint64_t a_cap, uint64_t* b, uint64_t b_len, uint64_t b_cap) {
    uint64_t n = a_len < b_len ? a_len : b_len;
    #pragma clang loop vectorize(enable) interleave(enable)
    for (uint64_t i = 0; i < n; ++i) {
        a[i] &= ~b[i];
    }
}

// gocc: _or(a, b []uint64)
void _or(uint64_t* a, uint64_t a_len, uint64_t a_cap, uint64_t* b, uint64_t b_len, uint64_t b_cap) {
    uint64_t n = a_len < b_len ? a_len : b_len;
    #pragma clang loop vectorize(enable) interleave(enable)
    for (uint64_t i = 0; i < n; ++i) {
        a[i] |= b[i];
    }
}

// gocc: _xor(a, b []uint64)
void _xor(uint64_t* a, uint64_t a_len, uint64_t a_cap, uint64_t* b, uint64_t b_len, uint64_t b_cap) {
    uint64_t n = a_len < b_len ? a_len : b_len;
    #pragma clang loop vectorize(enable) interleave(enable)
    for (uint64_t i = 0; i < n; ++i) {
        a[i] ^= b[i];
    }
}

// gocc: _and_many(a unsafe.Pointer, b unsafe.Pointer, dims uint64)
void _and_many(uint64_t* a, uint64_t** b, uint64_t dims) {
    int64_t n = (dims & 0xffffffff);
    int64_t m = (dims >> 32);
    const int64_t chunk_size = 512;

    // Loop over chunks of b
    for (int64_t chunk = 0; chunk < n; chunk += chunk_size) {
        int64_t chunk_end = chunk + chunk_size;
        if (chunk_end > n) {
            chunk_end = n;
        }

        for (int64_t j = 0; j < m; ++j) {
            #pragma clang loop vectorize(enable) interleave(enable)
            for (int64_t i = chunk; i < chunk_end; ++i) {
                a[i] &= b[j][i];
            }
        }
    }
}

// gocc: _andn_many(a unsafe.Pointer, b unsafe.Pointer, dims uint64)
void _andn_many(uint64_t* a, uint64_t** b, uint64_t dims) {
    int64_t n = (dims & 0xffffffff);
    int64_t m = (dims >> 32);
    const int64_t chunk_size = 512;

    // Loop over chunks of b
    for (int64_t chunk = 0; chunk < n; chunk += chunk_size) {
        int64_t chunk_end = chunk + chunk_size;
        if (chunk_end > n) {
            chunk_end = n;
        }

        for (int64_t j = 0; j < m; ++j) {
            #pragma clang loop vectorize(enable) interleave(enable)
            for (int64_t i = chunk; i < chunk_end; ++i) {
                a[i] &= ~b[j][i];
            }
        }
    }
}

// gocc: _or_many(a unsafe.Pointer, b unsafe.Pointer, dims uint64)
void _or_many(uint64_t* a, uint64_t** b, uint64_t dims) {
    int64_t n = (dims & 0xffffffff);
    int64_t m = (dims >> 32);
    const int64_t chunk_size = 512;

    // Loop over chunks of b
    for (int64_t chunk = 0; chunk < n; chunk += chunk_size) {
        int64_t chunk_end = chunk + chunk_size;
        if (chunk_end > n) {
            chunk_end = n;
        }

        for (int64_t j = 0; j < m; ++j) {
            #pragma clang loop vectorize(enable) interleave(enable)
            for (int64_t i = chunk; i < chunk_end; ++i) {
                a[i] |= b[j][i];
            }
        }
    }
}

// gocc: _xor_many(a unsafe.Pointer, b unsafe.Pointer, dims uint64)
void _xor_many(uint64_t* a, uint64_t** b, uint64_t dims) {
    int64_t n = (dims & 0xffffffff);
    int64_t m = (dims >> 32);
    const int64_t chunk_size = 512;

    // Loop over chunks of b
    for (int64_t chunk = 0; chunk < n; chunk += chunk_size) {
        int64_t chunk_end = chunk + chunk_size;
        if (chunk_end > n) {
            chunk_end = n;
        }

        for (int64_t j = 0; j < m; ++j) {
            #pragma clang loop vectorize(enable) interleave(enable)
            for (int64_t i = chunk; i < chunk_end; ++i) {
                a[i] ^= b[j][i];
            }
        }
    }
}

// gocc: _count(a []uint64) uint64
uint64_t _count(uint64_t *a, uint64_t a_len, uint64_t a_cap) {
    uint64_t count = 0;

    for (int i = 0; i < a_len; i++) {
        count += __builtin_popcountll(a[i]);
    }

    return count;
}
