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

int test_memchr()
{
    const char* str = "hello world";

    if (_memchr_(str, 'w', 12) != str+6)
        return 1;

    if (_memchr_(str, 'o', 5) != str+4)
        return 1;

    if (_memchr_(str, 'h', 12) != str)
        return 1; 

    if (_memchr_(str, 'x', 12) != 0)
        return 1; 

    return 0;
}

int test_strlen()
{
    if (_strlen_("hello world") != 11)
        return 1;

    if (_strlen_("") != 0)
        return 1;

    return 0;
}

int test_strcpy()
{
    char arr1[] = {'a', 'b', 'c', 'd', '\0'};
    char arr2[5];
    _strcpy_(arr2, arr1);

    for (size_t i = 0; i < 5; ++i)
        if (arr1[i] != arr2[i])
            return 1;

    return 0;
}

#define TEST_FUNCTION(func) if (test_##func() != 0) { \
                                printf("Test %s failed \n", #func); \
                                ++errors; \
                            }

int main()
{
    static int errors = 0;

    TEST_FUNCTION(memcpy);
    TEST_FUNCTION(memcmp);
    TEST_FUNCTION(memset);
    TEST_FUNCTION(memchr);

    TEST_FUNCTION(strlen);
    TEST_FUNCTION(strcpy);

    if (errors != 0) {
        printf("%d tests failed\n", errors);
        return 1;
    }

    printf("Tests passed\n");
    return 0;
}

