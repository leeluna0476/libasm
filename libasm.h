#ifndef LIBASM_H
# define LIBASM_H

# include <unistd.h>

size_t  ft_strlen(const char* s);
int   ft_strcmp(const char* s1, const char* s2);
char*   ft_strcpy(char* dst, const char* src);
ssize_t ft_read(int filedes, void* buf, size_t nbytes);
ssize_t ft_write(int filedes, void* buf, size_t nbytes);

#endif
