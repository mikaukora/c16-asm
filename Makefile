# Commodore 16 Assembly Project Makefile
# Using cc65 toolchain

# Paths
CC65_PATH = /usr/local/bin
CC = $(CC65_PATH)/cc65
CA = $(CC65_PATH)/ca65
LD = $(CC65_PATH)/ld65
EMULATOR = /usr/local/bin/xplus4

# Source files
ASM_SOURCES := $(wildcard *.s)
PROGRAMS := $(filter-out basic_stub,$(basename $(ASM_SOURCES)))

# Directories
BUILD_DIR = build
OUTPUT_DIR = output

# Linker Configuration
CONFIG = c16.cfg

# Build all programs
all: setup $(patsubst %, $(OUTPUT_DIR)/%.prg, $(PROGRAMS))

setup:
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(OUTPUT_DIR)

# Compile BASIC stub once
$(BUILD_DIR)/basic_stub.o: basic_stub.s
	$(CA) -t c16 -o $@ $<

# Compile each .s file into an object file (excluding the stub)
$(BUILD_DIR)/%.o: %.s
	$(CA) -t c16 -o $@ $<

# Link each object file with the BASIC stub
$(OUTPUT_DIR)/%.prg: $(BUILD_DIR)/%.o $(BUILD_DIR)/basic_stub.o
	$(LD) -o $@ -C $(CONFIG) $^

# Run a specific program
run-%: $(OUTPUT_DIR)/%.prg
	$(EMULATOR) -model c16 $<

clean:
	rm -rf $(BUILD_DIR)
	rm -rf $(OUTPUT_DIR)

.PHONY: all setup clean run
