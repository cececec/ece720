
# Makefile for ARM Cortex M0 Design Start Processor
# (c) 2014 by W. Rhett Davis
#
# The following targets build the memory image required for exercising
# the Cortex-M0 DesignStart Verilog RTL:

CPROGRAM	= fibonacci

ARMCCFLAGS	= --cpu=cortex-m0 -c
ARMLDFLAGS	= --cpu=cortex-m0 --ro-base=0x0 --info=totals --map

# Extract RAM binary image from ELF file
ram.bin:	$(CPROGRAM).elf
	fromelf --bin --output $@ $<

# Link object file with library to produce ELF
%.elf:	%.o
	armlink $(ARMLDFLAGS) --first='$<(vectors)' -o $@ $<

# Compile C program to object file
%.o:	%.c
	armcc $(ARMCCFLAGS) -o $@ $<

TBENCHSRC	= cortexm0ds_tb.v
SRCDIR		= ../src/rtl
VERILOGSRC	= $(wildcard $(SRCDIR)/*.v)
VERILOGTOP	= cortexm0ds_tb


# Mentor Graphics QuestaSim/ModelSim
sim:	$(VERILOGSRC) $(TBENCHSRC) ram.bin
	vlib work
	vlog $(VERILOGSRC) $(TBENCHSRC)
	vopt $(VERILOGTOP) -o $(VERILOGTOP)_opt
	time vsim $(VERILOGTOP)_opt -c -do "run -all"

gui:	$(VERILOGSRC) $(TBENCHSRC) ram.bin
	vlib work
	vlog $(VERILOGSRC) $(TBENCHSRC)
	vsim -novopt $(VERILOGTOP)

clean:
	-rm -rf work
	-rm -f ram.bin
	-rm -f $(CPROGRAM).elf
	-rm -f transcript
	-rm -f vsim.wlf
