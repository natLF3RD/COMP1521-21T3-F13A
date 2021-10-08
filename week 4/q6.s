    .text
main:

    li  $t0, 24                 #     int x = 24;
main__for:
    blt $t0, 42, main__forinner #     if (x < 42) goto main__forinner;
    j   main__endfor            #     goto main__endfor;
main__forinner:
    li  $v0, 1                  #         printf("%d",x);
    move $a0, $t0
    syscall

    li  $v0, 11                 #         printf("\n");
    li  $a0, '\n'
    syscall
            
    addiu	$t0, $t0, 3	        #         x += 3; -> x = x+3;

    j		main__for           #         goto main__for;
main__endfor:

    li  $v0, 0                  # return 0;
    jr  $ra

    .data
prompt:
    .asciiz     "asciizz string"