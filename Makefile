# ---  C Implementation of Battleship ---
# by Victor Correa

# Compiler and flags
CC := gcc
CFLAGS := -Wall -Wextra -std=c11 -Iinclude

# Directories
SRC_DIR := src
OBJ_DIR := build/objects
BIN_DIR := build/bin
ASM_DIR := build/asm

# Target executable
TARGET := $(BIN_DIR)/battleship

# Source, object and asm files
SRC := $(wildcard $(SRC_DIR)/*.c)
OBJ := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC))
ASM := $(patsubst $(SRC_DIR)/%.c,$(ASM_DIR)/%.s,$(SRC))

# Default target
all: $(TARGET)

# Default target + asm
# all: $(TARGET) asm

# Link object files into final binary
$(TARGET): $(OBJ)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $^ 

# Compile .c to .o
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Generate assembly .s files
$(ASM_DIR)/%.s: $(SRC_DIR)/%.c | $(ASM_DIR)
	@mkdir -p $(ASM_DIR)
	$(CC) $(CFLAGS) -S $< -o $@

# Build all assembly files
asm: $(ASM)

# Clean generated files
clean:
	rm -rf $(OBJ_DIR)/*.o $(BIN_DIR)/* $(ASM_DIR)/*.s

# Rebuild from scratch
rebuild: clean all

# Phony targets
.PHONY: all clean rebuild
