set ::_synlig_defines [list]
verilog_defines -DPDK_sky130A
lappend ::_synlig_defines +define+PDK_sky130A
verilog_defines "-DSCL_sky130_fd_sc_hd\""
lappend ::_synlig_defines "+define+SCL_sky130_fd_sc_hd\""
verilog_defines -D__openlane__
lappend ::_synlig_defines +define+__openlane__
verilog_defines -D__pnr__
lappend ::_synlig_defines +define+__pnr__
read_liberty -lib -ignore_miss_dir -setattr blackbox /home/phuong-nguyen/.volare/volare/sky130/versions/bdc9412b3e468c102d01b7cf6337be06ec6e9c9a/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
set ::env(SYNTH_LIBS) /home/phuong-nguyen/Downloads/DO_AN_01_removed_testbench/DO_AN_01/CODE/runs/RUN_2024-07-11_13-13-04/tmp/c685588693cc491886504e86d19f29ab.lib
