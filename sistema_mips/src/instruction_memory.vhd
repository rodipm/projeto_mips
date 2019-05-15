-------------------------------------------------------------------------------
--
-- Title       : instruction_memory
-- Design      : sistema_mips
-- Author      : Rodrigo
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : e:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\sistema_mips\src\instruction_memory.vhd
-- Generated   : Sat May 11 16:33:13 2019
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
--{entity {instruction_memory} architecture {instruction_memory}}

library IEEE;
use IEEE.std_logic_1164.all;

entity instruction_memory is
	 port(
		 address_bus : in STD_LOGIC_VECTOR(31 downto 0);
		 Instruction : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end instruction_memory;

--}} End of automatically maintained section

architecture instruction_memory of instruction_memory is
begin

	-- enter your statements here --	
	process	(address_bus)
	begin
		case address_bus is
			when "00000000000000000000000000000000" =>
				Instruction <= "00000000000000000000000000000001";
			when "00000000000000000000000000000100" =>
				Instruction <= "00000000000000000000000000000010";
			when "00000000000000000000000000001000" =>
				Instruction <= "00000000000000000000000000000011";
			when "00000000000000000000000000001100" =>
				Instruction <= "00000000000000000000000000000100";
			when "00000000000000000000000000010000" =>
				Instruction <= "00000000000000000000000000000101";
			when others =>
				Instruction <= "11111111111111111111111111111111"  ;
		end case;
	end process;

end instruction_memory;
