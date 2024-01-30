wsl gcc -E main.c > _main.c
wsl gcc -S _main.c -o _main.s
wsl gcc -c _main.s -o _main.o
