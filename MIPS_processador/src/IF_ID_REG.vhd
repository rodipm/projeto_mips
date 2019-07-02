-------------------------------------------------------------------------------
--
-- Title       : IF_ID_REG
-- Design      : sistema_mips
-- Author      : Rodrigo
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : E:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\sistema_mips\src\IF_ID_REG.vhd
-- Generated   : Wed May 15 17:24:20 2019
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
--{entity {IF_ID_REG} architecture {IF_ID_REG}}

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity IF_ID_REG is
	 port(
		 next_instruction_address_bus : in STD_LOGIC_VECTOR(31 downto 0);
		 instruction_bus : in STD_LOGIC_VECTOR(31 downto 0);
		 Clk : in STD_LOGIC;
		 Reset : in STD_LOGIC;	
		 stall : in STD_LOGIC;
		 next_instruction_address : out STD_LOGIC_VECTOR(31 downto 0);
		 Instruction : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end IF_ID_REG;

--}} End of automatically maintained section

architecture IF_ID_REG of IF_ID_REG is
begin

	-- enter your statements here -- 
	process(Clk,Reset, next_instruction_address_bus, instruction_bus, stall)
		begin
			if Reset = '1' then
				next_instruction_address <= "00000000000000000000000000000000";
				Instruction	<= "11111100000000000000000000111111";
			elsif rising_edge(CLK) and stall='0' then
				next_instruction_address <= next_instruction_address_bus;
				Instruction <= instruction_bus;
			end if;
		end process; 

end IF_ID_REG;
