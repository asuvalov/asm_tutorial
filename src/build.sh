
nasm -g -f elf -l string.lst string.asm
#ld -m elf_i386 string.o -o string

gcc -g -c test.cpp -m32
gcc -g -o test test.o string.o -m32

