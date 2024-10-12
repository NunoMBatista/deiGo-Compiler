#include <stdio.h>
#include <stdlib.h>

int main() {
    char buffer[10];
    for (int i = 0; i < 6; i++){
        buffer[i] = 'A';
    }
    printf("buffer: %s\n", buffer);
    
    buffer[0] = '\0';
    
    printf("buffer: %s\n", buffer);
    
    for(int i = 0; i < 3; i++){
        buffer[i] = 'B';
    }

    printf("buffer: %s\n", buffer);

    return 0;
}