	.text
	.file	"factorial.ll"
	.globl	factorialint                    # -- Begin function factorialint
	.p2align	4, 0x90
	.type	factorialint,@function
factorialint:                           # @factorialint
	.cfi_startproc
# %bb.0:                                # %.label0
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movl	$0, 8(%rsp)
	movl	%edi, 12(%rsp)
	testl	%edi, %edi
	je	.LBB0_1
# %bb.2:                                # %.label2
	movl	12(%rsp), %ebx
	leal	-1(%rbx), %edi
	callq	factorialint@PLT
	imull	%ebx, %eax
	movl	%eax, 8(%rsp)
	jmp	.LBB0_3
.LBB0_1:                                # %.label1
	movl	$1, 8(%rsp)
.LBB0_3:                                # %return
	movl	8(%rsp), %eax
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	factorialint, .Lfunc_end0-factorialint
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %.label0
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	8(%rsi), %rdi
	callq	atoi@PLT
	movl	%eax, 4(%rsp)
	movl	%eax, %edi
	callq	factorialint@PLT
	movl	$.L.fmtstr_d, %edi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L.fmtstr_true,@object          # @.fmtstr_true
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.fmtstr_true:
	.asciz	"true\n"
	.size	.L.fmtstr_true, 6

	.type	.L.fmtstr_false,@object         # @.fmtstr_false
.L.fmtstr_false:
	.asciz	"false\n"
	.size	.L.fmtstr_false, 7

	.type	.L.fmtstr_d,@object             # @.fmtstr_d
.L.fmtstr_d:
	.asciz	"%d\n"
	.size	.L.fmtstr_d, 4

	.type	.L.fmtstr_g,@object             # @.fmtstr_g
.L.fmtstr_g:
	.asciz	"%.08F\n"
	.size	.L.fmtstr_g, 7

	.type	.L.fmtstr_s,@object             # @.fmtstr_s
.L.fmtstr_s:
	.asciz	"%s\n"
	.size	.L.fmtstr_s, 4

	.section	".note.GNU-stack","",@progbits
