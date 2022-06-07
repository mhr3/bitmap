//+build !noasm !appengine
// AUTO-GENERATED BY C2GOASM -- DO NOT EDIT

DATA LCDATA1<>+0x000(SB)/8, $0x0f0f0f0f0f0f0f0f
DATA LCDATA1<>+0x008(SB)/8, $0x0f0f0f0f0f0f0f0f
DATA LCDATA1<>+0x010(SB)/8, $0x0f0f0f0f0f0f0f0f
DATA LCDATA1<>+0x018(SB)/8, $0x0f0f0f0f0f0f0f0f
DATA LCDATA1<>+0x020(SB)/8, $0x0302020102010100
DATA LCDATA1<>+0x028(SB)/8, $0x0403030203020201
DATA LCDATA1<>+0x030(SB)/8, $0x0302020102010100
DATA LCDATA1<>+0x038(SB)/8, $0x0403030203020201
GLOBL LCDATA1<>(SB), 8, $64

TEXT ·_x64count_avx2(SB), $0-24

	MOVQ data+0(FP), DI
	MOVQ len+8(FP), SI
	MOVQ result+16(FP), DX
	LEAQ LCDATA1<>(SB), BP

	LONG $0x0002c748; WORD $0x0000; BYTE $0x00 // mov    qword [rdx], 0
	WORD $0x8949; BYTE $0xf1                   // mov    r9, rsi
	LONG $0x06e9c149                           // shr    r9, 6
	WORD $0x8545; BYTE $0xc9                   // test    r9d, r9d
	JE   LBB0_6
	WORD $0x8944; BYTE $0xc8                   // mov    eax, r9d
	WORD $0xe0c1; BYTE $0x04                   // shl    eax, 4
	LONG $0xc0eff9c5                           // vpxor    xmm0, xmm0, xmm0
	LONG $0xc9eff1c5                           // vpxor    xmm1, xmm1, xmm1
	LONG $0xf6efc9c5                           // vpxor    xmm6, xmm6, xmm6
	LONG $0xef3941c4; BYTE $0xc0               // vpxor    xmm8, xmm8, xmm8
	LONG $0xffefc1c5                           // vpxor    xmm7, xmm7, xmm7
	LONG $0xd2efe9c5                           // vpxor    xmm2, xmm2, xmm2
	JE   LBB0_5
	WORD $0x8941; BYTE $0xc0                   // mov    r8d, eax
	LONG $0xe08f8d48; WORD $0x0001; BYTE $0x00 // lea    rcx, [rdi + 480]
	LONG $0xd2efe9c5                           // vpxor    xmm2, xmm2, xmm2
	WORD $0xc031                               // xor    eax, eax
	LONG $0x5d6ffdc5; BYTE $0x00               // vmovdqa    ymm3, yword 0[rbp] /* [rip + .LCPI0_0] */
	LONG $0x656ffdc5; BYTE $0x20               // vmovdqa    ymm4, yword 32[rbp] /* [rip + .LCPI0_1] */
	LONG $0xedefd1c5                           // vpxor    xmm5, xmm5, xmm5
	LONG $0xffefc1c5                           // vpxor    xmm7, xmm7, xmm7
	LONG $0xef3941c4; BYTE $0xc0               // vpxor    xmm8, xmm8, xmm8
	LONG $0xf6efc9c5                           // vpxor    xmm6, xmm6, xmm6
	LONG $0xc9eff1c5                           // vpxor    xmm1, xmm1, xmm1

