    .intel_syntax noprefix
    .text
    .global string_to_num
    .global length_string
    .global number_to_string
    .global compare_strings

# input: rax - string 
# output: rax - number
string_to_num:
    push rbx
    push rcx
    push rdx
    push rsi
    xor rbx, rbx
    xor rcx, rcx
    xor rsi, rsi
    .s2n_next_iter:
        cmp byte ptr [rax+rbx], 0
        je .s2n_next_step
        mov cl, [rax+rbx]
        cmp cl, '-'
        jne .s2n_neg_num
        mov rsi, 1
        inc rbx
        jmp .s2n_next_iter
        .s2n_neg_num:
            sub cl, '0'
            push rcx
            inc rbx
            jmp .s2n_next_iter
    .s2n_next_step:
        mov rcx, 1
        xor rax, rax
        cmp rsi, 1
        jne .s2n_to_number
        dec rbx
    .s2n_to_number:
        cmp rbx, 0
        je .s2n_close
        pop rdx
        imul rdx, rcx
        imul rcx, 10
        add rax, rdx
        dec rbx
        jmp .s2n_to_number
    .s2n_close:
        cmp rsi, 0
        je .s2n_pos_num
        neg rax
        .s2n_pos_num:
            pop rsi
            pop rdx
            pop rcx
            pop rbx
            ret


# input: rax - first string
# input: rbx - second string
# output: rax: 1 if equal 0 if not
compare_strings:
    push rcx
    push rdx
    push rsi
    mov rsi, rax
    call length_string  # get length of first string
    mov r8, rax         # save value into r8
    mov rax, rbx       
    call length_string  # get length of second string
    mov r9, rax         # save value into r9
    cmp r8, r9
    jne .scmp_false
    xor rdx, rdx        # counter
    .scmp_loop:
        cmp rdx, r8
        jge .scmp_true
        mov al, byte ptr [rsi + rdx] # get string1[counter]
        mov cl, byte ptr [rbx + rdx] # get string2[counter]
        cmp al, cl
        jne .scmp_false
        inc rdx
        jmp .scmp_loop

    .scmp_true:
        mov rax, 1
        jmp .scmp_ret

    .scmp_false:
        xor rax, rax
        jmp .scmp_ret

    .scmp_ret:
        pop rsi
        pop rdx
        pop rcx
        ret

# input: rax - string
# output: rax - length
length_string:
    push rbx            # save to stack
    push rdx            # save to stack
    xor rdx, rdx        # make rdx null
    .len_next_iter:    
        mov bl, byte ptr [rax + rdx]     
        cmp bl, 0      # compare current char to null
        je .len_close
        inc rdx
        jmp .len_next_iter
    .len_close:
        mov rax, rdx    # save result to rax
        pop rdx
        pop rbx
        ret

# input: rax - number
# input: rbx - buffer
# input: rcx - buffer size
number_to_string:
    push r12
    push rax
    push rbx
    push rcx
    push rdx
    push rsi
    mov rsi, rcx
    xor rcx, rcx
    mov r12, rax
    cmp rax, 0
    jl .n2s_neg
    jmp .n2s_next_iter
    .n2s_neg:
        neg rax
    .n2s_next_iter:
        push rbx
        mov rbx, 10
        xor rdx, rdx
        div rbx
        pop rbx
        add rdx, '0'
        push rdx
        inc rcx
        cmp rax, 0
        je .n2s_next_step
        jmp .n2s_next_iter
    .n2s_next_step:
        mov rdx, rcx
        xor rcx, rcx
        cmp r12, 0
        jge .n2s_to_string
        mov byte ptr [rbx], '-'
        inc rcx
        inc rdx
    .n2s_to_string:
        cmp rcx, rsi
        je .n2s_pop_iter
        cmp rcx, rdx
        je .n2s_null_char
        pop rax
        mov [rbx+rcx], rax
        inc rcx
        jmp .n2s_to_string
    .n2s_pop_iter:
        cmp rcx, rdx
        je .n2s_close
        pop rax
        inc rcx
        jmp .n2s_pop_iter
    .n2s_null_char:
        mov rsi, rdx
    .n2s_close:
        mov byte ptr [rbx+rsi], 0
        pop rsi
        pop rdx
        pop rcx
        pop rbx
        pop rax
        pop r12
        ret
