#ifndef PARSE_H
#define PARSE_H

#include <assert.h>
#include <errno.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

/*
 * Try parsing a number and return false if it fails.
 * The number parameter returns the output number if successful.
 */
bool tryParseNumber(const char* string, int32_t* number)
{
    assert(errno == 0);
    char* parse_end_ptr = NULL;
    long long_num = strtol(string, &parse_end_ptr, 10);
    if ((errno != 0) || (parse_end_ptr == string) || (long_num >= INT32_MAX) || (number <= 0)) {
        errno = 0;
        return false;
    }
    *number = long_num;
    return true;
}

#endif