LBB0_3:
	QUAD $0xfffffe20896f7dc5                   // vmovdqa    ymm9, yword [rcx - 480]
	QUAD $0xfffffe40916f7dc5                   // vmovdqa    ymm10, yword [rcx - 448]
	QUAD $0xfffffe60996f7dc5                   // vmovdqa    ymm11, yword [rcx - 416]
	QUAD $0xfffffe80a16f7dc5                   // vmovdqa    ymm12, yword [rcx - 384]
	LONG $0xefef35c5                           // vpxor    ymm13, ymm9, ymm7
	LONG $0xffdbb5c5                           // vpand    ymm7, ymm9, ymm7
	LONG $0xdb1541c4; BYTE $0xca               // vpand    ymm9, ymm13, ymm10
	LONG $0xffebb5c5                           // vpor    ymm7, ymm9, ymm7
	LONG $0xef1541c4; BYTE $0xca               // vpxor    ymm9, ymm13, ymm10
	LONG $0xef2541c4; BYTE $0xd1               // vpxor    ymm10, ymm11, ymm9
	LONG $0xdb2541c4; BYTE $0xc9               // vpand    ymm9, ymm11, ymm9
	LONG $0xdb2d41c4; BYTE $0xdc               // vpand    ymm11, ymm10, ymm12
	LONG $0xeb2541c4; BYTE $0xc9               // vpor    ymm9, ymm11, ymm9
	LONG $0xef2d41c4; BYTE $0xd4               // vpxor    ymm10, ymm10, ymm12
	LONG $0xdfef3dc5                           // vpxor    ymm11, ymm8, ymm7
	LONG $0xffdbbdc5                           // vpand    ymm7, ymm8, ymm7
	LONG $0xdb3541c4; BYTE $0xc3               // vpand    ymm8, ymm9, ymm11
	LONG $0xffebbdc5                           // vpor    ymm7, ymm8, ymm7
	LONG $0xef3541c4; BYTE $0xc3               // vpxor    ymm8, ymm9, ymm11
	QUAD $0xfffffea0896f7dc5                   // vmovdqa    ymm9, yword [rcx - 352]
	QUAD $0xfffffec0996f7dc5                   // vmovdqa    ymm11, yword [rcx - 320]
	LONG $0xef3541c4; BYTE $0xe2               // vpxor    ymm12, ymm9, ymm10
	LONG $0xdb3541c4; BYTE $0xca               // vpand    ymm9, ymm9, ymm10
	LONG $0xdb1d41c4; BYTE $0xd3               // vpand    ymm10, ymm12, ymm11
	LONG $0xeb2d41c4; BYTE $0xc9               // vpor    ymm9, ymm10, ymm9
	LONG $0xef1d41c4; BYTE $0xd3               // vpxor    ymm10, ymm12, ymm11
	QUAD $0xfffffee0996f7dc5                   // vmovdqa    ymm11, yword [rcx - 288]
	QUAD $0xffffff00a16f7dc5                   // vmovdqa    ymm12, yword [rcx - 256]
	LONG $0xef2541c4; BYTE $0xea               // vpxor    ymm13, ymm11, ymm10
	LONG $0xdb2541c4; BYTE $0xd2               // vpand    ymm10, ymm11, ymm10
	LONG $0xdb1541c4; BYTE $0xdc               // vpand    ymm11, ymm13, ymm12
	LONG $0xeb2541c4; BYTE $0xd2               // vpor    ymm10, ymm11, ymm10
	LONG $0xef1541c4; BYTE $0xdc               // vpxor    ymm11, ymm13, ymm12
	LONG $0xef3541c4; BYTE $0xe0               // vpxor    ymm12, ymm9, ymm8
	LONG $0xdb3541c4; BYTE $0xc0               // vpand    ymm8, ymm9, ymm8
	LONG $0xdb2d41c4; BYTE $0xcc               // vpand    ymm9, ymm10, ymm12
	LONG $0xeb3541c4; BYTE $0xc0               // vpor    ymm8, ymm9, ymm8
	LONG $0xef2d41c4; BYTE $0xd4               // vpxor    ymm10, ymm10, ymm12
	LONG $0xe6ef45c5                           // vpxor    ymm12, ymm7, ymm6
	LONG $0xf6dbc5c5                           // vpand    ymm6, ymm7, ymm6
	LONG $0xdb3dc1c4; BYTE $0xfc               // vpand    ymm7, ymm8, ymm12
	LONG $0xceeb45c5                           // vpor    ymm9, ymm7, ymm6
	LONG $0xef3dc1c4; BYTE $0xf4               // vpxor    ymm6, ymm8, ymm12
	QUAD $0xffffff20b96ffdc5                   // vmovdqa    ymm7, yword [rcx - 224]
	QUAD $0xffffff40816f7dc5                   // vmovdqa    ymm8, yword [rcx - 192]
	LONG $0xe7ef25c5                           // vpxor    ymm12, ymm11, ymm7
	LONG $0xffdba5c5                           // vpand    ymm7, ymm11, ymm7
	LONG $0xdb1d41c4; BYTE $0xd8               // vpand    ymm11, ymm12, ymm8
	LONG $0xffeba5c5                           // vpor    ymm7, ymm11, ymm7
	LONG $0xef1d41c4; BYTE $0xc0               // vpxor    ymm8, ymm12, ymm8
	QUAD $0xffffff60996f7dc5                   // vmovdqa    ymm11, yword [rcx - 160]
	LONG $0x616f7dc5; BYTE $0x80               // vmovdqa    ymm12, yword [rcx - 128]
	LONG $0xef2541c4; BYTE $0xe8               // vpxor    ymm13, ymm11, ymm8
	LONG $0xdb2541c4; BYTE $0xc0               // vpand    ymm8, ymm11, ymm8
	LONG $0xdb1541c4; BYTE $0xdc               // vpand    ymm11, ymm13, ymm12
	LONG $0xeb2541c4; BYTE $0xc0               // vpor    ymm8, ymm11, ymm8
	LONG $0xef1541c4; BYTE $0xdc               // vpxor    ymm11, ymm13, ymm12
	LONG $0xe7ef2dc5                           // vpxor    ymm12, ymm10, ymm7
	LONG $0xffdbadc5                           // vpand    ymm7, ymm10, ymm7
	LONG $0xdb3d41c4; BYTE $0xd4               // vpand    ymm10, ymm8, ymm12
	LONG $0xd7eb2dc5                           // vpor    ymm10, ymm10, ymm7
	LONG $0xef3d41c4; BYTE $0xc4               // vpxor    ymm8, ymm8, ymm12
	LONG $0x796ffdc5; BYTE $0xa0               // vmovdqa    ymm7, yword [rcx - 96]
	LONG $0x616f7dc5; BYTE $0xc0               // vmovdqa    ymm12, yword [rcx - 64]
	LONG $0xefef25c5                           // vpxor    ymm13, ymm11, ymm7
	LONG $0xffdba5c5                           // vpand    ymm7, ymm11, ymm7
	LONG $0xdb1541c4; BYTE $0xdc               // vpand    ymm11, ymm13, ymm12
	LONG $0xdfeb25c5                           // vpor    ymm11, ymm11, ymm7
	LONG $0xef15c1c4; BYTE $0xfc               // vpxor    ymm7, ymm13, ymm12
	LONG $0x616f7dc5; BYTE $0xe0               // vmovdqa    ymm12, yword [rcx - 32]
	LONG $0x296f7dc5                           // vmovdqa    ymm13, yword [rcx]
	LONG $0xf7ef1dc5                           // vpxor    ymm14, ymm12, ymm7
	LONG $0xffdb9dc5                           // vpand    ymm7, ymm12, ymm7
	LONG $0xdb0d41c4; BYTE $0xe5               // vpand    ymm12, ymm14, ymm13
	LONG $0xe7eb1dc5                           // vpor    ymm12, ymm12, ymm7
	LONG $0xef0dc1c4; BYTE $0xfd               // vpxor    ymm7, ymm14, ymm13
	LONG $0xef2541c4; BYTE $0xe8               // vpxor    ymm13, ymm11, ymm8
	LONG $0xdb2541c4; BYTE $0xc0               // vpand    ymm8, ymm11, ymm8
	LONG $0xdb1d41c4; BYTE $0xdd               // vpand    ymm11, ymm12, ymm13
	LONG $0xeb2541c4; BYTE $0xd8               // vpor    ymm11, ymm11, ymm8
	LONG $0xef1d41c4; BYTE $0xc5               // vpxor    ymm8, ymm12, ymm13
	LONG $0xe6ef2dc5                           // vpxor    ymm12, ymm10, ymm6
	LONG $0xf6dbadc5                           // vpand    ymm6, ymm10, ymm6
	LONG $0xdb2541c4; BYTE $0xd4               // vpand    ymm10, ymm11, ymm12
	LONG $0xd6eb2dc5                           // vpor    ymm10, ymm10, ymm6
	LONG $0xef25c1c4; BYTE $0xf4               // vpxor    ymm6, ymm11, ymm12
	LONG $0xd9ef35c5                           // vpxor    ymm11, ymm9, ymm1
	LONG $0xc9dbb5c5                           // vpand    ymm1, ymm9, ymm1
	LONG $0xdb2d41c4; BYTE $0xcb               // vpand    ymm9, ymm10, ymm11
	LONG $0xc9eb35c5                           // vpor    ymm9, ymm9, ymm1
	LONG $0xef2dc1c4; BYTE $0xcb               // vpxor    ymm1, ymm10, ymm11
	LONG $0x722dc1c4; WORD $0x04d1             // vpsrld    ymm10, ymm9, 4
	LONG $0xcbdb35c5                           // vpand    ymm9, ymm9, ymm3
	LONG $0x005d42c4; BYTE $0xc9               // vpshufb    ymm9, ymm4, ymm9
	LONG $0xd3db2dc5                           // vpand    ymm10, ymm10, ymm3
	LONG $0x005d42c4; BYTE $0xd2               // vpshufb    ymm10, ymm4, ymm10
	LONG $0xfc2d41c4; BYTE $0xc9               // vpaddb    ymm9, ymm10, ymm9
	LONG $0xcaf635c5                           // vpsadbw    ymm9, ymm9, ymm2
	LONG $0xedd4b5c5                           // vpaddq    ymm5, ymm9, ymm5
	LONG $0x10c08348                           // add    rax, 16
	LONG $0x00c18148; WORD $0x0002; BYTE $0x00 // add    rcx, 512
	WORD $0x394c; BYTE $0xc0                   // cmp    rax, r8
	JB   LBB0_3
	LONG $0xf573edc5; BYTE $0x04               // vpsllq    ymm2, ymm5, 4

