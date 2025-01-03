# Define project parameters
set project_name "rv32zybo"
set project_dir "./boards/${project_name}"
set src_dir "./src"
set tb_dir "./tb"
set synth_dir "./synth"
set part "xc7z010clg400-1"
set board_name "digilentinc.com:zybo:part0:1.0"

# Create a new project
create_project $project_name $project_dir -part $part -force
# xhub::refresh_catalog [xhub::get_xstores xilinx_board_store]
# xhub::install [xhub::get_xitems]
# set_param board.repoPaths [get_property LOCAL_ROOT_DIR [xhub::get_xstores xilinx_board_store]]
# set_property board_part $board_name [current_project]

# Add design files
foreach file [glob -directory $src_dir *.v *.sv *.svh] {
    add_files $file
}

# Add constraint files
foreach xdc_file [glob -directory $synth_dir *.xdc] {
    add_files $xdc_file -fileset constrs_1
}

# Add simulation files
foreach tb_file [glob -directory $tb_dir *.v *.vh *.sv *.svh] {
    add_files $tb_file -fileset sim_1
}

# Set the top module
set top_module "soc"
set_property top $top_module [current_fileset]

# if using any ip cores
# update_ip_catalog

# # run synthesis
# launch_runs synth_1 -jobs 4
#
# # wait for synthesis to complete
# wait_on_run synth_1
#
# # run implementation
# launch_runs impl_1 -jobs 4
#
# # wait for implementation to complete
# wait_on_run impl_1

# # generate the bitstream
# launch_runs impl_1 -to_step write_bitstream
# wait_on_run impl_1

# open the implemented design
open_run impl_1

# save the project and close vivado
save_project_as $project_name
exit

# open_hw_manager
# connect_hw_server
# get_hw_server
# refresh_hw_server
# get_hw_targets
# open_hw_target [lindex [get_hw_targets] 0]
# get_hw_devices
# current_hw_device [lindex [get_hw_devices] 0]
