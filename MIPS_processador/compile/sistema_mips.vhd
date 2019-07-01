-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : MIPS_processador
-- Author      : Rodrigo
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : E:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\MIPS_processador\compile\sistema_mips.vhd
-- Generated   : Mon Jul  1 12:38:10 2019
-- From        : E:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\MIPS_processador\src\sistema_mips.bde
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
       RegWrite : in STD_LOGIC;
       Reset : in STD_LOGIC;
       branch_instruction_address : in STD_LOGIC_VECTOR(31 downto 0);
       write_data : in STD_LOGIC_VECTOR(31 downto 0);
       write_register : in STD_LOGIC_VECTOR(4 downto 0)
  );
end component;
component testbench_mips
  port (
       Clk : out STD_LOGIC;
       PCSrc : out STD_LOGIC;
       RegWrite : out STD_LOGIC;
       Reset : out STD_LOGIC;
       branch_instruction_address : out STD_LOGIC_VECTOR(31 downto 0);
       write_data : out STD_LOGIC_VECTOR(31 downto 0);
       write_register : out STD_LOGIC_VECTOR(4 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal Clk : STD_LOGIC;
signal PCSrc : STD_LOGIC;
signal RegWrite : STD_LOGIC;
signal Reset : STD_LOGIC;
signal branch_instruction_address : STD_LOGIC_VECTOR(31 downto 0);
signal write_data : STD_LOGIC_VECTOR(31 downto 0);
signal write_register : STD_LOGIC_VECTOR(4 downto 0);

begin

----  Component instantiations  ----

mips_01 : mips
  port map(
       Clk => Clk,
       PCSrc => PCSrc,
       RegWrite => RegWrite,
       Reset => Reset,
       branch_instruction_address => branch_instruction_address,
       write_data => write_data,
       write_register => write_register
  );

testbench_mips_01 : testbench_mips
  port map(
       Clk => Clk,
       PCSrc => PCSrc,
       RegWrite => RegWrite,
       Reset => Reset,
       branch_instruction_address => branch_instruction_address,
       write_data => write_data,
       write_register => write_register
  );


end sistema_mips;
