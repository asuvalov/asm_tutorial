
nasm -f elf string.asm
#ld -m elf_i386 string.o -o string

gcc -c test.cpp -m32
gcc -o test test.o string.o -m32

