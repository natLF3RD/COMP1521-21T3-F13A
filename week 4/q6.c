#include <stdio.h>

int main(void) {
    int x = 24;
main__for:
    // while (x < 42)  // {
    if (x < 42) goto main__forinner;
    goto main__endfor;
main__forinner:
        printf("%d\n",x);
        
        x += 3;
        goto main__for;
main__endfor:
    // }
    
    // automatically
    return 0;
}