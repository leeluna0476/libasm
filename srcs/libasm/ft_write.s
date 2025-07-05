; ssize_t write(int filedes, const void* buf, size_t nbyte); // syscall number = 1

extern __errno_location ; external function from standard c library

section .text
global ft_write
ft_write:
	mov rax, 1 ; set the syscall number
	syscall
	cmp rax, 0
	jge .done ; rax >= 0
	push rax ; rax: caller-saved. might be overwritten after a func call.
	call __errno_location wrt ..plt ; PIE-supporting
	pop rcx ; rcx: caller-saved. can be used as a temp storage.
	neg rcx
	mov [rax], rcx ; set errno.
	mov rax, -1
.done:
	ret
