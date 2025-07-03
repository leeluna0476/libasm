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
	mov dl, [rdi + rcx] ; mov a single byte
	cmp dl, 0
	je .done ; if cmp -> 0
	inc rcx
	jmp .loop
.done:
	mov rax, rcx
	ret
