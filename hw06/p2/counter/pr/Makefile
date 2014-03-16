

MODNAME = counter

all: route

INIT = $(MODNAME)_init.enc.dat/$(MODNAME).route.gz
.PHONY: init
init: $(INIT)
$(INIT): design.conf design.tc run_init.tcl ../v/src/gate/$(MODNAME)_final.v
	tcsh -c "add cadence2012 ; \
        encounter -nowin -overwrite -replay run_init.tcl |& tee run_init.log"

PLACE = $(MODNAME)_placed.enc.dat/$(MODNAME).route.gz
.PHONY: place
place: $(PLACE)
$(PLACE): $(INIT) $(wildcard io.place)
	tcsh -c "add cadence2012 ; \
        encounter -nowin -overwrite -replay run_place.tcl |& tee run_place.log"

CTS = $(MODNAME)_cts.enc.dat/$(MODNAME).route.gz
.PHONY: cts
cts: $(CTS)
$(CTS): $(PLACE) $(wildcard clock.ctstch)
	tcsh -c "add cadence2012 ; \
        encounter -nowin -overwrite -replay run_cts.tcl |& tee run_cts.log"

TRIALROUTE = $(MODNAME)_trialrouted.enc.dat/$(MODNAME).route.gz
.PHONY: trialroute
trialroute: $(TRIALROUTE)
$(TRIALROUTE): $(PLACE) $(wildcard $(CTS))
	tcsh -c "add cadence2012 ; \
        encounter -nowin -overwrite -replay run_trialroute.tcl |& tee run_trialroute.log"

ROUTE = $(MODNAME)_routed.enc.dat/$(MODNAME).route.gz
.PHONY: route
route: $(ROUTE)
$(ROUTE): $(PLACE) $(wildcard $(CTS))
	tcsh -c "add cadence2012 ; \
        encounter -nowin -overwrite -replay run_route.tcl |& tee run_route.log"

clean:
	-rm clock.ctsrpt
	-rm $(MODNAME).cts_trace
	-rm cts.rguide
	-rm clock.ctsntf
	-rm *.tmpl*
	-rm *.log
	-rm *.enc
	-rm *.cmd
	-rm *.spef
	-rm *.def
	-rm *.v
	-rm -rf *.enc.dat
	-rm -rf timingReports
