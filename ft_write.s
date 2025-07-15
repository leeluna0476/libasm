; syscall number 1: /usr/include/bits/syscall.h

; ssize_t write(int filedes, void *buf, size_t nbytes);
; RETURN VALUES:
; 	if successful, the number of bytes actually written is returned.
; 	else, -1 is returned. (and errno is set.)

%include "libasm.inc"

extern __errno_location ; external function from standard c library

section .text
global ft_write
ft_write:
	procedure_start
	mov rax, 1
	syscall
	cmp rax, 0
	jge .done
	push rax
	sub rsp, 8
	call __errno_location wrt ..plt
	add rsp, 8
	pop rcx
	neg rcx
	mov [rax], rcx
	mov rax, -1
.done:
	procedure_end
	ret
