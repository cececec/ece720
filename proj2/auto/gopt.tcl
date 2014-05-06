#!/bin/tcsh
#set flags
set searching=0

set ispr=1
set issyn=1
set isprofiling=1

set islast=0
set iscvs=1

if ($iscvs == 3) then
    set ispr=0
    set issyn=0
    set islast=0
    set isprofiling=0
endif

if ($searching == 1) then
    set ispr=0
    set issyn=0
    set islast=0
    set isprofiling=0
    set iscvs=0
    find ./ -type f -name "*.log" -exec grep -w 'H' {} \; 
endif

#set up clock period etc.
#source ~/parameters.tcl

#set my_begin_time [clock seconds]
set METAL =  "setup.tcl"
set INIT =  "run_init.tcl"
set RUNPT = "run_pt.tcl"
set RUNSI = "run_ptsi.tcl"
set RUNPX = "run_ptpx.tcl"
set DESIGN_TC = "design.tc"
set CTS  = "clock.ctstch"
set PRJ_DIR = "/afs/eos.ncsu.edu/lockers/workspace/ece/ece720/001/ghuang2/gitrepo/proj2"
set DATA_DIR = "${PRJ_DIR}/data"
set PR_DIR =   "${PRJ_DIR}/pr"
set SYN_DIR =  "${PRJ_DIR}/v/synth"
set THIS_DATA = "${ITER}_${CLK_PERIOD}ns_${METAL_LAYER}_${DENSITY}"
echo BEGIN_TIME,`date`, |& tee -a ${DATA_DIR}/mydata.csv

cd ${PR_DIR}
#sed -i '1s/period\s[0-9]*.*/period ${CLK_PERIOD} find(port,"HCLK")/' ${DESIGN_TC}
sed -i "19s/floorplan -su.*/floorplan -su ${ASPECT_RATIO} ${DENSITY} 40 40 40 40/" ${INIT}
sed -i -e "5s/topmetal.*/topmetal ${METAL_LAYER}/ ; s/holdslack.*/holdslack ${HOLDSLACK}/" ${METAL}
if ($ispr == 1) then 
    make clean
    make init
    make place
#make cts
# cp clock.tmpl clock.ctstch
    sed -i -e "s/^Period     .*/Period      ${CLK_PERIOD}ns/   ; s/^MaxDelay  .*/MaxDelay    ${MAX_DELAY}ns/ " ${CTS} 
    sed -i -e "s/^MinDelay   .*/MinDelay    ${MIN_DELAY}ns/    ; s/^MaxSkew   .*/MaxSkew     ${MAX_SKEW}ps/; " ${CTS}

    sed -i -e "s/^SinkMaxTran.*/SinkMaxTran ${SINK_MAX_TRAN}ps/; s/^BufMaxTran.*/BufMaxTran  ${BUF_MAX_TRAN}ps/" ${CTS}
    make cts
    make route
endif

if ($issyn == 1) then
    cd ${SYN_DIR}
#   sed -i "36s/set CLK_PER.*/set CLK_PER ${CLK_PERIOD}/" ${RUNPT}
    #sed -i '/corner fast/ s/corner fast/corner slow/' ${RUNPT}
    #make pt
    #sed -i '/corner slow/ s/corner slow/corner fast/' ${RUNPT}
#   make pt
    
    sed -i "36s/set CLK_PER.*/set CLK_PER ${CLK_PERIOD}/" ${RUNSI}
    make ptsi
    sed -i "36s/set CLK_PER.*/set CLK_PER ${CLK_PERIOD}/" ${RUNPX}
    make ptpx
endif

###########################
#####  Last step only  ####
###########################
if ($islast == 1) then
    cd ${PR_DIR}
    make eps
    
endif

###########################
#######  Profiling  #######
###########################
if ($isprofiling == 1) then
    cd ${DATA_DIR}
    mkdir -p ${THIS_DATA}
    cd ${THIS_DATA}
    ##In pr:
    cp ${PR_DIR}/run_init.tcl ${PR_DIR}/setup.tcl ${PR_DIR}/clock.ctstch ./
    cp ${PR_DIR}/*.def ${PR_DIR}/*.ctsrpt ${PR_DIR}/*.log ./

    ##In v/synth:
    cp ${SYN_DIR}/*.log ${SYN_DIR}/*.rpt ./
# mv ${SYN_DIR}/timing_pt* ./
endif

###########################
#####  Collecting data  ###
###########################
if ($iscvs == 1) then
    cd ${DATA_DIR}/${THIS_DATA}
    echo ${ITER},${CLK_PERIOD}ns,${ASPECT_RATIO},${DENSITY},${MAX_SKEW}ps,${SINK_MAX_TRAN}ps,${BUF_MAX_TRAN}ps,routed, `grep 'Routing Overflow' -B1 run_cts.log | tail -2 |sed -e 's/[A-Z].*: // ; tx;d;:x;s/$/,/;' `\
         `sed -e "/\..*rp/ s/\s*rp-+/,/; tx;d;:x; s/^.*\s[0-9]//;" ${DATA_DIR}/${THIS_DATA}/timing_ptsi_fast_clock.rpt | head -6| awk 'NR!=3&&NR!=4'` \
         `sed -e "/by/! s/slack (//; tx;d;:x; s/)/,/ ;" ${DATA_DIR}/${THIS_DATA}/timing_ptsi_fast_routed.rpt | awk 'BEGIN { FS= " " } ; {print $2"ns,"}' `\
         `sed -e "/by/! s/slack (//; tx;d;:x; s/)/,/ ;" ${DATA_DIR}/${THIS_DATA}/timing_ptsi_fast_routed.rpt | awk 'BEGIN { FS= " " } ; {print $1}' ` \
         `sed -e 's/.*wire length =//; tx;d;:x; s/\./,/;' run_route.log | tail -1` \
         `sed -e '/^cortex_soc/ s/cortex_soc// ; tx;d;:x; s/\s*//' power_ptpx_fast.rpt | awk 'BEGIN { FS= " "};{print $1,$2,$3,$4}' |  sed -e 's/\s[0-9]/,&/g; tx;d;:x'`, \
         `sed -e '/^\s*[0-9]/ s/\./&/; tx;d;:x;s/$/,/;' noise_ptsi_fast_routed.rpt` \
         `sed -e 's/^.*Sinks\s.*://; s/^.*Level\s.*://; tx;d;:x;s/[0-9]$/&,/;' clock.ctsrpt `,${METAL_LAYER},${HOLDSLACK} |& tee -a ${DATA_DIR}/mydata.csv
    echo END TIME,`date`, >>${DATA_DIR}/mydata.csv
endif
echo "END....",`date`
exit
