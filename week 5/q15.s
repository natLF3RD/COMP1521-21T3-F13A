# #include <stdio.h>
.text
# char flag[6][12] = {
#     {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
#     {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
#     {'.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
#     {'.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
#     {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
#     {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'}
# };

main:                   # int main(void) {

    li      $t0, 0     # int row = 0;
main__forouter:         
    bge     $t0, 6, main__endforouter  #     for (row < 6) {

    li      $t1, 0     # int col = 0;
main__forinner:
    bge     $t1, 12, main__endforinner  #      for ( col < 12) {

#             printf ("%c", flag[row][col]);
    #  calculate the starting address o fthe row:
    mul $t2, $t0, 12
    add $t2, $t2, $t1
    lb $a0, flag($t2)
    
    li      $v0, 11
    syscall

    
    addi    $t1, $t1, 1   #  col++
    j       main__forinner 
main__endforinner:      #         }

    li      $v0, 11
    li      $a0, '\n'
    syscall     #         printf ("\n");
    
    addi    $t0, $t0, 1   #  row++;
    j       main__forouter 
main__endforouter:      #     }


    li $v0, 0
    jr $ra              # }
    
    
    .data
flag:
# char flag[6][12] = {
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
    .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
# };