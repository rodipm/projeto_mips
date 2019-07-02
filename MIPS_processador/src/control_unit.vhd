library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unit is
	 port(
		 Instruction : in STD_LOGIC_VECTOR(31 downto 0);
		 WB_CONTROL_BUS : out STD_LOGIC_VECTOR(1 downto 0);
		 MEM_CONTROL_BUS : out STD_LOGIC_VECTOR(5 downto 0);
		 EX_CONTROL_BUS : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end control_unit;

architecture control_unit of control_unit is
	signal R_TYPE : STD_LOGIC;
	signal LW : STD_LOGIC;
	signal SW : STD_LOGIC;
	signal ADDI : STD_LOGIC;
	signal SLTI : STD_LOGIC;
	signal BEQ : STD_LOGIC;	   
	signal BNE : STD_LOGIC;
	signal J : STD_LOGIC;
	signal JR : STD_LOGIC; 
	signal JAL : STD_LOGIC;
	
	signal RegWrite : STD_LOGIC;
	signal MemtoReg : STD_LOGIC;
	signal Branch : STD_LOGIC;
	signal Jump : STD_LOGIC;
	signal MemRead : STD_LOGIC;
	signal MemWrite : STD_LOGIC;
	signal RegDst : STD_LOGIC;
	signal ULAop1 : STD_LOGIC;
	signal ULAop2 : STD_LOGIC;
	signal ULAsrc : STD_LOGIC;
	signal BranchEqual : STD_LOGIC;
	signal BranchNotEqual : STD_LOGIC;
	signal JumpRegister : STD_LOGIC;
begin
	R_TYPE	<=	not Instruction(31) and not Instruction(30) and not Instruction(29) and	-- 000000 = 0
		not Instruction(28) and not Instruction(27) and not Instruction(26);
		
	LW <= Instruction(31) and not Instruction(30) and not Instruction(29) and  -- 100011 = 35
		not Instruction(28) and Instruction(27) and Instruction(26);
		
	SW <= Instruction(31) and not Instruction(30) and Instruction(29) and  -- 101011= 43
		not Instruction(28) and Instruction(27) and Instruction(26);
	
	ADDI <= not Instruction(31) and not Instruction(30) and Instruction(29) and -- 001000 = 8
		not Instruction(28) and not Instruction(27) and not Instruction(26);	 
	
	SLTI <= not Instruction(31) and not Instruction(30) and Instruction(29) and -- 001010 = 10
		not Instruction(28) and Instruction(27) and not Instruction(26);
	
	BEQ <= not Instruction(31) and not Instruction(30) and not Instruction(29) and -- 000100 = 4
		Instruction(28) and not Instruction(27) and not Instruction(26); 
	
	BNE <= not Instruction(31) and not Instruction(30) and not Instruction(29) and -- 000101 = 5
		Instruction(28) and not Instruction(27) and Instruction(26);  
	
	J <= not Instruction(31) and not Instruction(30) and not Instruction(29) and   -- 000010 = 2
		not Instruction(28) and Instruction(27) and not Instruction(26);  
	
	JR <= not Instruction(31) and not Instruction(30) and not Instruction(29) and  -- op = 0
		not Instruction(28) and not Instruction(27) and not Instruction(26) and
		not Instruction(5) and not Instruction(4) and Instruction(3) and  -- func => 001000 = 8
		not Instruction(2) and not Instruction(1) and not Instruction(0);
	
	JAL <= not Instruction(31) and not Instruction(30) and not Instruction(29) and -- 000011 = 3
		not Instruction(28) and Instruction(27) and Instruction(26);	 
	
	
	RegWrite	<= R_TYPE or LW or ADDI or SLTI or JAL;		
	MemtoReg	<= LW;		
	Jump		<= J or JAL; 
	JumpRegister <= JR;
	BranchEqual	<= BEQ;
	BranchNotEqual <= BNE;
	MemRead		<= LW;
	MemWrite	<= SW;
	RegDst		<= R_TYPE;
	ULAsrc		<= LW or SW or ADDI or SLTI;
	ULAOp1		<= BEQ or BNE or SLTI;	
	ULAOp2		<= R_TYPE or SLTI;
	
	WB_CONTROL_BUS <= (0 => RegWrite,
					  1 => MemtoReg);
	MEM_CONTROL_BUS <= ( 0 => BranchEqual,
						1 => BranchNotEqual,
						2 => MemRead,
						3 => MemWrite,
						4 => Jump,
						5 => JumpRegister);
	EX_CONTROL_BUS <= (0 => RegDst,
						1 => ULAop1,
						2 => ULAop2,
						3 => ULAsrc);

end control_unit;
