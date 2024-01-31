	.file	"_main.c"			
	.intel_syntax noprefix
	.text
	.globl	name						; global specifier for name variable
	.section	.rodata					; Section specification
.LC0:
	.string	"Anonimus"					; String Constant
	.section	.data.rel.local,"aw"	
	.align 8					
	.type	name, @object	
	.size	name, 8
name:
	.quad	.LC0						; name global variable, initialized with .LC0's pointer
	.section	.rodata
.LC1:
	.string	"No name provided"			; String Constant
.LC2:
	.string	"Error: %s"					; String Constant
.LC3:
	.string	"Hello %s"					; String Constant
	.text
	.globl	main
	.type	main, @function
main:									; Start of main function
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16				; Debug information
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32							; Allocate space for variable 
	mov	DWORD PTR -20[rbp], edi			; Put argc in len var
	mov	QWORD PTR -32[rbp], rsi
	cmp	DWORD PTR -20[rbp], 2			; Compare len with 2
	je	.L2								; If condition, Fail branch next
	lea	rax, .LC1[rip]					; Get pointers to string constants
	mov	rsi, rax					
	lea	rax, .LC2[rip]					; Get pointers to string constants
	mov	rdi, rax
	mov	eax, 0							
	call	printf@PLT					; Call to printf
	mov	edi, -1							
	call	exit@PLT					; Call to exit
.L2:									; Success branch
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
