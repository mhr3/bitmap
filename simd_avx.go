//go:build !noasm && amd64
// Code generated by gocc -- DO NOT EDIT.

package bitmap

import "unsafe"

//go:noescape
func _and(a []uint64, b []uint64)

//go:noescape
func _andn(a []uint64, b []uint64)

//go:noescape
func _or(a []uint64, b []uint64)

//go:noescape
func _xor(a []uint64, b []uint64)

//go:noescape
func _and_many(a unsafe.Pointer, b unsafe.Pointer, dims uint64)

//go:noescape
func _andn_many(a unsafe.Pointer, b unsafe.Pointer, dims uint64)

//go:noescape
func _or_many(a unsafe.Pointer, b unsafe.Pointer, dims uint64)

//go:noescape
func _xor_many(a unsafe.Pointer, b unsafe.Pointer, dims uint64)

//go:noescape
func _count(a []uint64) uint64
