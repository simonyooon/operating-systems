	.text				#See tas.S (32-bit version) for
.globl _tas				#other comments
	// .type	_tas,@function
_tas:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$1, %rax
	lock;xchgb	%al,(%rdi)	#arg1 is in the rdi register
	movsbq	%al,%rax		#sign-extend result into rax
	pop	%rbp
	ret				#rax contains the return value
// .Lfe1:
// 	.size	tas,.Lfe1-tas