; ssize_t ft_write(int filedes, const void* buf, size_t nbyte) {
; 	syscall(SYS_write, filedes, buf, nbyte);
; }

extern __errno_location ; external function from standard c library

section .text
global ft_write
ft_write:
	mov rax, 1
	syscall
	cmp rax, 0
	jge .success ; return_value >= 0
.fail:
	mov rbx, rax ; rbx is preserved
	neg rbx
	call __errno_location wrt ..plt ; PIE-supporting
	mov [rax], rbx ; set errno
	mov rax, -1
	jmp .done
.success:
	mov rax, 0
.done:
	ret
