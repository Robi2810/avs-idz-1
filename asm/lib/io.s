    .intel_syntax noprefix

    .bss
    .lcomm _char_buffer, 1
    .equ _str_buffer_size, 4096
    .lcomm _str_buffer, _str_buffer_size


    .text
    .global print_char
    .global print_number
    .global print_line
    .global print_string
    .global input_string
    .global input_number
    .global _str_buffer
    .global file_open
    .global file_read_line
    .global file_write_line
    .global file_close
    .global file_create

# output: rax - number
input_number:
    call input_string
    mov rax, offset _str_buffer
    call string_to_num
    ret

# output: _str_buffer - string
input_string:
    push rax
    push rbx
    push rcx
    push rdx
    push rsi
    push rdi

    mov rsi, offset _str_buffer
    mov rdx, _str_buffer_size
    mov rax, 0
    mov rdi, 0
    syscall

    mov byte ptr [rsi+rax-1], 0

    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop rbx
    pop rax
    ret

# input: rax - number to print
print_number:
    push rax
    push rbx
    push rcx
    push rdx
    xor rcx, rcx
    cmp rax, 0
    jl .num_is_minus            # if number is negative
    jmp .num_next_iter
    .num_is_minus:
        neg rax                 # make it positive
        push rax
        mov rax, '-'            # just add '-' before number
        call print_char
        pop rax
    .num_next_iter:
        mov rbx, 10
        xor rdx, rdx
        div rbx
        add rdx, '0'            # convert number to char to print
        push rdx
        inc rcx
        cmp rax, 0
        je .num_print_iter
        jmp .num_next_iter
    .num_print_iter:
        cmp rcx, 0
        je .num_close
        pop rax
        call print_char
        dec rcx
        jmp .num_print_iter
    .num_close:
        pop rdx
        pop rcx
        pop rbx
        pop rax
        ret

# input: rax - string to print
print_string:
    push rcx
    push rdi
    push rsi
    push rdx
    mov rcx, rax        # rax - input string save it to rcx
    call length_string  # get length of string and save it to rax
    mov rdx, rax        # move length to rdx
    mov rax, 1      # write
    mov rdi, 1      # stdout
    mov rsi, rcx    # string addr   
    syscall
    pop rdx
    pop rsi
    pop rdi
    pop rcx
    ret

# input: rax - char to print
print_char:
    push rax
    push rdi
    push rcx
    push rdx

    mov [_char_buffer], al

    mov rax, 1
    mov rdi, 1
    mov rsi, offset _char_buffer
    mov rdx, 1
    syscall
    pop rdx
    pop rcx
    pop rdi
    pop rax
    ret

# input: none
print_line:
    push rax
    push rbx
    push rcx
    push rcx
    mov rax, 0xA
    call print_char
    pop rdx
    pop rcx
    pop rbx
    pop rax
    ret

# input: rax - filename
# input: rbx - mode
# output: rax - error code if any or file desc
file_open:
    push rdx
    mov rdi, rax                    # filename
    mov rax, 2                      # open                    
    mov rsi, rbx                    # mode
    mov rdx, 436                    # -rw-rw-r--
    syscall
    pop rdx
    ret

# input: rax - file desc
# output: _str_buffer - data
file_read_line:
    push r12
    push r13
    push r14
    push rcx
    push rdx
    mov r12, rax
    mov r14, offset _str_buffer
    xor r13, r13
    .rd_ch_lp:                          # reading 1 byte and checking if it is eol
        mov rdi, r12                    # file
        mov rax, 0                      # read
        mov rsi, offset _char_buffer    # buffer
        mov rdx, 1                      # number of bytes to read
        syscall
        mov rax, _char_buffer
        cmp rax, 0xA
        je .rd_ch_lp_ex
        mov [r14 + r13], rax            # append to save to _str_buffer
        inc r13
        jmp .rd_ch_lp
    .rd_ch_lp_ex:
        pop rdx
        pop rcx
        pop r14
        pop r13
        pop r12
        ret

# input: rax - file desc
# input: rbx - string
# input: rcx - string length
# output: none
file_write_line:
    push rdx
    mov rdi, rax                    # file
    mov rax, 1                      # write
    mov rsi, rbx                    # value
    mov rdx, rcx                    # number of bytes to write                 
    syscall
    pop rdx
    ret

# input: rax - file
# output: none
file_close:
    mov rdi, 3
    syscall
    ret

# input: rax - fname
# output: rax - file desc
file_create:
    mov rdi, rax
    mov rax, 85                     # create output file
    mov rsi, 436                    # -rw-rw-r--
    syscall
    ret
