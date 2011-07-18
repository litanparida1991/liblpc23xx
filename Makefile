
#
# Makefile for liblpc23xx.a
#

NAME            := liblpc23xx

CROSSCMP        := /opt/cross

CC              := $(CROSSCMP)/bin/arm-elf-gcc
LD              := $(CROSSCMP)/bin/arm-elf-ld
AR              := $(CROSSCMP)/bin/arm-elf-ar
AS              := $(CROSSCMP)/bin/arm-elf-as
CP              := $(CROSSCMP)/bin/arm-elf-objcopy
OD              := $(CROSSCMP)/bin/arm-elf-objdump

DEBUG           ?=
#DEBUG           = -DDEBUG_USB
 
INCLUDE         := -I.\
                   -I./include\
                   -I./lpc23xx-info/include\
                   -I./lpc23xx-i2c/include\
                   -I./lpc23xx-mam/include\
                   -I./lpc23xx-pll/include\
                   -I./lpc23xx-uart/include\
                   -I./lpc23xx-util/include\
                   -I./lpc23xx-vic/include\
                   -I./lpc23xx-binsem/include\
                   -I./lpc23xx-usb/include

HS              :=  $(wildcard ./include/*.h)\
                    $(wildcard ./lpc23xx-*/include/*.h)

TOPLIB          = $(NAME).a

# If you are using port B on the LPC2378 uncomment out the next line.
LPC2378_PORT    = -DLPC2378_PORTB

TESTS           = ./lpc23xx-pll/test/lpc23xx-pll-test.hex\
	          ./lpc23xx-binsem/test/lpc23xx-binsem-test.hex\
	          ./lpc23xx-usb/serial-test/serial-test.hex\
	          ./lpc23xx-uart/test/lpc23xx-uart-test.hex

ASRCS           := $(wildcard lpc23xx-*/*.s)

CSRCS           := $(wildcard lpc23xx-*/*.c)

COBJS           = $(CSRCS:.c=.o)

AOBJS           = $(ASRCS:.s=.o)
                  
CFLAGS          = $(INCLUDE) $(DEBUG) $(LPC2378_PORT) -ggdb -c -Wall -Werror -mfloat-abi=softfp -fno-common -O3 -mcpu=arm7tdmi-s

ARCHIVEFLAGS    = rvs

ASFLAGS         = -ggdb -ahls -mfloat-abi=softfp $(INCLUDE) 
 
.PHONY: clean allclean rebuild

.SUFFIXES : .c .cpp .s

.c.o :
	@echo "======== COMPILING $@ ========================"
	@$(CC) $(CFLAGS) -o $(<:.c=.o) -c $<

.s.o :
	@echo "======== COMPILING $@ ========================"
	@$(AS) $(ASFLAGS) -o $@ $< > $*.lst
        
all: $(TOPLIB) Makefile

tests: $(TESTS)

$(COBJS): $(HS)

$(TOPLIB): $(AOBJS) $(COBJS)
	@echo "========= Making Library $@ ========================"
	@$(AR) $(ARCHIVEFLAGS) $@ $(AOBJS) $(COBJS)

$(TESTS): $(LIB)
	@echo "========= Recursive make: $(@D) ========================"
	@$(MAKE) -s -C $(@D) $(@F)

clean:
	@$(RM)  $(LIB) $(AOBJS) $(COBJS) $(COBJS) $(USBLIB)\
	lpc23xx*/*.lst *.map *.hex *.bin *.lst *~ ./include/*~ a.out 
	$(MAKE) -s -C lpc23xx-pll/test clean
	$(MAKE) -s -C lpc23xx-uart/test clean
	$(MAKE) -s -C lpc23xx-binsem/test clean
	$(MAKE) -s -C lpc23xx-usb/serial-test clean
	
allclean: clean
	
rebuild: allclean
	$(MAKE)

