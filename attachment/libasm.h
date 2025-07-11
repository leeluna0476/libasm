#ifndef LIBASM_H
# define LIBASM_H

# include <unistd.h>

size_t  ft_strlen(const char* s);
int   	ft_strcmp(const char* s1, const char* s2);
char*   ft_strcpy(char* dst, const char* src);
char*   ft_strdup(const char* s);
ssize_t ft_read(int filedes, void* buf, size_t nbytes);
ssize_t ft_write(int filedes, const void* buf, size_t nbytes);

typedef struct s_list
{
	void			*data;
	struct s_list	*next;
}	t_list;

void	ft_list_push_front(t_list **begin_list, void *data);
int		ft_list_size(t_list *begin_list);

#endif
