# Makefile for hw01
# This file traverses the subdirectories and runs "make" in each one

SUBDIRS = p1 p2 p3 p4 p5

# .PHONY simply means that the listed targets don't actually have files
# associated with them.  This line informs "make" that it shouldn't check
# file modification times for these targets
.PHONY: subdirs $(SUBDIRS)

subdirs: $(SUBDIRS)

$(SUBDIRS):
	@echo "============== $@ ==================="
	$(MAKE) -C $@
	@echo "==============$@ Done================"
	@echo ""
	@echo ""
# The following ensures that the problems will be executed in order

p5: p4

p4: p3

p3: p2

p2: p1

