
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
create_project: 2

00:00:072

00:00:072

2712.5272
60.0122
73052
23482Z17-722h px� 
i
Command: %s
53*	vivadotcl28
6synth_design -top microprocessor -part xc7z010clg400-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
z
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2	
xc7z010Z17-347h px� 
j
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2	
xc7z010Z17-349h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
4Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
M
#Helper process launched with PID %s4824*oasys2
6770Z8-7075h px� 
�
%s*synth2�
�Starting Synthesize : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 3149.070 ; gain = 425.707 ; free physical = 6569 ; free virtual = 22752
h px� 
�
synthesizing module '%s'%s4497*oasys2
microprocessor2
 2D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/microprocessor.sv2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
	instr_mem2
 2?
;/Users/tony/arc/pro/dev/svdev/rv32core/src-old/instr_mem.sv2
28@Z8-6157h px� 
?
%s
*synth2'
%	Parameter INSTR_MEM bound to: 1'b1 
h p
x
� 
�
synthesizing module '%s'%s4497*oasys2
memory2
 2<
8/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory.sv2
18@Z8-6157h px� 
?
%s
*synth2'
%	Parameter INSTR_MEM bound to: 1'b1 
h p
x
� 
�
,$readmem data file '%s' is read successfully3426*oasys2
	instr.mem2<
8/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory.sv2
198@Z8-3876h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
memory2
 2
02
12<
8/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory.sv2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	instr_mem2
 2
02
12?
;/Users/tony/arc/pro/dev/svdev/rv32core/src-old/instr_mem.sv2
28@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
core2
 2:
6/Users/tony/arc/pro/dev/svdev/rv32core/src-old/core.sv2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
stage_fetch2
 2A
=/Users/tony/arc/pro/dev/svdev/rv32core/src-old/stage_fetch.sv2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
pc2
 28
4/Users/tony/arc/pro/dev/svdev/rv32core/src-old/pc.sv2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
pc2
 2
02
128
4/Users/tony/arc/pro/dev/svdev/rv32core/src-old/pc.sv2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
stage_fetch2
 2
02
12A
=/Users/tony/arc/pro/dev/svdev/rv32core/src-old/stage_fetch.sv2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
stage_decode2
 2B
>/Users/tony/arc/pro/dev/svdev/rv32core/src-old/stage_decode.sv2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
control_unit2
 2B
>/Users/tony/arc/pro/dev/svdev/rv32core/src-old/control_unit.sv2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
type_decoder2
 2B
>/Users/tony/arc/pro/dev/svdev/rv32core/src-old/type_decoder.sv2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
type_decoder2
 2
02
12B
>/Users/tony/arc/pro/dev/svdev/rv32core/src-old/type_decoder.sv2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
control_decoder2
 2E
A/Users/tony/arc/pro/dev/svdev/rv32core/src-old/control_decoder.sv2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
control_decoder2
 2
02
12E
A/Users/tony/arc/pro/dev/svdev/rv32core/src-old/control_decoder.sv2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
control_unit2
 2
02
12B
>/Users/tony/arc/pro/dev/svdev/rv32core/src-old/control_unit.sv2
18@Z8-6155h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
mem_en2
control_unit2
u_cu02B
>/Users/tony/arc/pro/dev/svdev/rv32core/src-old/stage_decode.sv2
288@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
u_cu02
control_unit2
142
132B
>/Users/tony/arc/pro/dev/svdev/rv32core/src-old/stage_decode.sv2
288@Z8-7023h px� 
�
synthesizing module '%s'%s4497*oasys2
immediategen2
 2B
>/Users/tony/arc/pro/dev/svdev/rv32core/src-old/immediategen.sv2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
immediategen2
 2
02
12B
>/Users/tony/arc/pro/dev/svdev/rv32core/src-old/immediategen.sv2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
mux3_82
 2<
8/Users/tony/arc/pro/dev/svdev/rv32core/src-old/mux3_8.sv2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
mux3_82
 2
02
12<
8/Users/tony/arc/pro/dev/svdev/rv32core/src-old/mux3_8.sv2
18@Z8-6155h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
f2
mux3_82
u_mux02B
>/Users/tony/arc/pro/dev/svdev/rv32core/src-old/stage_decode.sv2
548@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
g2
mux3_82
u_mux02B
>/Users/tony/arc/pro/dev/svdev/rv32core/src-old/stage_decode.sv2
548@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
h2
mux3_82
u_mux02B
>/Users/tony/arc/pro/dev/svdev/rv32core/src-old/stage_decode.sv2
548@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
u_mux02
mux3_82
102
72B
>/Users/tony/arc/pro/dev/svdev/rv32core/src-old/stage_decode.sv2
548@Z8-7023h px� 
�
synthesizing module '%s'%s4497*oasys2
register_file2
 2C
