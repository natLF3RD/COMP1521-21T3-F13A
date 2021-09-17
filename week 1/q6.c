#include <stdlib.h>
#include <stdio.h>

struct node {
    int data;
    char str[1000000];
};


int main() {
    struct node *a, *b, *c, *d;
    a = NULL;
    b = malloc(sizeof *b);
    c = malloc(sizeof (struct node) );
    d = malloc(8); // bad style
    c = a;
    d.data = 42; // incorrect becuase d is a pointer
    // next two lines are the same.
    c->data = 42; // correct because c is a pointer
    (*c).data = 42; // correct because c is a pointer
    
    return 0;
}


void declaring_structs() {
    // using pointer -> onto the heap.
    struct node *p;
    // need to malloc
    p = malloc (sizeof *p);
    // to access fields within need to dereference the variable
    p->data = 3;
    // or 
    (*p).data = 3;
    
    // no pointer -> goes onto the stack.
    struct node x;
    // no need to malloc
    // use . to access fields
    x.data = 3;
}