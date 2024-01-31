#! /bin/bash

# run the C preprocessor
gcc -E main.c > _main.c

# compile to ASM
gcc -S -masm=intel _main.c -o main.s
                
# compile to binary
gcc -c main.s -o main.o
readelf --all main.o > main_o.txt

# link the binary into ELF file
gcc main.o -o main
readelf --all -S main.o > main.txt