?/Users/tony/arc/pro/dev/svdev/rv32core/src-old/register_file.sv2
48@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
register_file2
 2
02
12C
?/Users/tony/arc/pro/dev/svdev/rv32core/src-old/register_file.sv2
48@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
mux2
 29
5/Users/tony/arc/pro/dev/svdev/rv32core/src-old/mux.sv2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
mux2
 2
02
129
5/Users/tony/arc/pro/dev/svdev/rv32core/src-old/mux.sv2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
branch2
 2<
8/Users/tony/arc/pro/dev/svdev/rv32core/src-old/branch.sv2
18@Z8-6157h px� 
�
-case statement is not full and has no default155*oasys2<
8/Users/tony/arc/pro/dev/svdev/rv32core/src-old/branch.sv2
178@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
branch2
 2
02
12<
8/Users/tony/arc/pro/dev/svdev/rv32core/src-old/branch.sv2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
stage_decode2
 2
02
12B
>/Users/tony/arc/pro/dev/svdev/rv32core/src-old/stage_decode.sv2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
stage_execute2
 2C
?/Users/tony/arc/pro/dev/svdev/rv32core/src-old/stage_execute.sv2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
alu2
 29
5/Users/tony/arc/pro/dev/svdev/rv32core/src-old/alu.sv2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
alu2
 2
02
129
5/Users/tony/arc/pro/dev/svdev/rv32core/src-old/alu.sv2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
adder2
 2;
7/Users/tony/arc/pro/dev/svdev/rv32core/src-old/adder.sv2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
adder2
 2
02
12;
7/Users/tony/arc/pro/dev/svdev/rv32core/src-old/adder.sv2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
stage_execute2
 2
02
12C
?/Users/tony/arc/pro/dev/svdev/rv32core/src-old/stage_execute.sv2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
stage_memory2
 2B
>/Users/tony/arc/pro/dev/svdev/rv32core/src-old/stage_memory.sv2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
memory_wrapper2
 2D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
18@Z8-6157h px� 
�
case item %s is unreachable151*oasys2&
$32'b000000000000000000000000000010102D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
288@Z8-151h px� 
�
case item %s is unreachable151*oasys2&
$32'b000000000000000000000000000010112D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
328@Z8-151h px� 
�
-case statement is not full and has no default155*oasys2D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
198@Z8-155h px� 
�
case item %s is unreachable151*oasys2&
$32'b000000000000000000000000000010102D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
498@Z8-151h px� 
�
-case statement is not full and has no default155*oasys2D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
408@Z8-155h px� 
�
case item %s is unreachable151*oasys2&
$32'b000000000000000000000000000010102D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
718@Z8-151h px� 
�
case item %s is unreachable151*oasys2&
$32'b000000000000000000000000000010112D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
748@Z8-151h px� 
�
-case statement is not full and has no default155*oasys2D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
648@Z8-155h px� 
�
case item %s is unreachable151*oasys2&
$32'b000000000000000000000000000010102D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
888@Z8-151h px� 
�
-case statement is not full and has no default155*oasys2D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
818@Z8-155h px� 
�
case item %s is unreachable151*oasys2&
$32'b000000000000000000000000000010102D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
1068@Z8-151h px� 
�
case item %s is unreachable151*oasys2&
$32'b000000000000000000000000000010112D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
1098@Z8-151h px� 
�
-case statement is not full and has no default155*oasys2D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
998@Z8-155h px� 
�
case item %s is unreachable151*oasys2&
$32'b000000000000000000000000000010102D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
1238@Z8-151h px� 
�
-case statement is not full and has no default155*oasys2D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
1168@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
memory_wrapper2
 2
02
12D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
stage_memory2
 2
02
12B
>/Users/tony/arc/pro/dev/svdev/rv32core/src-old/stage_memory.sv2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
stage_writeback2
 2E
A/Users/tony/arc/pro/dev/svdev/rv32core/src-old/stage_writeback.sv2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
mux2_42
 2<
