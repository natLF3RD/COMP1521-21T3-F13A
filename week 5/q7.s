#include <stdio.h>
    .text

main:
# int main(void) {
#     int i; 
#     int numbers[10] = {0}; (done in .data section)
    li      $t0, 0           #     i = 0;
main__while:                #     while (i < 10) {
    bge     $t0, 10, main__endwhile
    
    li		$v0, 5          #         scanf("%d",
    syscall
    # result gets put into $v0
    mul     $t1, $t0, 4
    sw      $t1, numbers($t1)
                            #               &numbers[i]);
    
    addi    $t0, $t0, 1       #         i++;
    j		main__while
main__endwhile:     #     }
    
    li      $v0, 0  
    jr      $ra     #     return 0;
# }


    .data
#     int numbers[10] = {0};
numbers:
    .word   0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    #  could also do:
    # .word    0:10 