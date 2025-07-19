; void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(void *, void *), void (*free_fct)(void *)) {
; 	while (*begin_list) {
; 		if (!(*cmp)((*begin_list)->data, data_ref)) {
; 			t_list	*remove = *begin_list;
; 			*begin_list = remove->next;
; 			(*free_fct)(remove->data);
; 			free(remove);
; 		} else {
; 			begin_list = &((*begin_list)->next); // *begin_list + 8
; 		}
; 	}
; }

%include "libasm.inc"

extern free

section .text
global ft_list_remove_if
ft_list_remove_if:
	procedure_start
	sub rsp, 40
	mov [rbp - 8], rdi
	mov [rbp - 16], rsi
	mov [rbp - 24], rdx
	mov [rbp - 32], rcx
	mov [rbp - 40], rdi
.loop:
	mov rdx, [rbp - 40]
	mov rdx, [rdx]
	cmp rdx, 0
	je .done
	mov rdi, [rdx]
	mov rsi, [rbp - 16]
	sub rsp, 8
	call [rbp - 24] ; call cmp
	add rsp, 8
	mov rdx, [rbp - 40] ; next_position
	mov rcx, [rdx] ; bg
	cmp rax, 0
	jne .skip_node
	push rcx ; preserve current bg
	mov rdi, [rcx] ; bg->data
	mov rcx, [rcx + 8] ; bg->next
	mov [rdx], rcx ; update bg to bg->next
	sub rsp, 8
	call [rbp - 32] ; call free_fct
	add rsp, 8
	pop rdi
	call free wrt ..plt
	jmp .loop
.skip_node:
	add rcx, 8
	mov [rbp - 40], rcx ; update next_position
	jmp .loop
.done:
	mov rsp, rbp
	procedure_end
	ret

; STACK FRAME
; |next_position |rbp - 40|
; |free_fct      |rbp - 32|
; |cmp           |rbp - 24|
; |data_ref      |rbp - 16|
; |begin_list    |rbp -  8|
; |previous rbp  |rbp     |
; |return address|rbp +  8|
