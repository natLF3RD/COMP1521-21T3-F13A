#include <stdio.h>
#include <stdint.h>

typedef unsigned int Word;
// by definition a word is 32 bits.
// byte is 8 bits.
// half-word (sometimes also "nibble") is 16 bits.

Word reverseBits(Word w) {
    Word result = 0;
    
    for (int i=sizeof(Word)*8-1; i >= 0; --i) {
        Word extracting_mask = 1u << i;
        Word curr_bit = w & extracting_mask;
        if (curr_bit != 0) { // if we extracted a 1.
            // then we want to set a 1 at the other end.
            Word setting_mask = 1u << (31 - i);
            result |= setting_mask;
        }        
    }
    
  
    return result;
}



int main(void) {
    
    Word value = 0x00000001;
    
    
    printf("%x becomes %x\n", value, reverseBits(value));
    
    return 0;
}