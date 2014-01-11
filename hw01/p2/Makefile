# Add the necessary lines to this file to execute your solution.

all: createsubdir 

createsubdir: clean	
	@echo ""
	ls
	@echo "===not subdir here==="
	@echo ""
	python myScript.py
	ls
	@echo "===subdir created==="
	@echo ""
	python myScript.py
	@echo "No error flag showing when subdir exists"
	@echo "p2 done"
	@echo ""

clean: 
	@echo "remove dir subdir"
	rm -rf subdir
