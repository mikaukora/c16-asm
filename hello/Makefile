SYS ?= c16

NULLDEV = /dev/null
CC65_HOME = /usr/local/bin

AS = $(CC65_HOME)/ca65
LD = $(CC65_HOME)/ld65
EMULATOR = /usr/local/bin/xplus4

programs = hello.prg hello2.prg

OBJDIR := objdir

.PHONY: all
all: $(programs)

%.o: %.s
	$(AS) -t $(SYS) $< -o $@ -l $(*F).lst

%.prg: %.o
	$(LD) -t $(SYS) -o $@ -m $(*F).map -u __EXEHDR__ $< --lib $(SYS).lib

run-%: %.prg
	$(EMULATOR) -model c16 $<

.PHONY: clean
clean:
	-rm -f *.map *.prg *.lst
