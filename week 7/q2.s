        .text
main:
        jr $ra
        
        .data
# we need to use .space when we dont have a value to initialise with
v0: # int v0;
        .space  4       # allocate 4 bytes of space

v1: # int v1 = 42; (a word is 4 bytes)
        .word   42       # store the value 42 in a word

v2: # char v2;
        .space  1

v3: # char v3 = 'a';
        .byte   'a'

v4: # double v4;
        .space  8


v5: # int v5[20];
        .space  20*4
        
v6: # int v6[10][5];
        .space  10*5*4


# struct Node { int x; int y; };
# main () {
#         struct Node v7;
# }
v7: # struct { int x; int y; } v7;
        .space  8
        
v8: # struct { int x; int y; } v8[4];
        .space  8*4

v9: # struct { int x; int y; } *v9[4];
# an array of pointers
# we assume a pointer is 4 bytes when translating to mips in 1521 (however it varies)
        .space  4*4