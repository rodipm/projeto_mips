-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : MIPS_processador
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : D:\Code\OrgArq\github_mips\projeto_mips\MIPS_processador\compile\memory_access.vhd
-- Generated   : Mon Jul  1 01:38:31 2019
-- From        : D:\Code\OrgArq\github_mips\projeto_mips\MIPS_processador\src\memory_access.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;

entity memory_access is
  port(
       Zero : in STD_LOGIC;
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       EX_MEM_CONTROL : in STD_LOGIC_VECTOR(1 downto 0);
       EX_WB_CONTROL : in STD_LOGIC_VECTOR(1 downto 0);
       EX_branch_address : in STD_LOGIC_VECTOR(31 downto 0);
       EX_jump_address : in STD_LOGIC_VECTOR(31 downto 0);
       EX_rs : in STD_LOGIC_VECTOR(31 downto 0);
       ULA_RES : in STD_LOGIC_VECTOR(31 downto 0);
       val : in STD_LOGIC_VECTOR(4 downto 0);
       M_DATA : out STD_LOGIC_VECTOR(31 downto 0);
       M_ULA_RES : out STD_LOGIC_VECTOR(31 downto 0);
       M_WB_CONTROL : out STD_LOGIC_VECTOR(1 downto 0);
       write_register : out STD_LOGIC_VECTOR(4 downto 0)
  );
end memory_access;

architecture memory_access of memory_access is

---- Signal declarations used on the diagram ----

signal BusOutput1 : STD_LOGIC_VECTOR(7 downto 0);

begin

---- Terminal assignment ----

    -- Inputs terminals
	BusOutput1(6) <= EX_WB_CONTROL(0);
	BusOutput1(7) <= EX_WB_CONTROL(1);
	BusOutput1(3) <= val(0);
	BusOutput1(4) <= val(1);
	BusOutput1(5) <= val(2);
	BusOutput1(6) <= val(3);
	BusOutput1(7) <= val(4);

    -- Output\buffer terminals
	M_WB_CONTROL(0) <= BusOutput1(6);
	M_WB_CONTROL(1) <= BusOutput1(7);
	write_register(0) <= BusOutput1(3);
	write_register(1) <= BusOutput1(4);
	write_register(2) <= BusOutput1(5);
	write_register(3) <= BusOutput1(6);
	write_register(4) <= BusOutput1(7);


end memory_access;
