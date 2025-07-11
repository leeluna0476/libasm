; typedef struct s_list
; {
; 	void			*data;
; 	struct s_list	*next;
; }	t_list;
;
; void	ft_list_push_front(t_list **begin_list, void *data) {
; 	t_list	next_node = NULL;
; 	if (*begin_list) {
; 		next_node = *begin_list;
; 	}
; 
; 	*begin_list = malloc(sizeof(t_list));
; 	if (*begin_list) {
; 		(*begin_list)->data = data;
; 		(*begin_list)->next = next_node;
; 	}
; }

extern malloc

section .text
global ft_list_push_front
ft_list_push_front:
	push rbp
	mov rbp, rsp
	mov rdx, 0
	cmp QWORD [rdi], 0
	je .create
.preserve:
	mov rdx, [rdi]
.create:
	push rdx
	push rdi
	push rsi
	sub rsp, 8
	mov rdi, 16
	call malloc wrt ..plt
	add rsp, 8
	pop rsi
	pop rdi
	pop rdx
	mov [rdi], rax
	cmp rax, 0
	je .done
	mov [rax], rsi
	mov [rax + 8], rdx
.done:
	pop rbp
	ret
