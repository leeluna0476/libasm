; char*	ft_strdup(const char *s1) {
; 	size_t	s1_len = ft_strlen(s1);
; 	char	*copy = malloc(s1_len + 1);
; 	if (copy) {
; 		ft_strcpy(copy, s1);
; 	}
; 	return copy;
; }
;
; The strdup() function allocates sufficient memory for a copy of the string s1, does the copy, and returns a pointer to it.
; If insufficient memory is available, NULL is returned and errno is set to ENOMEM. (malloc sets errno)

extern ft_strlen
extern malloc
extern ft_strcpy

section .text
global ft_strdup
ft_strdup:
	push rbp
	mov rbp, rsp
	call ft_strlen
	push rdi
	inc rax
	mov rdi, rax
	sub rsp, 8
	call malloc wrt ..plt
	add rsp, 8
	pop rsi
	cmp rax, 0
	je .done
	mov rdi, rax
	call ft_strcpy
.done:
	pop rbp
	ret
