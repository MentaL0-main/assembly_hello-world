NASM = nasm
NASMFLAGS = -f elf64

TARGET = hello_world

SRCS = main.asm

OBJS = $(SRCS:.asm=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	ld -o $@ $^

%.o: %.asm
	$(NASM) $(NASMFLAGS) $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

run: $(TARGET)
	./$(TARGET)

.PHONY: all clean run

