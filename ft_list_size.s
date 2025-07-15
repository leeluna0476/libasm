; typedef struct s_list
; {
; 	void			*data;
; 	struct s_list	*next;
; }	t_list;
;
; int	ft_list_size(t_list *begin_list) {
; 	int	size = 0;
; 	while (begin_list) {
; 		begin_list = begin_list->next;
; 		++size;
; 	}
; 
; 	return size;
; }

%include "libasm.inc"

section .text
global ft_list_size
ft_list_size:
	procedure_start
	xor ecx, ecx
.loop:
	cmp QWORD rdi, 0
	je .done
	mov rdi, [rdi + 8]
	inc ecx
	jmp .loop
.done:
	mov eax, ecx
	procedure_end
	ret