LBB0_5:
	LONG $0xd172e5c5; BYTE $0x04   // vpsrld    ymm3, ymm1, 4
	LONG $0x656ffdc5; BYTE $0x00   // vmovdqa    ymm4, yword 0[rbp] /* [rip + .LCPI0_0] */
	LONG $0xccdbf5c5               // vpand    ymm1, ymm1, ymm4
	LONG $0x6d6ffdc5; BYTE $0x20   // vmovdqa    ymm5, yword 32[rbp] /* [rip + .LCPI0_1] */
	LONG $0x0055e2c4; BYTE $0xc9   // vpshufb    ymm1, ymm5, ymm1
	LONG $0xdcdbe5c5               // vpand    ymm3, ymm3, ymm4
	LONG $0x0055e2c4; BYTE $0xdb   // vpshufb    ymm3, ymm5, ymm3
	LONG $0xc9fce5c5               // vpaddb    ymm1, ymm3, ymm1
	LONG $0xc8f6f5c5               // vpsadbw    ymm1, ymm1, ymm0
	LONG $0xf173f5c5; BYTE $0x03   // vpsllq    ymm1, ymm1, 3
	LONG $0xcad4f5c5               // vpaddq    ymm1, ymm1, ymm2
	LONG $0xd672edc5; BYTE $0x04   // vpsrld    ymm2, ymm6, 4
	LONG $0xdcdbcdc5               // vpand    ymm3, ymm6, ymm4
	LONG $0x0055e2c4; BYTE $0xdb   // vpshufb    ymm3, ymm5, ymm3
	LONG $0xd4dbedc5               // vpand    ymm2, ymm2, ymm4
	LONG $0x0055e2c4; BYTE $0xd2   // vpshufb    ymm2, ymm5, ymm2
	LONG $0xd3fcedc5               // vpaddb    ymm2, ymm2, ymm3
	LONG $0xd0f6edc5               // vpsadbw    ymm2, ymm2, ymm0
	LONG $0xf273edc5; BYTE $0x02   // vpsllq    ymm2, ymm2, 2
	LONG $0x7265c1c4; WORD $0x04d0 // vpsrld    ymm3, ymm8, 4
	LONG $0xf4dbbdc5               // vpand    ymm6, ymm8, ymm4
	LONG $0x0055e2c4; BYTE $0xf6   // vpshufb    ymm6, ymm5, ymm6
	LONG $0xdcdbe5c5               // vpand    ymm3, ymm3, ymm4
	LONG $0x0055e2c4; BYTE $0xdb   // vpshufb    ymm3, ymm5, ymm3
	LONG $0xdefce5c5               // vpaddb    ymm3, ymm3, ymm6
	LONG $0xd8f6e5c5               // vpsadbw    ymm3, ymm3, ymm0
	LONG $0xdbd4e5c5               // vpaddq    ymm3, ymm3, ymm3
	LONG $0xd3d4edc5               // vpaddq    ymm2, ymm2, ymm3
	LONG $0xcad4f5c5               // vpaddq    ymm1, ymm1, ymm2
	LONG $0xd772edc5; BYTE $0x04   // vpsrld    ymm2, ymm7, 4
	LONG $0xdcdbc5c5               // vpand    ymm3, ymm7, ymm4
	LONG $0x0055e2c4; BYTE $0xdb   // vpshufb    ymm3, ymm5, ymm3
	LONG $0xd4dbedc5               // vpand    ymm2, ymm2, ymm4
	LONG $0x0055e2c4; BYTE $0xd2   // vpshufb    ymm2, ymm5, ymm2
	LONG $0xd3fcedc5               // vpaddb    ymm2, ymm2, ymm3
	LONG $0xc0f6edc5               // vpsadbw    ymm0, ymm2, ymm0
	LONG $0xc0d4f5c5               // vpaddq    ymm0, ymm1, ymm0
	LONG $0xc870f9c5; BYTE $0xee   // vpshufd    xmm1, xmm0, 238
	LONG $0x397de3c4; WORD $0x01c2 // vextracti128    xmm2, ymm0, 1
	LONG $0x00fde3c4; WORD $0xffd8 // vpermq    ymm3, ymm0, 255
	LONG $0xc1d4f9c5               // vpaddq    xmm0, xmm0, xmm1
	LONG $0xcbd4e9c5               // vpaddq    xmm1, xmm2, xmm3
	LONG $0xc1d4f9c5               // vpaddq    xmm0, xmm0, xmm1
	LONG $0x02d6f9c5               // vmovq    qword [rdx], xmm0

