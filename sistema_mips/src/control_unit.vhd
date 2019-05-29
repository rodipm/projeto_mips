-------------------------------------------------------------------------------
--
-- Title       : control_unit
-- Design      : sistema_mips
-- Author      : Rodrigo
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : E:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\sistema_mips\src\control_unit.vhd
-- Generated   : Fri May 24 19:18:16 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {control_unit} architecture {control_unit}}

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unit is
	 port(
		 Instruction : in STD_LOGIC_VECTOR(31 downto 26);
		 WB_CONTROL_BUS : out STD_LOGIC_VECTOR(1 downto 0);
		 MEM_CONTROL_BUS : out STD_LOGIC_VECTOR(2 downto 0);
		 EX_CONTROL_BUS : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end control_unit;

--}} End of automatically maintained section

architecture control_unit of control_unit is
	signal R_TYPE : STD_LOGIC;
	signal LW : STD_LOGIC;
	signal SW : STD_LOGIC;
	--signal BEQ : STD_LOGIC;
	
	signal RegWrite : STD_LOGIC;
	signal MemtoReg : STD_LOGIC;
	signal Branch : STD_LOGIC;
	signal MemRead : STD_LOGIC;
	signal MemWrite : STD_LOGIC;
	signal RegDst : STD_LOGIC;
	signal ULAop1 : STD_LOGIC;
	signal ULAop2 : STD_LOGIC;
	signal ULAsrc : STD_LOGIC;
begin

	-- enter your statements here -- 
	
	R_TYPE	<=	not Instruction(31) and not Instruction(30) and not Instruction(29) and 
		not Instruction(28) and not Instruction(27) and not Instruction(26);
		
	LW <= Instruction(31) and not Instruction(30) and not Instruction(29) and 
		not Instruction(28) and Instruction(27) and Instruction(26);
		
	SW <= Instruction(31) and not Instruction(30) and Instruction(29) and 
		not Instruction(28) and Instruction(27) and Instruction(26);
	
	RegWrite	<= R_TYPE or LW;		
	MemtoReg	<= LW;		
	--Branch		<= BEQ;	  
	Branch		<= '0';	
	MemRead		<= LW;
	MemWrite	<= SW;
	RegDst		<= R_TYPE;
	ULAsrc		<= LW or SW;
	--ULAOp1		<= BEQ;	
	ULAOp1		<= '0';
	ULAOp2		<= R_TYPE;
	
	WB_CONTROL_BUS <= (0 => RegWrite,
					  1 => MemtoReg);
	MEM_CONTROL_BUS <= ( 0 => Branch,
						1 => MemRead,
						2 => MemWrite);
	EX_CONTROL_BUS <= (0 => RegDst,
						1 => ULAop1,
						2 => ULAop2,
						3 => ULAsrc);

end control_unit;
