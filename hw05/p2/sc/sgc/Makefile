

# Common rules
include makefile.include

# Specify objects and target(s) to build
SRCS = $(wildcard src/*.cpp)
TARGET = Cortex-M3.x
CPROGRAM = fibonacci

# Determine others...
GENDIR = ./$(CONFIG)/gen
BUILDDIR = ./$(CONFIG)
WRAPPERLIB = scx-Cortex-$(CONFIG)
EVSLIB  = Cortex-$(CONFIG)
CXXFLAGS += -I$(GENDIR)
LDFLAGS += -L$(BUILDDIR) -l$(WRAPPERLIB) -lcomponents -lpvbus \
		   $(PVLIB_HOME)/lib/Linux$(BITNESS_IN_NAME)_GCC-$(GCC_VER)/libarmctmodel.a \
		   -lscx -lfmruntime -lsystemc -l$(EVSLIB) -ldl -lrt \
		   -Wl,-rpath,'$$ORIGIN'

# Determine commands
SIMGEN_CMD = $(MAXCORE_HOME)/bin/simgen -p Cortex-M3.sgproj \
			 --num-build-cpus $(J) --configuration $(CONFIG) \
			 $(SIMGENFLAGS)
CXX_CMD = $(CXX) $(CXXFLAGS) -o $(TARGET) $(SRCS) $(LDFLAGS)

# Local rules

.SUFFIXES:

.PHONY: dbg_gcc41_32 rel_gcc41_32
.PHONY: dbg_gcc44_32 rel_gcc44_32
.PHONY: dbg_gcc41_32_clean rel_gcc41_32_clean
.PHONY: dbg_gcc44_32_clean rel_gcc44_32_clean
.PHONY: dbg_gcc41_64 rel_gcc41_64
.PHONY: dbg_gcc44_64 rel_gcc44_64
.PHONY: dbg_gcc41_64_clean rel_gcc41_64_clean
.PHONY: dbg_gcc44_64_clean rel_gcc44_64_clean


sim:
	time ./Cortex-M3.x -a ../image/$(CPROGRAM).axf

gdb:
	gdb ./Cortex-M3.x

dbg_gcc41_32 rel_gcc41_32 dbg_gcc41_64 rel_gcc41_64 dbg_gcc44_32 rel_gcc44_32 dbg_gcc44_64 rel_gcc44_64:
	$(SIMGEN_CMD) -b
	cp $(BUILDDIR)/lib$(EVSLIB).so ./
	$(CXX_CMD)

dbg_gcc41_32_clean rel_gcc41_32_clean dbg_gcc41_64_clean rel_gcc41_64_clean dbg_gcc44_32_clean rel_gcc44_32_clean dbg_gcc44_64_clean rel_gcc44_64_clean:
	-$(SIMGEN_CMD) --clean
	-rm -f $(TARGET)
	-rm -f ./lib*.so*
	-rm -rf Linux-Release-GCC-4.1
	-rm -rf Linux-Debug-GCC-4.1


