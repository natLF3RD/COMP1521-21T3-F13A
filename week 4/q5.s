        .text

main:                           # int main(void) {
                                #     int x; (x->$t0)
        li      $v0, 4
        la      $a0, prompt
        syscall                 # printf("Enter a number: ");

        li      $v0, 5
        syscall
        move    $t0, $v0         # scanf("%d", &x);

main__if:
#     if (x > 100 && x < 1000) {
## if the first part (x > 10) is false we know that the whole 
## if statement will be false, so we dont need to check if
## x < 1000 as well.
        # if (x > 100)
        ble     $t0, 100, main__else     # if the first part is false go to else clause.
        # && if (x < 1000)
        bge     $t0, 1000, main__else    # then if the second part is false go to else clause.
        
        li      $v0, 4
        la      $a0, medium
        syscall                 # printf("medium\n");
        
        # make sure not to continue into the else clause.
        j       main__endif
        
main__else:                     # } else {

        li      $v0, 4
        la      $a0, small_big
        syscall                 # printf("small/big\n");
main__endif:
#     }
# }

        .data
prompt:
        .asciiz "Enter a number: "
medium:
        .asciiz "medium\n"
small_big:
        .asciiz "small/big\n"