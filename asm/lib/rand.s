    .intel_syntax noprefix
    .text
    .global get_random_number

# input: rax - lower limit
# input: rbx - upped limit
# output: rax - number
get_random_number:
    push rcx
    push rdx
    mov r8, rax
    mov r9, rbx
    sub r9, r8          # upper - lower + 1
    inc r9
    rdtsc
    xor rdx, rdx
    mov rcx, r9
    div rcx
    mov rax, rdx
    add rax, r8
    pop rdx
    pop rcx
    ret
