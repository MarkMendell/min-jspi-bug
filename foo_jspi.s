	.text

	.functype	foo (i32) -> (i32)
	.functype	foo_promising (externref, i32) -> (i32)

	.section .data.suspender,"",@
	.globaltype	suspender, externref
	.globl	suspender
suspender:

	.section	.text.foo_promising,"",@
	.globl	foo_promising
	.type	foo_promising,@function
foo_promising:
	.functype	foo_promising (externref, i32) -> (i32)
	local.get	0
	global.set	suspender
	local.get 1
	call	foo
	return
	end_function
