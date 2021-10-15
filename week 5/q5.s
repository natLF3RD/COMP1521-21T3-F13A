    .text
main:
    la   $t0, aa
    # $t0 = 0x10010000
    
    lw   $t0, bb
    # -> lw $t0, 0x10010004
    # $t0 = 666
    
    lb   $t0, bb
    # 666 = 0000 0000   0000 0000   0000 0010   1001 1010
    # $t0 has two possibilities:
    # the highest byte: 0000 0000
    # the lowest byte:  1001 1010
    # -> endianness (little vs big endian)
    # for little endian: store the bytes backwards (therefore we get the lowest byte: 1001 1010)
    # cse machines are little endian.
    
    lw   $t0, aa+4
    # aa+4 = 0x10010004
    # $t0 = 666
    
    la   $t1, cc
    # $t1 = 0x10010008
    lw   $t0, ($t1)
    # $t0 = 1
    
    la   $t1, cc
    # $t1 = 0x10010008
    lw   $t0, 8($t1)
    # 8($t1) = 0x10010008 + 8 = 0x10010010
    # $t0 = 5   
    
    li   $t1, 8
    # $t1 = 0x00000008    
    lw   $t0, cc($t1)
    # cc + 8 = 0x10010008 + 8 = 0x10010010
    # => lw   $t0, 0x10010008 + 8
    # => lw   $t0, 0x10010010
    # $t0 = 5
    
    la   $t1, cc
    # $t1 = 0x10010008
    lw   $t0, 2($t1)
    # 2 + $t1 = 0x10010008 + 2 = 0x1001000A => A == 1010
    
    jr $ra
    .data
aa:  .word 42
bb:  .word 666 # -> if little endian the bytes are actually: 1001 1010    0000 0010    0000 0000    0000 0000   
cc:  .word 1
     .word 3
     .word 5
     .word 7