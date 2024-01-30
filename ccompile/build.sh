#! /bin/bash

cp main.c out/main.c

# run the C preprocessor
gcc -E out/main.c > out/_main.c

# compile to ASM
gcc -S -masm=intel out/_main.c -o out/main.s
                
# compile to binary
gcc -c out/main.s -o out/main.o

# link the binary into ELF file
gcc out/main.o -o out/main
