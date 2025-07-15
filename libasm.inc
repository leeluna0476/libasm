%ifndef LIBASM_INC
%define LIBASM_INC

%macro procedure_start 0
	push rbp
	mov rbp, rsp
%endmacro

%macro procedure_end 0
	pop rbp
%endmacro

; size: t_list_size
struc t_list
	.data resq 1
	.next resq 1
endstruc

%endif
