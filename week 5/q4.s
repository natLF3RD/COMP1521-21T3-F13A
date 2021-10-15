    .data
# int u;
u: 
    .space  4

# int v = 42;
v:
    .word   42
    
# char w;
w:
    .space  1
    
# char x = 'a';
x: 
    .byte   'a'
    .align  3

# double y;
y:
    .space  8
    
# int z[20]; -> need to allocate 20*size of int
z: 
    .space  80
    