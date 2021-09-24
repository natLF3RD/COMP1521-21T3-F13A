#define READING   0x01
#define WRITING   0x02
#define AS_BYTES  0x04
#define AS_BLOCKS 0x08
#define LOCKED    0x10


unsigned char device; // uint8_t

int main() {
    // a
    device = READING;
    device = device | AS_BYTES;
    device = device | LOCKED;
    
    // also same as above.
    device = READING | AS_BYTES | LOCKED;
    device |= READING | AS_BYTES | LOCKED;
    
    // b
    device = device | WRITING | AS_BLOCKS | LOCKED;
    
    // c
    device |= LOCKED;
    
    // d
    device = device &~ LOCKED;
    
    // e
    device = (device &~ READING ) | WRITING;
    
    // f
    device = device ^ READING ^ WRITING;
}




