// Copyright (c) Roman Atachiants and contributors. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for details.

//go:build !noasm && amd64

package bitmap

import (
	"unsafe"

	"golang.org/x/sys/cpu"
)

var (
	hasAvx2   = cpu.X86.HasAVX2
	hasAvx512 = cpu.X86.HasAVX512

	hasNEON = false
	hasSVE  = false
)

// And computes the intersection between two bitmaps and stores the result in the current bitmap
func (dst *Bitmap) And(other Bitmap, extra ...Bitmap) {
	max := minlen(*dst, other, extra)
	dst.shrink(max)
	if max == 0 {
		return
	}

	switch {
	case hasAvx512:
		switch len(extra) {
		case 0:
			_and_avx512(*dst, other)
		default:
			vx, _ := pointersOf(other, extra)
			_and_many_avx512(unsafe.Pointer(&(*dst)[0]), vx, dimensionsOf(max, len(extra)+1))
		}
	case hasAvx2:
		switch len(extra) {
		case 0:
			_and(*dst, other)
		default:
			vx, _ := pointersOf(other, extra)
			_and_many(unsafe.Pointer(&(*dst)[0]), vx, dimensionsOf(max, len(extra)+1))
		}
	default:
		and(*dst, max, other, extra)
		return
	}
}

// AndNot computes the difference between two bitmaps and stores the result in the current bitmap.
// Operation works as set subtract: dst - b
func (dst *Bitmap) AndNot(other Bitmap, extra ...Bitmap) {
	max := minlen(*dst, other, extra)
	if max == 0 {
		return
	}

	switch {
	case hasAvx512:
		switch len(extra) {
		case 0:
			_andn_avx512(*dst, other)
		default:
			vx, _ := pointersOf(other, extra)
			_andn_many_avx512(unsafe.Pointer(&(*dst)[0]), vx, dimensionsOf(max, len(extra)+1))
		}
	case hasAvx2:
		switch len(extra) {
		case 0:
			_andn(*dst, other)
		default:
			vx, _ := pointersOf(other, extra)
			_andn_many(unsafe.Pointer(&(*dst)[0]), vx, dimensionsOf(max, len(extra)+1))
		}
	default:
		andn(*dst, max, other, extra)
		return
	}
}

// Or computes the union between two bitmaps and stores the result in the current bitmap
func (dst *Bitmap) Or(other Bitmap, extra ...Bitmap) {
	max := maxlen(*dst, other, extra)
	if max == 0 {
		return
	}

	dst.grow(max - 1)
	switch {
	case hasAvx512:
		switch len(extra) {
		case 0:
			_or_avx512(*dst, other)
		default:
			vx, max := pointersOf(other, extra)
			_or_many_avx512(unsafe.Pointer(&(*dst)[0]), vx, dimensionsOf(max, len(extra)+1))
		}
	case hasAvx2:
		switch len(extra) {
		case 0:
			_or(*dst, other)
		default:
			vx, max := pointersOf(other, extra)
			_or_many(unsafe.Pointer(&(*dst)[0]), vx, dimensionsOf(max, len(extra)+1))
		}
	default:
		or(*dst, other, extra)
	}
}

// Xor computes the symmetric difference between two bitmaps and stores the result in the current bitmap
func (dst *Bitmap) Xor(other Bitmap, extra ...Bitmap) {
	max := maxlen(*dst, other, extra)
	if max == 0 {
		return
	}

	dst.grow(max - 1)
	switch {
	case hasAvx512:
		switch len(extra) {
		case 0:
			_xor_avx512(*dst, other)
		default:
			vx, max := pointersOf(other, extra)
			_xor_many_avx512(unsafe.Pointer(&(*dst)[0]), vx, dimensionsOf(max, len(extra)+1))
		}
	case hasAvx2:
		switch len(extra) {
		case 0:
			_xor(*dst, other)
		default:
			vx, max := pointersOf(other, extra)
			_xor_many(unsafe.Pointer(&(*dst)[0]), vx, dimensionsOf(max, len(extra)+1))
		}
	default:
		xor(*dst, other, extra)
	}
}

// Count returns the number of elements in this bitmap
func (dst Bitmap) Count() int {
	if len(dst) == 0 {
		return 0
	}

	switch {
	case hasAvx2:
		res := _count(dst)
		return int(res)
	default:
		return count(dst)
	}
}
