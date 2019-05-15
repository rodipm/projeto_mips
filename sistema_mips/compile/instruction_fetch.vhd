-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : sistema_mips
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : e:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\sistema_mips\compile\instruction_fetch.vhd
-- Generated   : Wed May 15 01:04:14 2019
-- From        : e:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\sistema_mips\src\instruction_fetch.bde
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
use IEEE.std_logic_unsigned.all;

entity instruction_fetch is
  port(
       Clk : in STD_LOGIC;
       PCSrc : in STD_LOGIC;
       Reset : in STD_LOGIC;
       branch_instruction_address : in STD_LOGIC_VECTOR(31 downto 0);
       Instruction : out STD_LOGIC_VECTOR(31 downto 0)
  );
end instruction_fetch;

architecture instruction_fetch of instruction_fetch is

---- Component declarations -----

component Adder
  port (
       Clk : in STD_LOGIC;
       address_bus : in STD_LOGIC_VECTOR(31 downto 0);
       next_instruction_address_bus : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component instruction_memory
  port (
       address_bus : in STD_LOGIC_VECTOR(31 downto 0);
       Instruction : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component Mux
  port (
       Clk : in STD_LOGIC;
       PCSrc : in STD_LOGIC;
       branch_instruction_address : in STD_LOGIC_VECTOR(31 downto 0);
       next_instruction_address_bus : in STD_LOGIC_VECTOR(31 downto 0);
       mux_pc_bus : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component PC
  port (
       Clk : in STD_LOGIC;
       Reset : in STD_LOGIC;
       mux_pc_bus : in STD_LOGIC_VECTOR(31 downto 0);
       address_bus : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal address_bus : STD_LOGIC_VECTOR(31 downto 0);
signal mux_pc_bus : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address_bus : STD_LOGIC_VECTOR(31 downto 0);

begin

----  Component instantiations  ----

U1 : Mux
  port map(
       Clk => Clk,
       PCSrc => PCSrc,
       branch_instruction_address => branch_instruction_address,
       mux_pc_bus => mux_pc_bus,
       next_instruction_address_bus => next_instruction_address_bus
  );

U2 : PC
  port map(
       Clk => Clk,
       Reset => Reset,
       address_bus => address_bus,
       mux_pc_bus => mux_pc_bus
  );

U3 : instruction_memory
  port map(
       Instruction => Instruction,
       address_bus => address_bus
  );

U4 : Adder
  port map(
       Clk => Clk,
       address_bus => address_bus,
       next_instruction_address_bus => next_instruction_address_bus
  );


end instruction_fetch;
