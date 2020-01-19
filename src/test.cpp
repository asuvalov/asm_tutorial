#include <stdio.h>
#include <string.h>
#include "string.hpp"

//extern "C" void printstr(const char*);
//extern "C" void printstrLF(const char*);
//extern "C"  int _strlen(const char*);
//extern "C"  int printstrLF2(const char*, const char*);

extern "C" int   _add_(int,int);

int main()
{
    //char msg[] = "Hello world";
    // printf("string '%s' length - %d \n", msg, _strlen(msg));
    //printstrLF2(msg, msg);
    //printf("ret - %d \n", _add_(1,2));
    
    const char* source = "Hello world";
    char destination[20];
    char* rev = (char*)_memcpy_(destination, source, 12);
    printf("%s\n", destination);
    printf("%s\n", rev);

    char a1[] = {'a', 'b', 'c', '\0'};
    char a2[] = {'a', 'b', 'd'};

    int cmp_result = _memcmp_(a1, a2, 3);
    int expected_result = memcmp(a1, a2, 3);
    printf("%d %d\n", cmp_result, expected_result);

    cmp_result = _memcmp_(a2, a1, 3);
    expected_result = memcmp(a2, a1, 3);
    printf("%d %d\n", cmp_result, expected_result);

    cmp_result = _memcmp_(a1, a2, 2);
    expected_result = memcmp(a1, a2, 2);
    printf("%d %d\n", cmp_result, expected_result);

    char* str = (char*)"00000";
    
    char a3[] = {'0', '0', '0', '0', '0', '\0'};
    printf("%s\n", a3);

    char* res = (char*)_memset_(a3, '1', 5);
    printf("%s\n", a3);    
    printf("%s\n", res);
    
    return 0;
}

