#include "libasm.h"
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

int main(void)
{
    char    buf[1024];
    const char* str_for_test = "hello world";

    printf("=====================================================================================\n");
    printf("|%-10s|%-30s|%-20s|%-20s|\n", "Function", "Argument(s)", "Expected", "Result");
    printf("=====================================================================================\n");

    printf("|%-10s|%-30s|%-20s|%-20s|\n", "ft_strcpy", str_for_test, strcpy(buf, str_for_test), ft_strcpy(buf, str_for_test));

    printf("|%-10s|%-30s|%-20d|%-20d|\n", "ft_strcmp", "hello vs world", strcmp("hello", "world"), ft_strcmp("hello", "world"));
    printf("|%-10s|%-30s|%-20d|%-20d|\n", "ft_strcmp", "hello vs hello", strcmp("hello", "hello"), ft_strcmp("hello", "hello"));
    printf("|%-10s|%-30s|%-20d|%-20d|\n", "ft_strcmp", "hello vs helo", strcmp("hello", "helo"), ft_strcmp("hello", "helo"));
    printf("|%-10s|%-30s|%-20d|%-20d|\n", "ft_strcmp", "kello vs hello", strcmp("kello", "hello"), ft_strcmp("kello", "hello"));

    printf("|%-10s|%-30s|%-20zu|%-20zu|\n", "ft_strlen", str_for_test, strlen(str_for_test), ft_strlen(str_for_test));
    printf("|%-10s|%-30s|%-20zu|%-20zu|\n", "ft_strlen", "\\0", strlen(""), ft_strlen(""));

    int fd;
    if ((fd = open("main.c", O_RDONLY)) < 0) {
        perror("open");
        return 1;
    }

    if (ft_read(fd, buf, 19) < 0) {
        perror("ft_read");
        return 1;
    }
    buf[19] = '\0';

    lseek(fd, 0, SEEK_SET);
    char    buf2[1024];
    if (read(fd, buf2, 19) < 0) {
        perror("read");
        return 1;
    }
    buf2[19] = '\0';

    printf("|%-10s|%-30s|%-20s|%-20s|\n", "ft_read", "main.c - 19B", buf2, buf);

    printf("=====================================================================================\n");

    close(fd);

	return 0;
}
