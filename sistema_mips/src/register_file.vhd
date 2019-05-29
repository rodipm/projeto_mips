-------------------------------------------------------------------------------
--
-- Title       : register_file
-- Design      : sistema_mips
-- Author      : Rodrigo
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : E:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\sistema_mips\src\register_file.vhd
-- Generated   : Sat May 25 02:09:40 2019
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
--{entity {register_file} architecture {register_file}}

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file is
	 port(
		 RegWrite : in STD_LOGIC;
		 write_register : in STD_LOGIC_VECTOR(4 downto 0);
		 write_data : in STD_LOGIC_VECTOR(31 downto 0);
		 Instruction : in STD_LOGIC_VECTOR(25 downto 21);	-- RS Address
		 Instruction_2 : in STD_LOGIC_VECTOR(20 downto 16); -- RT Address
		 Reset : in STD_LOGIC;
		 Clk : in STD_LOGIC;
		 rs_bus : out STD_LOGIC_VECTOR(31 downto 0);
		 rt_bus : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end register_file;

--}} End of automatically maintained section

architecture register_file of register_file is	

type REGS_T is array (31 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
signal REGISTRADORES : REGS_T;	  

begin

	  process(Clk,Reset,RegWrite,write_data,write_register)
	  begin
		if  Reset='1' then
				for i in 0 to 31 loop
					REGISTRADORES(i) <= (others => '0');
				end loop;
		elsif rising_edge(Clk) then
			if  RegWrite='1' then
				REGISTRADORES(to_integer(unsigned(write_register)))<=write_data;
			end if;
		end if;
	  end process;

	rs_bus <= (others=>'0') when Instruction="00000"
	 	else REGISTRADORES(to_integer(unsigned(Instruction)));
		  
	rt_bus <= (others=>'0') when Instruction_2="00000"
    	else REGISTRADORES(to_integer(unsigned(Instruction_2)));


end register_file;
