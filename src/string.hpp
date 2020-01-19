#pragma once

extern "C" void* _memcpy_(void* destination, const void* source, size_t num);
extern "C" void* _memset_(void* ptr, int value, size_t num);
extern "C" int   _memcmp_(const void* lhs, const void* rhs, size_t num);

