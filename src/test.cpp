#include <stdio.h>
#include <string.h>
#include "string.hpp"

int test_memcpy()
{
    const char* source = "Hello world";
    char destination[20];
    char* rev = (char*)_memcpy_(destination, source, 12);
    
    int cmp = memcmp(destination, source, 12);
    if (cmp != 0)
        return 1;
        
    return 0;
}

int test_memcmp()
{
    char a1[] = {'a', 'b', 'c', '\0'};
    char a2[] = {'a', 'b', 'd', '\0'};

    int cmp_result = _memcmp_(a1, a2, 3);
    int expected_result = memcmp(a1, a2, 3);
    if (cmp_result != expected_result)
        return 1;

    cmp_result = _memcmp_(a2, a1, 3);  
    expected_result = memcmp(a2, a1, 3);
    if (cmp_result != expected_result)
        return 1;

    cmp_result = _memcmp_(a1, a2, 2);
    expected_result = memcmp(a1, a2, 2);
    if (cmp_result != expected_result)
        return 1;

    return 0;
}

int test_memset()
{
    char a1[] = {'0', '0', '0', '0', '0', '\0'};
    char a2[] = {'1', '1', '1', '1', '1', '\0'};
    char* res = (char*)_memset_(a1, '1', 5);

    if (memcmp(a1, a2, 6) != 0)
        return 1;

    if (memcmp(res, a2, 6) != 0)
        return 1;

    return 0;    
}

int main()
{
    int errors = 0;

    if (test_memcpy() != 0) {
        printf("Test memcpy failed\n");
        ++errors;
    }
              
    if (test_memcmp() != 0) {
        printf("Test memcmp failed\n");
        ++errors; 
    }
       
    if (test_memset() != 0) {
        printf("Test memset failed\n");
        ++errors;
    }
    
    if (errors != 0) {
        printf("%d tests failed\n", errors);
        return 1;
    }
        
    printf("Tests passed\n");
    return 0;
}

