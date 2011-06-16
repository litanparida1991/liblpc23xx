
#
# common-test-make.mk
# Common test build flow for makefiles in test directories
#
# insert->  include $(LIBDIR)/include/common-test-make.mk

CROSS           ?= /opt/cross
GCC_VERSION     ?= 4.5.2

TYPE            ?= lpc23xx

DEBUG           ?=
#DEBUG           = -DDEBUG

#CFLAGS          = $(INCLUDE) $(DEBUG) -g -c -Wall -flto -fno-common -O0 -mcpu=arm7tdmi-s
CFLAGS          ?= $(INCLUDE) $(DEBUG) -g -c -Wall -Werror -fno-common -Os -mfloat-abi=softfp -mcpu=arm7tdmi-s

ASFLAGS         ?= -g -ahls -mfloat-abi=softfp $(INCLUDE)

LDFLAGS         ?= -T $(TYPE).ld -nostartfiles -Map $(NAME).map

CPFLAGS         := -O binary
HEXFLAGS        := -O ihex
ODFLAGS         := -x --syms

ASRCS           := $(ASRCS) boot.s

CSRCS           := $(CSRCS) $(NAME).c hwsys.c

COBJS           = $(CSRCS:.c=.o)

AOBJS           = $(ASRCS:.s=.o)

EXLIBS          = $(LIBDIR)/liblpc23xx.a

PROGS           = $(NAME).out

.PHONY: clean

.SUFFIXES : .c .cpp .s

.c.o :
	@echo "======== COMPILING $@ ========================"
	$(CC) $(CFLAGS) -c $<

.s.o :
	@echo "======== COMPILING $@ ========================"
	$(AS) $(ASFLAGS) -o $@ $< > $*.lst

all:  $(PROGS) $(EXLIBS) $(NAME).hex $(NAME).sdump Makefile

$(COBJS): include/*.h

$(EXLIBS):
	@echo "========= Recursive make: $(@D)    ========================"
	$(MAKE) TARGET=$(TARGET) -s -C $(@D) $(@F)

$(PROGS): $(AOBJS) $(COBJS) $(EXLIBS)
	@echo "========= LINKING $@ ========================"
	$(LD) $(LDFLAGS) -o $@ $(AOBJS) $(COBJS) $(EXLIBS) -L$(CROSS)/arm-elf/lib -lc -L$(CROSS)/lib/gcc/arm-elf/$(GCC_VERSION) -lgcc

$(NAME).sdump: $(NAME).c
	@echo "========= Combined Assembler and Source for $< =================="
	$(CC) -c -g $(INCLUDE) -Wa,-ahl=$@ $<

$(NAME).hex: $(NAME).out
	@echo "========= hex file for $< =================="
	$(CP) $(HEXFLAGS) $< $@

$(NAME).bin: $(NAME).out
	@echo "========= bin file for $< =================="
	$(CP) $(CPFLAGS) $< $@
	$(OD) $(ODFLAGS) $< > $(NAME).dmp

clean:
	$(RM) $(EXLIBS) $(PROGS) $(AOBJS) $(COBJS) $(NAME).sdump \
	*.map *.hex *.bin *.lst *~ ./include/*~ a.out 

allclean: clean
	$(MAKE)  -s -C $(LIBDIR) allclean

rebuild: allclean
	$(MAKE)

