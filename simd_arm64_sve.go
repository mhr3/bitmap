//go:build !noasm && arm64
// Code generated by gocc -- DO NOT EDIT.

package bitmap

import "unsafe"

//go:noescape
func _and_sve(a []uint64, b []uint64)

//go:noescape
func _andn_sve(a []uint64, b []uint64)

//go:noescape
func _or_sve(a []uint64, b []uint64)

//go:noescape
func _xor_sve(a []uint64, b []uint64)

//go:noescape
func _and_many_sve(a unsafe.Pointer, b unsafe.Pointer, dims uint64)

//go:noescape
func _andn_many_sve(a unsafe.Pointer, b unsafe.Pointer, dims uint64)

//go:noescape
func _or_many_sve(a unsafe.Pointer, b unsafe.Pointer, dims uint64)

//go:noescape
func _xor_many_sve(a unsafe.Pointer, b unsafe.Pointer, dims uint64)

//go:noescape
func _count_sve(a []uint64) uint64
