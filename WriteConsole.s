.intel_syntax noprefix

.global main

.data
msg:
.asciz "Hello, world!"

msgend:
.set msglen, msgend - msg

.equ stdoutv, -11

.comm handle, 8, 3
.comm written, 8, 3

.text
main:
	xor rcx, rcx
	mov rcx, stdoutv
	call GetStdHandle
	mov QWORD PTR handle[RIP], rax
	mov rcx, QWORD PTR handle[RIP]	
	lea rdx, msg[RIP]
	mov r8, msglen
	mov r9, written[RIP]
	push 0
	call WriteConsoleA
	mov ecx, 0
	call ExitProcess
	