LBB0_6:
	LONG $0x06e1c141                       // shl    r9d, 6
	WORD $0x3941; BYTE $0xf1               // cmp    r9d, esi
	JAE  LBB0_9
	QUAD $0x333333333333b848; WORD $0x3333 // mov    rax, 3689348814741910323
	WORD $0x6349; BYTE $0xc9               // movsxd    rcx, r9d
	LONG $0xcf0c8d48                       // lea    rcx, [rdi + 8*rcx]
	QUAD $0x555555555555b849; WORD $0x5555 // mov    r8, 6148914691236517205
	QUAD $0x0f0f0f0f0f0fba49; WORD $0x0f0f // mov    r10, 1085102592571150095
	QUAD $0x010101010101bb49; WORD $0x0101 // mov    r11, 72340172838076673

LBB0_8:
	WORD $0x8b48; BYTE $0x39 // mov    rdi, qword [rcx]
	WORD $0x8948; BYTE $0xfb // mov    rbx, rdi
	WORD $0xd148; BYTE $0xeb // shr    rbx, 1
	WORD $0x214c; BYTE $0xc3 // and    rbx, r8
	WORD $0x2948; BYTE $0xdf // sub    rdi, rbx
	WORD $0x8948; BYTE $0xfb // mov    rbx, rdi
	WORD $0x2148; BYTE $0xc3 // and    rbx, rax
	LONG $0x02efc148         // shr    rdi, 2
	WORD $0x2148; BYTE $0xc7 // and    rdi, rax
	WORD $0x0148; BYTE $0xdf // add    rdi, rbx
	WORD $0x8948; BYTE $0xfb // mov    rbx, rdi
	LONG $0x04ebc148         // shr    rbx, 4
	WORD $0x0148; BYTE $0xfb // add    rbx, rdi
	WORD $0x214c; BYTE $0xd3 // and    rbx, r10
	LONG $0xdbaf0f49         // imul    rbx, r11
	LONG $0x38ebc148         // shr    rbx, 56
	WORD $0x0148; BYTE $0x1a // add    qword [rdx], rbx
	LONG $0x08c18348         // add    rcx, 8
	LONG $0x01c18341         // add    r9d, 1
	WORD $0x3941; BYTE $0xf1 // cmp    r9d, esi
	JB   LBB0_8

LBB0_9:
	VZEROUPPER
	RET