8/Users/tony/arc/pro/dev/svdev/rv32core/src-old/mux2_4.sv2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
mux2_42
 2
02
12<
8/Users/tony/arc/pro/dev/svdev/rv32core/src-old/mux2_4.sv2
18@Z8-6155h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
d2
mux2_42
u_mux22E
A/Users/tony/arc/pro/dev/svdev/rv32core/src-old/stage_writeback.sv2
118@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
u_mux22
mux2_42
62
52E
A/Users/tony/arc/pro/dev/svdev/rv32core/src-old/stage_writeback.sv2
118@Z8-7023h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
stage_writeback2
 2
02
12E
A/Users/tony/arc/pro/dev/svdev/rv32core/src-old/stage_writeback.sv2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
core2
 2
02
12:
6/Users/tony/arc/pro/dev/svdev/rv32core/src-old/core.sv2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

data_mem2
 2>
:/Users/tony/arc/pro/dev/svdev/rv32core/src-old/data_mem.sv2
18@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
memory__parameterized02
 2<
8/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory.sv2
18@Z8-6157h px� 
?
%s
*synth2'
%	Parameter INSTR_MEM bound to: 1'b0 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
memory__parameterized02
 2
02
12<
8/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory.sv2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

data_mem2
 2
02
12>
:/Users/tony/arc/pro/dev/svdev/rv32core/src-old/data_mem.sv2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
microprocessor2
 2
02
12D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/microprocessor.sv2
18@Z8-6155h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2
alu_control_reg2E
A/Users/tony/arc/pro/dev/svdev/rv32core/src-old/control_decoder.sv2
508@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2
imm_sel_reg2E
A/Users/tony/arc/pro/dev/svdev/rv32core/src-old/control_decoder.sv2
718@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2

result_reg2<
8/Users/tony/arc/pro/dev/svdev/rv32core/src-old/branch.sv2
188@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2
masking_reg2D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
178@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2

data_o_reg2D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
228@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2
wrap_load_out_reg2D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
668@Z8-87h px� 
r
9Port %s in module %s is either unconnected or has no load4866*oasys2
rst2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[31]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[30]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[29]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[28]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[27]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[26]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[25]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[24]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[23]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[22]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[21]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[20]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[19]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[18]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[17]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[16]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[15]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[14]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[13]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[12]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[11]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[10]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[9]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[8]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[7]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[6]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[5]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[4]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[3]2
stage_memoryZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
alu_out_address[2]2
stage_memoryZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[31]2
stage_memoryZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[30]2
stage_memoryZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[29]2
stage_memoryZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[28]2
stage_memoryZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[27]2
stage_memoryZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[26]2
stage_memoryZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[25]2
stage_memoryZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[24]2
stage_memoryZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[23]2
stage_memoryZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[22]2
stage_memoryZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[21]2
stage_memoryZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[20]2
stage_memoryZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[19]2
stage_memoryZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[18]2
stage_memoryZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[17]2
stage_memoryZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[16]2
stage_memoryZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[15]2
stage_memoryZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[11]2
stage_memoryZ8-7129h px� 
~
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[10]2
stage_memoryZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[9]2
stage_memoryZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[8]2
stage_memoryZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[7]2
stage_memoryZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[6]2
stage_memoryZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[5]2
stage_memoryZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[4]2
stage_memoryZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[3]2
stage_memoryZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[2]2
stage_memoryZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[1]2
stage_memoryZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
instruction[0]2
stage_memoryZ8-7129h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2	
rst_n_i2
register_fileZ8-7129h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2

instr[6]2
immediategenZ8-7129h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2

instr[5]2
immediategenZ8-7129h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2

instr[4]2
immediategenZ8-7129h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2

instr[3]2
immediategenZ8-7129h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2

instr[2]2
immediategenZ8-7129h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2

instr[1]2
immediategenZ8-7129h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2

instr[0]2
immediategenZ8-7129h px� 
i
9Port %s in module %s is either unconnected or has no load4866*oasys2
load2
pcZ8-7129h px� 
o
9Port %s in module %s is either unconnected or has no load4866*oasys2

