#include <stdio.h>

extern "C" void printstr(const char*);
extern "C" void printstrLF(const char*);
extern "C"  int _strlen(const char*);

int main()
{
    char msg[] = "Hello world";
    printf("string '%s' length - %d \n", msg, _strlen(msg));
    printstrLF(msg);
    return 0;
}
