# Makefile for mkeykernel project
# Targets: build, run, clean

# Toolchain
CC = gcc
LD = ld
NASM = nasm
QEMU = qemu-system-i386

# Flags
CFLAGS = -m32 -Wall -Wextra -nostdlib -nostartfiles -nodefaultlibs -fno-builtin -fno-stack-protector
NASMFLAGS = -f elf
LDFLAGS = -m elf_i386 -Tlink.ld
QEMUFLAGS = -kernel kernel.bin

# Source files
KERNEL_SOURCES = kernel.c console.c
ASM_SOURCES = boot.asm
OBJECTS = $(ASM_SOURCES:.asm=.o) $(KERNEL_SOURCES:.c=.o)

# Targets
all: kernel.bin

kernel.bin: $(OBJECTS)
	$(LD) $(LDFLAGS) -o $@ $^

%.o: %.asm
	$(NASM) $(NASMFLAGS) -o $@ $<

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

run: kernel.bin
	$(QEMU) $(QEMUFLAGS)

clean:
	rm -f *.o *.bin

.PHONY: all run clean