; void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(void *, void *), void (*free_fct)(void *)) {
; 	while (*begin_list && !(*cmp)((*begin_list)->data, data_ref)) {
; 		t_list	*remove = *begin_list;
; 		*begin_list = remove->next;
; 		(*free_fct)(remove->data);
; 		free(remove);
; 	}
; 
; 	t_list	*previous = *begin_list;
; 	if (previous) {
; 		t_list	*curr = previous->next;
; 		while (curr) {
; 			if (!(*cmp)(curr->data, data_ref)) {
; 				previous->next = curr->next;
; 				(*free_fct)(curr->data);
; 				free(curr);
; 				curr = previous->next;
; 			} else {
; 				previous = curr;
; 				curr = curr->next;
; 			}
; 		}
; 	}
; }
; 

%include "libasm.inc"

extern free

section .text
global ft_list_remove_if
ft_list_remove_if:
	procedure_start
	sub rsp, 32
	mov [rbp - 8], rdi
	mov [rbp - 16], rsi
	mov [rbp - 24], rdx
	mov [rbp - 32], rcx
.loop_remove_first_nodes_cond:
	mov rax, [rbp - 8]
	mov rax, [rax]
	cmp rax, 0
	je .end_remove_first_nodes_cond
	mov rdi, [rax]
	mov rsi, [rbp - 16]
	call [rbp - 24] ; call cmp
	cmp rax, 0
	jne .end_remove_first_nodes_cond
	mov rax, [rbp - 8] ; begin_list
	mov rbx, [rax] ; *begin_list
	mov rcx, [rbx + 8] ; (*begin_list)->next
	mov [rax], rcx ; *begin_list = rcx
	mov rdi, [rbx] ; (*begin_list)->data
	call [rbp - 32] ; call free_fct
	mov rdi, rbx
	call free wrt ..plt
	jmp .loop_remove_first_nodes_cond
.end_remove_first_nodes_cond:
	mov rax, [rbp - 8] ; begin_list
	mov rax, [rax] ; previous init
	cmp rax, 0
	je .done
	mov rbx, [rax + 8] ; curr init
	push rax ; previous
	push rbx ; curr
.loop_remove_nodes_left_cond:
	cmp rbx, 0
	je .done
	mov rdi, [rbp - 48]
	mov rdi, [rdi]
	mov rsi, [rbp - 16]
	call [rbp - 24]
	cmp rax, 0
	jne .skip_node
	mov rbx, [rbp - 40] ; previous
	mov rcx, [rbp - 48] ; curr
	mov rax, [rcx + 8] ; curr->next
	mov [rbx + 8], rax ; previous->next = curr->next
	mov rdi, [rcx]
	call [rbp - 32] ; free_fct
	mov rdi, rcx
	call free wrt ..plt
	mov rbx, [rbp - 40]
	mov rbx, [rbx + 8]
	mov [rbp - 48], rbx ; curr = previous->next
	jmp .loop_remove_nodes_left_cond
.skip_node:
	mov rbx, [rbp - 48] ; curr
	mov [rbp - 40], rbx ; previous = curr
	mov rbx, [rbx + 8] ; curr->next
	mov [rbp - 48], rbx ; curr = curr->next
	jmp .loop_remove_nodes_left_cond
.done:
	mov rsp, rbp
	procedure_end
	ret

; STACK FRAME
; |curr          |rbp - 48|
; |previous      |rbp - 40|
; |free_fct      |rbp - 32|
; |cmp           |rbp - 24|
; |data_ref      |rbp - 16|
; |begin_list    |rbp -  8|
; |previous rbp  |rbp     |
; |return address|rbp +  8|
