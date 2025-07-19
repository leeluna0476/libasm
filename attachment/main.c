#include "libasm.h"
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

void	foo(size_t a) {
	printf("0x%zx\n", a);
}

int	cmp(void *a, void *b) {
	return ft_strcmp(a, b);
}

void	free_fct(void *data) {
}

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

    if (ft_read(-1, buf, 19) < 0) {
        perror("ft_read");
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

    printf("|%-10s|%-30s|%-20s|%-20s|\n", "ft_strdup", "hello world", strdup("hello world"), ft_strdup("hello world"));

    printf("=====================================================================================\n");

    close(fd);

	if (ft_write(-1, str_for_test, ft_strlen(str_for_test)) < 0) {
		perror("ft_write");
	}

	printf("ft_write: ");
	fflush(stdout);
	if (ft_write(1, str_for_test, ft_strlen(str_for_test)) < 0) {
		perror("ft_write");
		return 1;
	}
	printf("\nft_list_push_front: ");

	t_list	*head = NULL;
	ft_list_push_front(&head, "world");
	ft_list_push_front(&head, "seojilee");
	ft_list_push_front(&head, "world");
	ft_list_push_front(&head, "am");
	ft_list_push_front(&head, "i");
	ft_list_push_front(&head, "world");
	ft_list_push_front(&head, "hello");
	ft_list_push_front(&head, "world");

	t_list	*iter = head;
	while (iter) {
		printf("%p %s ", &(iter->next), (char *)iter->data);
		iter = iter->next;
	}
	printf("\n");

	printf("%d\n", ft_list_size(head));

	ft_list_remove_if(&head, "world", cmp, free_fct);
	iter = head;
	while (iter) {
		printf("%s ", (char *)iter->data);
		iter = iter->next;
	}
	printf("\n");

	return 0;
}
