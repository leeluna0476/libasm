; char* ft_strcpy(const char* dst, const char* src) {
; 	size_t i = 0;
; 	while (src[i]) {
; 		dst[i] = src[i];
; 		++i;
; 	}
; 	dst[i] = '\0';
; 	return dst;
; }

section .text
global ft_strcpy
ft_strcpy:
	xor rcx, rcx
.loop:
	mov dl, [rsi + rcx]
	cmp dl, 0
	je .done
	mov BYTE [rdi + rcx], dl
	inc rcx
	jmp .loop
.done:
	mov BYTE [rdi + rcx], 0
	mov rax, rdi
	ret