dmem_valid2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[31]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[30]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[29]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[28]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[27]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[26]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[25]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[24]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[23]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[22]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[21]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[20]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[19]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[18]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[17]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[16]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[15]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[14]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[13]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[12]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[11]2
pcZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[10]2
pcZ8-7129h px� 
r
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[9]2
pcZ8-7129h px� 
r
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[8]2
pcZ8-7129h px� 
r
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[7]2
pcZ8-7129h px� 
r
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[6]2
pcZ8-7129h px� 
r
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[5]2
pcZ8-7129h px� 
r
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[4]2
pcZ8-7129h px� 
r
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[3]2
pcZ8-7129h px� 
r
9Port %s in module %s is either unconnected or has no load4866*oasys2
address_in[2]2
pcZ8-7129h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-71292
100Z17-14h px� 
�
%s*synth2�
�Finished Synthesize : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 3233.223 ; gain = 509.859 ; free physical = 6230 ; free virtual = 22415
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Constraint Validation : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 3248.219 ; gain = 524.855 ; free physical = 6341 ; free virtual = 22526
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7z010clg400-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
Loading part %s157*device2
xc7z010clg400-1Z21-403h px� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 3256.324 ; gain = 532.961 ; free physical = 6339 ; free virtual = 22525
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
!inferring latch for variable '%s'327*oasys2
imm_sel_reg2E
A/Users/tony/arc/pro/dev/svdev/rv32core/src-old/control_decoder.sv2
718@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
alu_control_reg2E
A/Users/tony/arc/pro/dev/svdev/rv32core/src-old/control_decoder.sv2
508@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2

result_reg2<
8/Users/tony/arc/pro/dev/svdev/rv32core/src-old/branch.sv2
188@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
masking_reg2D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
178@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2

data_o_reg2D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
228@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
wrap_load_out_reg2D
@/Users/tony/arc/pro/dev/svdev/rv32core/src-old/memory_wrapper.sv2
668@Z8-327h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:06 ; elapsed = 00:00:07 . Memory (MB): peak = 3277.254 ; gain = 553.891 ; free physical = 6305 ; free virtual = 22492
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   3 Input   32 Bit       Adders := 1     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   2 Input     32 Bit         XORs := 1     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               32 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 2     
h p
x
� 
&
%s
*synth2
+---RAMs : 
h p
x
� 
X
%s
*synth2@
>	               7K Bit	(255 X 32 bit)          RAMs := 2     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit        Muxes := 27    
h p
x
� 
F
%s
*synth2.
,	   3 Input   32 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input   32 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 8     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   5 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 14    
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   7 Input    1 Bit        Muxes := 2     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
Z
$Part: %s does not have CEAM library.966*device2
xc7z010clg400-1Z21-9227h px� 
p
%s
*synth2X
VPart Resources:
DSPs: 80 (col length:40)
BRAMs: 120 (col length: RAMB18 40 RAMB36 20)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys29
7u_core/u_decodestage/u_cu0/u_controldec0/imm_sel_reg[2]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys29
7u_core/u_decodestage/u_cu0/u_controldec0/imm_sel_reg[1]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys29
7u_core/u_decodestage/u_cu0/u_controldec0/imm_sel_reg[0]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2=
;u_core/u_decodestage/u_cu0/u_controldec0/alu_control_reg[3]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2=
;u_core/u_decodestage/u_cu0/u_controldec0/alu_control_reg[2]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2=
;u_core/u_decodestage/u_cu0/u_controldec0/alu_control_reg[1]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2=
;u_core/u_decodestage/u_cu0/u_controldec0/alu_control_reg[0]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2+
)u_core/u_decodestage/u_branch0/result_reg2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/masking_reg[3]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/masking_reg[2]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/masking_reg[1]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/masking_reg[0]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[31]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[30]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[29]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[28]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[27]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[26]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[25]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[24]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[23]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[22]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[21]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[20]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[19]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[18]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[17]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[16]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[15]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[14]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[13]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[12]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[11]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
/u_core/u_memorystage/u_wrap_mem0/data_o_reg[10]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys20
.u_core/u_memorystage/u_wrap_mem0/data_o_reg[9]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys20
.u_core/u_memorystage/u_wrap_mem0/data_o_reg[8]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys20
.u_core/u_memorystage/u_wrap_mem0/data_o_reg[7]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys20
.u_core/u_memorystage/u_wrap_mem0/data_o_reg[6]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys20
.u_core/u_memorystage/u_wrap_mem0/data_o_reg[5]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys20
.u_core/u_memorystage/u_wrap_mem0/data_o_reg[4]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys20
.u_core/u_memorystage/u_wrap_mem0/data_o_reg[3]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys20
.u_core/u_memorystage/u_wrap_mem0/data_o_reg[2]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys20
.u_core/u_memorystage/u_wrap_mem0/data_o_reg[1]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys20
.u_core/u_memorystage/u_wrap_mem0/data_o_reg[0]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[31]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[30]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[29]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[28]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[27]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[26]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[25]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[24]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[23]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[22]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[21]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[20]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[19]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[18]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[17]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[16]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[15]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[14]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[13]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[12]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[11]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
6u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[10]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys27
5u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[9]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys27
5u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[8]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys27
5u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[7]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys27
5u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[6]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys27
5u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[5]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys27
5u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[4]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys27
5u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[3]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys27
5u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[2]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys27
5u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[1]2
microprocessorZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys27
5u_core/u_memorystage/u_wrap_mem0/wrap_load_out_reg[0]2
microprocessorZ8-3332h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:10 ; elapsed = 00:00:11 . Memory (MB): peak = 3434.836 ; gain = 711.473 ; free physical = 5923 ; free virtual = 22145
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Timing Optimization : Time (s): cpu = 00:00:10 ; elapsed = 00:00:11 . Memory (MB): peak = 3434.918 ; gain = 711.555 ; free physical = 5922 ; free virtual = 22143
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Technology Mapping : Time (s): cpu = 00:00:10 ; elapsed = 00:00:11 . Memory (MB): peak = 3435.016 ; gain = 711.652 ; free physical = 5922 ; free virtual = 22143
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished IO Insertion : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 3435.090 ; gain = 711.727 ; free physical = 6026 ; free virtual = 22157
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 3435.094 ; gain = 711.730 ; free physical = 6026 ; free virtual = 22157
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 3435.129 ; gain = 711.766 ; free physical = 6026 ; free virtual = 22157
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 3435.133 ; gain = 711.770 ; free physical = 6026 ; free virtual = 22157
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 3435.148 ; gain = 711.785 ; free physical = 6026 ; free virtual = 22157
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 3435.148 ; gain = 711.785 ; free physical = 6026 ; free virtual = 22157
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
+
%s*synth2
+-+-----+------+
h px� 
+
%s*synth2
| |Cell |Count |
h px� 
+
%s*synth2
+-+-----+------+
h px� 
+
%s*synth2
+-+-----+------+
h px� 
3
%s
*synth2

