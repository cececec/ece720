# Add the necessary lines to this file to execute your solution.

all: p1b
	@echo ""
p1a:
	@echo ""
	@echo "Answers for p1.a"
	@find /afs/eos/dist/ds5-2013.06/FastModelsTools_8.2/OSCI/SystemC/ -type f -not -name '*.h' | wc -l

p1b: p1a
	@echo ""
	@echo "Answers for p1.b"
	@find /afs/eos/dist/ds5-2013.06/FastModelsTools_8.2/OSCI/SystemC/ -type f -name '*.h' -exec grep -w -o -e 'class' -e 'classes' {} \; | wc -w

alter1:
	@find /afs/eos/dist/ds5-2013.06/FastModelsTools_8.2/OSCI/SystemC/ -type f | grep -v '\.h$$' | wc -l
