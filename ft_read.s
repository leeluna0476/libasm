; syscall number 0: /usr/include/bits/syscall.h

; ssize_t read(int filedes, void *buf, size_t nbytes);
; RETURN VALUES:
; 	if successful, the number of bytes actually read is returned.
; 	else, -1 is returned. (and errno is set.)

extern __errno_location ; external function from standard c library

section .text
global ft_read
ft_read:
	push rbp
	mov rbp, rsp
	mov rax, 0
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
	pop rbp
	ret
