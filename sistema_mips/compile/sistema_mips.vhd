-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : sistema_mips
-- Author      : Rodrigo
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : e:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\sistema_mips\compile\sistema_mips.vhd
-- Generated   : Tue May 14 23:05:45 2019
-- From        : e:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\sistema_mips\src\sistema_mips.bde
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;

entity sistema_mips is 
end sistema_mips;

architecture sistema_mips of sistema_mips is

---- Component declarations -----

component mips
  port (
       Clk : in STD_LOGIC;
       PCSrc : in STD_LOGIC;
       branch_instruction_address : in STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component testbench_mips
  port (
       Clk : out STD_LOGIC;
       PCSrc : out STD_LOGIC;
       branch_instruction_address : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal Clk : STD_LOGIC;
signal PCSrc : STD_LOGIC;
signal branch_instruction_address : STD_LOGIC_VECTOR(31 downto 0);

begin

----  Component instantiations  ----

mips_01 : mips
  port map(
       Clk => Clk,
       PCSrc => PCSrc,
       branch_instruction_address => branch_instruction_address
  );

testbench_mips_01 : testbench_mips
  port map(
       Clk => Clk,
       PCSrc => PCSrc,
       branch_instruction_address => branch_instruction_address
  );


end sistema_mips;
