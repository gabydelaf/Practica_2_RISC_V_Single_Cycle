/******************************************************************
* Description
*	This is the top-level of a RISC-V Microprocessor that can execute the next set of instructions:
*		add
*		addi
* This processor is written Verilog-HDL. It is synthesizabled into hardware.
* Parameter MEMORY_DEPTH configures the program memory to allocate the program to
* be executed. If the size of the program changes, thus, MEMORY_DEPTH must change.
* This processor was made for computer organization class at ITESO.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/

module RISC_V_Single_Cycle
#(
	parameter PROGRAM_MEMORY_DEPTH = 128,
	parameter DATA_MEMORY_DEPTH = 128
)

(
	// Inputs
	input clk,
	input reset,
	output result

);
//******************************************************************/
//******************************************************************/

//******************************************************************/
//******************************************************************/
/* Signals to connect modules*/

/**Control**/
wire alu_src_w;
wire reg_write_w;
wire mem_to_reg_w;
wire mem_write_w;
wire mem_read_w;
wire [2:0] alu_op_w;
wire branch_w;//se añade el wire para el branch

/** Program Counter**/
wire [31:0] pc_plus_4_w;
wire [31:0] pc_w;


/**Register File**/
wire [31:0] read_data_1_w;
wire [31:0] read_data_2_w;

/**Inmmediate Unit**/
wire [31:0] inmmediate_data_w;

/**ALU**/
wire [31:0] alu_result_w;

/**Multiplexer MUX_DATA_OR_IMM_FOR_ALU**/
wire [31:0] read_data_2_or_imm_w;

/**ALU Control**/
wire [3:0] alu_operation_w;

/**Instruction Bus**/	
wire [31:0] instruction_bus_w;
//wire data out data memory
wire [31:0] memory_out_w;
//Multiplexer Memory or Result
wire [31:0] mem_out_or_result_w;

wire [31:0] mux_a_w;

//PC nuevo
wire [31:0] pc_new_w;
wire [31:0] pc_w_2;

//añadir cable de salida de mux a o pc
wire [31:0] mux_pc_a_w;

//se añade cable de a ver si ahora sí es branch
wire branch_E_w;

//se añade cable para activar el mux que decide si sumar PC o el rs1
wire b_o_j_w;

//wire que va al write register
wire [31:0]res_write_w;

//assign result = res_write_w;

//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
Control
CONTROL_UNIT
(
	/****/
	.OP_i(instruction_bus_w[6:0]),
	/** outputus**/
	.ALU_Op_o(alu_op_w),
	.ALU_Src_o(alu_src_w),
	.Reg_Write_o(reg_write_w),
	.Mem_to_Reg_o(mem_to_reg_w),
	.Mem_Read_o(mem_read_w),
	.Mem_Write_o(mem_write_w),
	.Branch_o(branch_w)//se conecta el bit de branch al cable
);

PC_Register
PROGRAM_CONTER
(
	.clk(clk),
	.reset(reset),
	.Next_PC(pc_w_2),
	.PC_Value(pc_w)

);

Program_Memory
#(
	.MEMORY_DEPTH(PROGRAM_MEMORY_DEPTH)
)
PROGRAM_MEMORY
(
	.Address_i(pc_w),
	.Instruction_o(instruction_bus_w)
);


Adder_32_Bits
PC_PLUS_4
(
	.Data0(pc_w),
	.Data1(4),
	
	.Result(pc_plus_4_w)
);


//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/



Register_File
REGISTER_FILE_UNIT
(
	.clk(clk),
	.reset(reset),
	.Reg_Write_i(reg_write_w),
	.Write_Register_i(instruction_bus_w[11:7]),
	.Read_Register_1_i(instruction_bus_w[19:15]),
	.Read_Register_2_i(instruction_bus_w[24:20]),
	.Write_Data_i(res_write_w),//se modifica para que lea del multiplexor
	.Read_Data_1_o(read_data_1_w),
	.Read_Data_2_o(read_data_2_w)

);


Immediate_Unit
IMM_UNIT
(  .op_i(instruction_bus_w[6:0]),
   .Instruction_bus_i(instruction_bus_w),
   .Immediate_o(inmmediate_data_w)
);



Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_DATA_OR_IMM_FOR_ALU
(
	.Selector_i(alu_src_w),
	.Mux_Data_0_i(read_data_2_w),
	.Mux_Data_1_i(inmmediate_data_w),
	
	.Mux_Output_o(read_data_2_or_imm_w)

);


ALU_Control
ALU_CONTROL_UNIT
(
	.funct7_i(instruction_bus_w[30]),
	.ALU_Op_i(alu_op_w),
	.funct3_i(instruction_bus_w[14:12]),
	.ALU_Operation_o(alu_operation_w)

);



ALU
ALU_UNIT
(
	.ALU_Operation_i(alu_operation_w),
	.A_i(mux_pc_a_w),
	.B_i(read_data_2_or_imm_w),
	.ALU_Result_o(alu_result_w)
);
//Se instancia Data Memory
Data_Memory
#(
	.DATA_WIDTH(32)
)
DATA_MEMORY_UNIT
(
	.clk(clk),
	.Mem_Write_i(mem_write_w),
	.Mem_Read_i(mem_read_w),
	.Write_Data_i(read_data_2_w),
	.Address_i(alu_result_w),
	.Read_Data_o(memory_out_w)

);

//Multiplexor para lw
Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_RESULT_OR_MEM
(
	.Selector_i(mem_read_w),
	.Mux_Data_0_i(alu_result_w),
	.Mux_Data_1_i(memory_out_w),
	
	.Mux_Output_o(mem_out_or_result_w)

);


//Multiplexor para branch
Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_PC
(
	.Selector_i(branch_E_w),
	.Mux_Data_0_i(pc_plus_4_w),
	.Mux_Data_1_i(alu_result_w),
	
	.Mux_Output_o(pc_w_2)

);

//Multiplexor para PC
Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_A_OR_PC
(
	.Selector_i(b_o_j_w),
	.Mux_Data_0_i(read_data_1_w),
	.Mux_Data_1_i(pc_w),
	
	.Mux_Output_o(mux_pc_a_w)

);

//Branch Control

Branch_Control
BRANCH_CONTROL
(
	.Branch_Enable_i(branch_w),
	.OP_i(instruction_bus_w[6:0]),
	.funct3_i(instruction_bus_w[14:12]),
	.A_i(read_data_1_w),
	.B_i(read_data_2_w),
	
	.Branch_Enable_o(branch_E_w),
	.branch_or_jalr_o(b_o_j_w)
);

//Multiplexor para escribir el pc en el registro destino
Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_Write_PC
(
	.Selector_i(branch_E_w),
	.Mux_Data_0_i(mem_out_or_result_w),
	.Mux_Data_1_i(pc_plus_4_w),
	
	.Mux_Output_o(res_write_w)

);

endmodule

