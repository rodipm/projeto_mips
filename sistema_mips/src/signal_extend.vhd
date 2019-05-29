-------------------------------------------------------------------------------
--
-- Title       : signal_extend
-- Design      : sistema_mips
-- Author      : Rodrigo
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : E:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\sistema_mips\src\signal_extend.vhd
-- Generated   : Sat May 25 02:07:15 2019
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
--{entity {signal_extend} architecture {signal_extend}}

library IEEE;
use IEEE.std_logic_1164.all;

entity signal_extend is
	 port(
		 Instruction : in STD_LOGIC_VECTOR(15 downto 0);
		 signal_extended_bus : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end signal_extend;

--}} End of automatically maintained section

architecture signal_extend of signal_extend is
begin

	 -- enter your statements here --
	 signal_extended_bus <= X"0000" & Instruction when Instruction(15)='0' else X"ffff" & Instruction;
end signal_extend;
