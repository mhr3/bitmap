// Copyright (c) Roman Atachiants and contributors. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for details.

//go:build !noasm && arm64

package bitmap

import (
	"unsafe"

	"golang.org/x/sys/cpu"
)

var (
	hasNEON = cpu.ARM64.HasASIMD
	hasSVE  = cpu.ARM64.HasSVE

	hasAvx2   = false
	hasAvx512 = false
)

// And computes the intersection between two bitmaps and stores the result in the current bitmap
func (dst *Bitmap) And(other Bitmap, extra ...Bitmap) {
	max := minlen(*dst, other, extra)
	dst.shrink(max)
	if max == 0 {
		return
	}

	switch {
	case hasSVE:
		switch len(extra) {
		case 0:
			_and_sve(*dst, other)
		default:
			vx, _ := pointersOf(other, extra)
			_and_many_sve(unsafe.Pointer(&(*dst)[0]), vx, dimensionsOf(max, len(extra)+1))
		}
	case hasNEON:
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
	case hasSVE:
		switch len(extra) {
		case 0:
			_andn_sve(*dst, other)
		default:
			vx, _ := pointersOf(other, extra)
			_andn_many_sve(unsafe.Pointer(&(*dst)[0]), vx, dimensionsOf(max, len(extra)+1))
		}
	case hasNEON:
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
	case hasSVE:
		switch len(extra) {
		case 0:
			_or_sve(*dst, other)
		default:
			vx, max := pointersOf(other, extra)
			_or_many_sve(unsafe.Pointer(&(*dst)[0]), vx, dimensionsOf(max, len(extra)+1))
		}
	case hasNEON:
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
	case hasSVE:
		switch len(extra) {
		case 0:
			_xor_sve(*dst, other)
		default:
			vx, max := pointersOf(other, extra)
			_xor_many_sve(unsafe.Pointer(&(*dst)[0]), vx, dimensionsOf(max, len(extra)+1))
		}
	case hasNEON:
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
	case hasSVE:
		res := _count_sve(dst)
		return int(res)
	case hasNEON:
		res := _count(dst)
		return int(res)
	default:
		return count(dst)
	}
}
