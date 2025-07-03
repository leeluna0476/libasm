; int ft_strcmp(const char* s1, const char* s2) {
;	size_t i = 0;
; 	while (s1[i] && s2[i]) {
; 		if (s1[i] != s2[i]) {
; 			break;
; 		}
; 		++i;
; 	}
; 	return s1[i] - s2[i];
; }

section .text
global ft_strcmp
ft_strcmp:
	xor rcx, rcx
.loop:
	mov dl, [rdi + rcx] ; mov a single byte
	cmp dl, 0 ; if dl == 0
	je .done ; break
	mov dh, [rsi + rcx] ; mov a single byte
	cmp dh, 0 ; if dh == 0
	je .done ; break
	cmp dl, dh ; if dl != dh
	jne .done ; break
	inc rcx
	jmp .loop
.done:
	sub dl, dh
	movsx rax, dl
	ret
