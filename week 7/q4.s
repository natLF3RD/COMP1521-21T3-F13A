        .text
# // sum 4 numbers using function calls

# #include <stdio.h>

# int sum4(int a, int b, int c, int d);
# int sum2(int x, int y);

main:                           # int main(void) {
main__prologue:
        addi    $sp, $sp, -4
        sw      $ra, 0($sp)
        
        li      $a0, 11
        li      $a1, 13
        li      $a2, 17
        li      $a3, 19
        jal     sum4            #       int z = sum4(11, 13, 17, 19);

        move 	$a0, ??		
        li      $v0, 1
        syscall                 #       printf("%d", z);
        li      $v0, 11
        li      $a0, '\n'
        syscall                 #       printf("\n");
        
        li      $v0, 0          #       return 0;
        
main__epilogue:
        lw      $ra, 0($sp)
        addi    $sp, $sp, 4
        jr      $ra             # }


sum4:                           # int sum4(int a, int b, int c, int d) {
sum4__prologue:
        addi    $sp, $sp, -16
        sw      $ra, 0($sp)
        sw      $s0, 4($sp)
        sw      $s1, 8($sp)
        sw      $s2, 12($sp)

sum4__body:
        # save c and d since a2 and a3 could be changed by sum2
        move    $s0, $a2
        move    $s1, $a3
        # don't need tp set up a0 a1 sicne a and b are alreadu in there
        jal     sum2            #     int e = sum2(a, b);
        # e is in v0 - need to save it somehwere else since v0 will get overwritten
        move    $s2, $v0
        
        move    $a0, $s0
        move    $a1, $s0
        jal     sum2            #     int f = sum2(c, d);
        # f in v0
        
        move    $a0, $s2
        move    $a1, $v0        #     return sum2(e, f);
        # now result again is in $v0
        
sum4__epilogue:
        lw      $ra, 0($sp)
        lw      $s0, 4($sp)
        lw      $s1, 8($sp)
        lw      $s2, 12($sp)
        addi    $sp, $sp, 16
        
        jr      $ra             # }

sum2:
# int sum2(int x, int y) {
#     return x + y;
# }

        .data