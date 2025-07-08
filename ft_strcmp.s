; int ft_strcmp(const char* s1, const char* s2) {
;	size_t i = 0;
; 	while (s1[i] && s2[i] && s1[i] == s2[i]) {
; 		++i;
; 	}
; 	return s1[i] - s2[i];
; }

section .text
global ft_strcmp
ft_strcmp:
	xor rcx, rcx
.loop:
	mov dl, [rdi + rcx]
	cmp dl, 0
	je .done
	mov dh, [rsi + rcx]
	cmp dh, 0
	je .done
	cmp dl, dh
	jne .done
	inc rcx
	jmp .loop
.done:
	sub dl, dh
	movsx rax, dl
	ret
