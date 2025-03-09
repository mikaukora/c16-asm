SYS ?= c16

NULLDEV = /dev/null
DEL = $(RM)
RMDIR = $(RM) -r
CC65_HOME = /usr/local/bin

AS = $(CC65_HOME)/ca65
CC = $(CC65_HOME)/cc65
CL = $(CC65_HOME)/cl65
LD = $(CC65_HOME)/ld65
SP = $(CC65_HOME)/sp65
EMULATOR = /usr/local/bin/xplus4

hello.prg: hello.s
	$(AS) -t $(SYS) hello.s
	$(LD) -C $(SYS).cfg -o hello.prg -m hello.map -u __EXEHDR__ hello.o $(SYS).lib

run: hello.prg
	$(EMULATOR) -model c16 $<

clean:
	@$(DEL) *.map *.o *.prg 2>$(NULLDEV)
