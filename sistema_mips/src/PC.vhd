-------------------------------------------------------------------------------
--
-- Title       : PC
-- Design      : sistema_mips
-- Author      : Rodrigo
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : e:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\sistema_mips\src\PC.vhd
-- Generated   : Sat May 11 16:22:28 2019
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
--{entity {PC} architecture {PC}}

library IEEE;
use IEEE.std_logic_1164.all;

entity PC is
	 port(
		 mux_pc_bus : in STD_LOGIC_VECTOR(31 downto 0);
		 Clk : in STD_LOGIC;
		 address_bus : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end PC;

--}} End of automatically maintained section

architecture PC of PC is
begin

	-- enter your statements here --  
	process (Clk)
	begin
		if Clk'event and Clk='1' then
			address_bus <= mux_pc_bus;
		end if;
	end process;
end PC;
