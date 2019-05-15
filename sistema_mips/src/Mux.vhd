-------------------------------------------------------------------------------
--
-- Title       : Mux
-- Design      : sistema_mips
-- Author      : Rodrigo
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : e:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\sistema_mips\src\Mux.vhd
-- Generated   : Wed May 15 00:02:02 2019
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
--{entity {Mux} architecture {Mux}}

library IEEE;
use IEEE.std_logic_1164.all;

entity Mux is
	 port(
		 PCSrc : in STD_LOGIC;
		 next_instruction_address_bus : in STD_LOGIC_VECTOR(31 downto 0);
		 branch_instruction_address : in STD_LOGIC_VECTOR(31 downto 0);
		 mux_pc_bus : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end Mux;

--}} End of automatically maintained section

architecture Mux of Mux is
begin

	process (PCSrc, next_instruction_address_bus, branch_instruction_address)		
	begin	
		if PCSrc = '1' then
			mux_pc_bus <= branch_instruction_address;
		elsif  PCSrc = '0' then
			mux_pc_bus <= next_instruction_address_bus;
		end if;		 
	end process;
end Mux;
