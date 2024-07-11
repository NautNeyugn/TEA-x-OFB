set ::_synlig_defines [list]
verilog_defines -DPDK_sky130A
lappend ::_synlig_defines +define+PDK_sky130A
verilog_defines "-DSCL_sky130_fd_sc_hd\""
lappend ::_synlig_defines "+define+SCL_sky130_fd_sc_hd\""
verilog_defines -D__openlane__
lappend ::_synlig_defines +define+__openlane__
verilog_defines -D__pnr__
lappend ::_synlig_defines +define+__pnr__
verilog_defines -DUSE_POWER_PINS
lappend ::_synlig_defines +define+USE_POWER_PINS
read_verilog -sv -lib /home/phuong-nguyen/Downloads/DO_AN_01_removed_testbench/DO_AN_01/CODE/runs/RUN_2024-07-11_13-13-04/tmp/3073fb54460f4477b3c748b8202f5165.bb.v
set ::env(SYNTH_LIBS) /home/phuong-nguyen/Downloads/DO_AN_01_removed_testbench/DO_AN_01/CODE/runs/RUN_2024-07-11_13-13-04/tmp/c685588693cc491886504e86d19f29ab.lib
