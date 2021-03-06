-------------------------------------------------------------------------------
--
-- Title       : testbench_mips
-- Design      : sistema_mips
-- Author      : Rodrigo
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : e:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\sistema_mips\src\testbench_mips.vhd
-- Generated   : Sat May 11 17:02:50 2019
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
--{entity {testbench_mips} architecture {testbench_mips}}

library IEEE;
use IEEE.std_logic_1164.all;

entity testbench_mips is
	 port(
		 Clk : out STD_LOGIC;
		 PCSrc : out STD_LOGIC;
		 branch_instruction_address : out STD_LOGIC_VECTOR(31 downto 0);
		 Reset : out STD_LOGIC
	     );
end testbench_mips;

--}} End of automatically maintained section

architecture testbench_mips of testbench_mips is
begin  
	-- enter your statements here --
	branch_instruction_address <= "00000000000000000000000000000000";	
	PCSrc <= '0'; 
	process
	begin 	 
			Reset <= '1';
			wait for 20 ns;
			Reset <= '0'; 
			wait for 10 ns;
			while true loop	
				Clk <= '1';
				wait for 10 ns;
				Clk <= '0';	  
				wait for 10 ns;
			end loop;
	end process; 

		
end testbench_mips;
