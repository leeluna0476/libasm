; size_t ft_strlen(const char* s) {
;	size_t	cnt = 0;
;	while (s[cnt]) {
;		++cnt;
;	}
;
;	return cnt;
;}

section .text
global ft_strlen
ft_strlen:
	xor rcx, rcx
.loop:
	mov dl, [rdi + rcx]
	cmp dl, 0
	je .done
	inc rcx
	jmp .loop
.done:
	mov rax, rcx
	ret
