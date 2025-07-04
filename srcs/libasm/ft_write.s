; ssize_t write(int filedes, const void* buf, size_t nbyte); // syscall number = 1

extern __errno_location ; external function from standard c library

section .text
global ft_write
ft_write:
	mov rax, 1 ; set the syscall number
	syscall
	cmp rax, 0
	jge .done ; return_value >= 0
	mov rbx, rax ; rbx is preserved
	neg rbx
	call __errno_location wrt ..plt ; PIE-supporting
	mov [rax], rbx ; set errno
	mov rax, -1
	jmp .done
.done:
	ret
