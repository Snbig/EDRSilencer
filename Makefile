# Compiler and flags
CC = x86_64-w64-mingw32-gcc
CFLAGS = -Wall -Wextra  # Optional: Add common warning flags
LDFLAGS =
LIBS = -lfwpuclnt

# Project files
TARGET = EDRSilencer.exe
SRCS = EDRSilencer.c utils.c
# Automatically derive object file names from source files (.c -> .o)
OBJS = $(SRCS:.c=.o)

# Default target: Build the executable
# This is the first target, so it runs when you just type `make`
all: $(TARGET)

# Rule to link the executable from object files
$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o $(TARGET) $(LIBS)
	@echo "Build complete: $(TARGET)"

# Generic rule to compile .c files into .o files
# $< is the first prerequisite (the .c file)
# $@ is the target (the .o file)
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Target to clean up build files
clean:
	@echo "Cleaning up..."
	rm -f $(OBJS) $(TARGET)
	@echo "Cleanup complete."

# Declare targets that are not files
.PHONY: all clean
