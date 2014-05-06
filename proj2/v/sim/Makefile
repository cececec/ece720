
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

TBENCHSRC	= tb.v
STDCELLSRC	= /afs/eos.ncsu.edu/lockers/research/ece/wdavis/tech/nangate/NangateOpenCellLibrary_PDKv1_2_v2008_10/verilog/NangateOpenCellLibrary_PDKv1_2_v2008_10_typical_conditional.v
#SRCDIR		= ../src/rtl
SRCDIR		= ../../pr
#src/gate
VERILOGSRC	= $(wildcard $(SRCDIR)/*.v)
SVERILOGSRC	= $(wildcard $(SRCDIR)/*.sv)
VERILOGTOP	= tb


# Mentor Graphics QuestaSim/ModelSim
sim:	$(VERILOGSRC) $(SVERILOGSRC) $(TBENCHSRC) $(STDCELLSRC) ram.bin
	vlib work
	vlog $(STDCELLSRC) $(VERILOGSRC) $(SVERILOGSRC) $(TBENCHSRC)
	vopt $(VERILOGTOP) -o $(VERILOGTOP)_opt
	vsim $(VERILOGTOP)_opt -c -do "run -all"

gui:	$(VERILOGSRC) $(SVERILOGSRC) $(TBENCHSRC) $(STDCELLSRC) ram.bin
	vlib work
	vlog $(STDCELLSRC) $(VERILOGSRC) $(SVERILOGSRC) $(TBENCHSRC)
	vsim -novopt $(VERILOGTOP)

saif:
	tcsh -c "add synopsys2013; \
	vcd2saif -input waves.vcd -instance tb/soc -output waves.saif"

clean:
	-rm -rf work
	-rm -f ram.bin
	-rm -f $(CPROGRAM).elf
	-rm -f transcript
	-rm -f vsim.wlf
