	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	name
	.section	.rodata
.LC0:
	.string	"Anonimus"
.LC1:
	.string	"No name provided"
.LC2:
	.string	"Error: %s"
.LC3:
	.string	"Hello %s"
	.section	.data.rel.local,"aw"
	.align 8
	.type	name, @object
	.size	name, 8
name:
	.quad	.LC0
	.section	.rodata	
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	cmp	DWORD PTR -20[rbp], 2
	je	.L2
	lea	rax, .LC1[rip]
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edi, -1
	call	exit@PLT
.L2:
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR name[rip], rax
	mov	rax, QWORD PTR name[rip]
	mov	rdi, rax
	call	strlen@PLT
	mov	DWORD PTR -4[rbp], eax
	mov	rax, QWORD PTR name[rip]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edi, 0
	call	exit@PLT
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
