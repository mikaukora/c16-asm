SYS ?= c16

NULLDEV = /dev/null
CC65_HOME = /usr/local/bin

AS = $(CC65_HOME)/ca65
LD = $(CC65_HOME)/ld65
EMULATOR = /usr/local/bin/xplus4

ASM_SOURCES := $(wildcard *.s)
PROGRAMS := $(patsubst %.s, %.prg, $(ASM_SOURCES))

OBJDIR := objdir

.PHONY: all
all: $(PROGRAMS)

%.o: %.s
	$(AS) -t $(SYS) $< -o $@ -l $(*F).lst

%.prg: %.o
	$(LD) -t $(SYS) -o $@ -m $(*F).map -u __EXEHDR__ $< --lib $(SYS).lib

run-%: %.prg
	$(EMULATOR) -model c16 $<

.PHONY: clean
clean:
	-rm -f *.map *.prg *.lst
