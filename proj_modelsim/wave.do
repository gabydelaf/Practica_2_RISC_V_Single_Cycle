onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {Tower C} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[8]}
add wave -noupdate -expand -group {Tower C} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[7]}
add wave -noupdate -expand -group {Tower C} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[6]}
add wave -noupdate -expand -group {Tower B} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[5]}
add wave -noupdate -expand -group {Tower B} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[4]}
add wave -noupdate -expand -group {Tower B} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[3]}
add wave -noupdate -expand -group {Tower A} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[2]}
add wave -noupdate -expand -group {Tower A} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[1]}
add wave -noupdate -expand -group {Tower A} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[0]}
add wave -noupdate -expand -group PC /RISC_V_Single_Cycle_TB/DUV/PROGRAM_CONTER/Next_PC
add wave -noupdate -expand -group PC /RISC_V_Single_Cycle_TB/DUV/PROGRAM_CONTER/PC_Value
add wave -noupdate /RISC_V_Single_Cycle_TB/clk_tb
add wave -noupdate /RISC_V_Single_Cycle_TB/reset_tb
add wave -noupdate -expand -group s1 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s1/DataOutput
add wave -noupdate -expand -group s2 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s2/DataOutput
add wave -noupdate -expand -group s3 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s3/DataOutput
add wave -noupdate -expand -group s9 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s9/DataOutput
add wave -noupdate -expand -group a1 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_a1/DataOutput
add wave -noupdate -expand -group a0 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_a0/DataOutput
add wave -noupdate -expand -group s5 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s5/DataOutput
add wave -noupdate -group Branch_control /RISC_V_Single_Cycle_TB/DUV/BRANCH_CONTROL/A_i
add wave -noupdate -group Branch_control /RISC_V_Single_Cycle_TB/DUV/BRANCH_CONTROL/B_i
add wave -noupdate -group Branch_control /RISC_V_Single_Cycle_TB/DUV/BRANCH_CONTROL/Branch_Enable_o
add wave -noupdate -group Branch_control /RISC_V_Single_Cycle_TB/DUV/BRANCH_CONTROL/branch_or_jalr_o
add wave -noupdate -expand -group Imm_Unit /RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/op_i
add wave -noupdate -expand -group Imm_Unit /RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Instruction_bus_i
add wave -noupdate -expand -group Imm_Unit /RISC_V_Single_Cycle_TB/DUV/IMM_UNIT/Immediate_o
add wave -noupdate -expand -group ALU /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/A_i
add wave -noupdate -expand -group ALU /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/B_i
add wave -noupdate -expand -group ALU /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/ALU_Result_o
add wave -noupdate -expand -group Register_file /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Write_Register_i
add wave -noupdate -expand -group Register_file /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Read_Register_1_i
add wave -noupdate -expand -group Register_file /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Read_Register_2_i
add wave -noupdate -expand -group Register_file /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Write_Data_i
add wave -noupdate -expand -group Register_file /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Read_Data_1_o
add wave -noupdate -expand -group Register_file /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Read_Data_2_o
add wave -noupdate -expand -group Mux_a_or_pc /RISC_V_Single_Cycle_TB/DUV/MUX_A_OR_PC/Selector_i
add wave -noupdate -expand -group Mux_a_or_pc /RISC_V_Single_Cycle_TB/DUV/MUX_A_OR_PC/Mux_Data_0_i
add wave -noupdate -expand -group Mux_a_or_pc /RISC_V_Single_Cycle_TB/DUV/MUX_A_OR_PC/Mux_Data_1_i
add wave -noupdate -expand -group Mux_a_or_pc /RISC_V_Single_Cycle_TB/DUV/MUX_A_OR_PC/Mux_Output_o
add wave -noupdate -expand -group Data_memory_unit /RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/Mem_Write_i
add wave -noupdate -expand -group Data_memory_unit /RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/Mem_Read_i
add wave -noupdate -expand -group Data_memory_unit /RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/Write_Data_i
add wave -noupdate -expand -group Data_memory_unit /RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/Address_i
add wave -noupdate -expand -group Data_memory_unit /RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/Read_Data_o
add wave -noupdate -expand -group Mux_result_or_mem /RISC_V_Single_Cycle_TB/DUV/MUX_RESULT_OR_MEM/Selector_i
add wave -noupdate -expand -group Mux_result_or_mem /RISC_V_Single_Cycle_TB/DUV/MUX_RESULT_OR_MEM/Mux_Data_0_i
add wave -noupdate -expand -group Mux_result_or_mem /RISC_V_Single_Cycle_TB/DUV/MUX_RESULT_OR_MEM/Mux_Data_1_i
add wave -noupdate -expand -group Mux_result_or_mem /RISC_V_Single_Cycle_TB/DUV/MUX_RESULT_OR_MEM/Mux_Output_o
add wave -noupdate -expand -group mux_Write_pc /RISC_V_Single_Cycle_TB/DUV/MUX_Write_PC/Selector_i
add wave -noupdate -expand -group mux_Write_pc /RISC_V_Single_Cycle_TB/DUV/MUX_Write_PC/Mux_Data_0_i
add wave -noupdate -expand -group mux_Write_pc /RISC_V_Single_Cycle_TB/DUV/MUX_Write_PC/Mux_Data_1_i
add wave -noupdate -expand -group mux_Write_pc /RISC_V_Single_Cycle_TB/DUV/MUX_Write_PC/Mux_Output_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {456 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 169
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {128 ns} {2048 ns}
