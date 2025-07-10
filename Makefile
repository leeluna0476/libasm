AS = nasm
ASFLAGS += -w+error=all
ASFLAGS += -f elf64

RM = rm -rf
ARFLAGS = rcs

NAME = libasm.a
SRCS = \
	   ft_strlen.s \
	   ft_strcmp.s \
	   ft_strcpy.s \
	   ft_strdup.s \
	   ft_write.s \
	   ft_read.s \

OBJS_DIR = .objs
OBJS = $(addprefix $(OBJS_DIR)/, $(SRCS:.s=.o))

all: $(NAME)

$(NAME): $(OBJS)
	$(AR) $(ARFLAGS) $@ $?

$(OBJS_DIR)/%.o: %.s | $(OBJS_DIR)
	$(AS) $(ASFLAGS) $< -o $@

$(OBJS_DIR):
	mkdir -p $(OBJS_DIR)

clean:
	$(RM) $(OBJS_DIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
