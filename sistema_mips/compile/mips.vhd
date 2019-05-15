-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : sistema_mips
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : e:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\sistema_mips\compile\mips.vhd
-- Generated   : Wed May 15 01:04:15 2019
-- From        : e:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\sistema_mips\src\mips.bde
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

entity mips is
  port(
       Clk : in STD_LOGIC;
       PCSrc : in STD_LOGIC;
       Reset : in STD_LOGIC;
       branch_instruction_address : in STD_LOGIC_VECTOR(31 downto 0);
       Instruction : out STD_LOGIC_VECTOR(31 downto 0)
  );
end mips;

architecture mips of mips is

---- Component declarations -----

component instruction_fetch
  port (
       Clk : in STD_LOGIC;
       PCSrc : in STD_LOGIC;
       Reset : in STD_LOGIC;
       branch_instruction_address : in STD_LOGIC_VECTOR(31 downto 0);
       Instruction : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

begin

----  Component instantiations  ----

instruction_fetch_01 : instruction_fetch
  port map(
       Clk => Clk,
       Instruction => Instruction,
       PCSrc => PCSrc,
       Reset => Reset,
       branch_instruction_address => branch_instruction_address
  );


end mips;
