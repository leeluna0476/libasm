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
	   ft_write.s \

OBJS_DIR=.objs
OBJS=$(addprefix $(OBJS_DIR)/, $(SRCS:.s=.o))

all: $(NAME)

$(NAME): $(OBJS)
	$(AR) $(ARFLAGS) $@ $?

$(OBJS_DIR)/%.o: %.s | $(OBJS_DIR)
	$(AS) $(ASFLAGS) $< -o $@

$(OBJS_DIR):
	mkdir -p $(OBJS_DIR)

clean:
	$(RM) $(OBJS)

fclean:
	$(RM) $(OBJS) $(NAME)
