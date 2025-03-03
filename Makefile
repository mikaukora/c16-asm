# Commodore 16 Assembly Project Makefile
# Using cc65 toolchain

# Variables
CC65_PATH = /usr/local/bin
CC = $(CC65_PATH)/cc65
CA = $(CC65_PATH)/ca65
LD = $(CC65_PATH)/ld65
EMULATOR = /usr/local/bin/xplus4

PROGRAM = demo

# Source files
ASM_SOURCES = main.s

BUILD_DIR = build
OUTPUT_DIR = output

CONFIG = c16.cfg

all: setup $(OUTPUT_DIR)/$(PROGRAM).prg

setup:
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(OUTPUT_DIR)

# Compile assembly files
$(BUILD_DIR)/%.o: %.s
	$(CA) -t c16 -o $@ $<

# Link object files to create PRG file
$(OUTPUT_DIR)/$(PROGRAM).prg: $(patsubst %.s,$(BUILD_DIR)/%.o,$(ASM_SOURCES))
	$(LD) -o $@ -C $(CONFIG) $^

run: $(OUTPUT_DIR)/$(PROGRAM).prg
	$(EMULATOR) -model c16 $<

clean:
	rm -rf $(BUILD_DIR)
	rm -rf $(OUTPUT_DIR)

.PHONY: all setup clean run