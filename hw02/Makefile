# Makefile for hw02
# This file traverses the subdirectories and runs "make" in each one

SUBDIRS = p3 p4

# .PHONY simply means that the listed targets don't actually have files
# associated with them.  This line informs "make" that it shouldn't check
# file modification times for these targets
.PHONY: subdirs $(SUBDIRS)

subdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

# The following ensures that the problems will be executed in order

p4: p3


