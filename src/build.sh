
nasm -f elf string.asm
#ld -m elf_i386 string.o -o string

g++ -c test.cpp -m32
g++ -o test test.o string.o -m32

