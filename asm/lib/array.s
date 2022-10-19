    .intel_syntax noprefix

    .text
    .global create_array
    .global input_array
    .global print_array

msg_malloc_err:
    .string "Memory allocation error!\n"

# input: rax - bytes to reserve
# output: rdi - addr of array[0]
create_array:
    push rcx
    push rdx
    mov rdx, rax

    mov rax, 12                     # 12 - sys_brk - for heap memory allocation
    xor rdi, rdi
    syscall

    cmp rax, 0
    jl .malloc_err                         # if error - exit
    mov rcx, rdx
    lea rdi, [rcx + rax]            # new momory addr now stored in rdi
    mov rax, 12                     # sys_brk
    syscall
    pop rdx
    pop rcx
    ret


# input: rax - length of array
# input: rdi - addr of array[0]
# output: rdi - addr of array[0]
input_array:
    push rcx
    push rax
    push rbx
    mov rcx, rax
    
    xor rbx, rbx
    .arr_lp_rd_it:
        cmp rbx, rcx
        jge .arr_lp_rd_ex
        call input_number
        mov [rdi + rbx * 8], rax
        inc rbx
        jmp .arr_lp_rd_it
    .arr_lp_rd_ex:
        pop rbx
        pop rax
        pop rcx
        ret

# input: rax - length of array
# input: rdi - addr of array[0]
# output: none
print_array:
    push rcx
    push rbx
    mov rcx, rax

    xor rbx, rbx
    .arr_lp_prt_it:
        cmp rbx, rcx
        jge .arr_lp_prt_ex
        mov rax, [rdi + rbx * 8]
        call print_number
        mov rax, ' '
        call print_char
        inc rbx
        jmp .arr_lp_prt_it
    .arr_lp_prt_ex:
        call print_line
        pop rbx
        pop rcx
        ret

.malloc_err:
    mov rax, offset msg_malloc_err
    call print_string
    mov rax, 60
    mov rdi, 0
    syscall