Report Instance Areas: 
h p
x
� 
<
%s
*synth2$
"+------+---------+-------+------+
h p
x
� 
<
%s
*synth2$
"|      |Instance |Module |Cells |
h p
x
� 
<
%s
*synth2$
"+------+---------+-------+------+
h p
x
� 
<
%s
*synth2$
"|1     |top      |       |     0|
h p
x
� 
<
%s
*synth2$
"+------+---------+-------+------+
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 3435.180 ; gain = 711.816 ; free physical = 6026 ; free virtual = 22157
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
b
%s
*synth2J
HSynthesis finished with 0 errors, 0 critical warnings and 333 warnings.
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Runtime : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 3435.203 ; gain = 711.840 ; free physical = 6026 ; free virtual = 22157
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 3435.215 ; gain = 711.840 ; free physical = 6026 ; free virtual = 22157
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2
00:00:00.012

00:00:002

3435.9572
0.0272
65292
22665Z17-722h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2

00:00:002

00:00:002

3528.8242
0.0002
64262
22572Z17-722h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

c16477e8Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
682
2062
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
synth_design: 2

00:00:212

00:00:152

3528.9492	
816.1372
64252
22572Z17-722h px� 
�
%s peak %s Memory [%s] %s12246*common2
synth_design2

Physical2
PSS2=
;(MB): overall = 2311.688; main = 1930.473; forked = 637.949Z17-2834h px� 
�
%s peak %s Memory [%s] %s12246*common2
synth_design2	
Virtual2
VSS2>
<(MB): overall = 8072.672; main = 3528.949; forked = 4638.301Z17-2834h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2R
P/Users/tony/arc/pro/dev/svdev/rv32core/zybo/zybo.runs/synth_1/microprocessor.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2g
ereport_utilization -file microprocessor_utilization_synth.rpt -pb microprocessor_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Sun Dec 15 11:35:07 2024Z17-206h px� 


End Record