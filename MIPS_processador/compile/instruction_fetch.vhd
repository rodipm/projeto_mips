-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : MIPS_processador
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : E:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\MIPS_processador\compile\instruction_fetch.vhd
-- Generated   : Tue Jul  2 00:15:42 2019
-- From        : E:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\MIPS_processador\src\instruction_fetch.bde
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
use IEEE.numeric_std.all;

entity instruction_fetch is
  port(
       Clk : in STD_LOGIC;
       PCSrc : in STD_LOGIC;
       Reset : in STD_LOGIC;
       branch_instruction_address : in STD_LOGIC_VECTOR(31 downto 0);
       Instruction : out STD_LOGIC_VECTOR(31 downto 0);
       next_instruction_address : out STD_LOGIC_VECTOR(31 downto 0)
  );
end instruction_fetch;

architecture instruction_fetch of instruction_fetch is

---- Component declarations -----

component adder
  port (
       A : in std_logic_vector(31 downto 0);
       B : in std_logic_vector(31 downto 0);
       resultado : out std_logic_vector(31 downto 0)
  );
end component;
component IF_ID_REG
  port (
       Clk : in STD_LOGIC;
       Reset : in STD_LOGIC;
       instruction_bus : in STD_LOGIC_VECTOR(31 downto 0);
       next_instruction_address_bus : in STD_LOGIC_VECTOR(31 downto 0);
       Instruction : out STD_LOGIC_VECTOR(31 downto 0);
       next_instruction_address : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component instruction_memory
  port (
       address_bus : in STD_LOGIC_VECTOR(31 downto 0);
       instruction_bus : out STD_LOGIC_VECTOR(31 downto 0)
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
component multiplexador
  generic(
       NumeroBits : INTEGER := 32
  );
  port (
       input0 : in STD_LOGIC_VECTOR(31 downto 0);
       input1 : in STD_LOGIC_VECTOR(31 downto 0);
       selection : in STD_LOGIC;
       output : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal A : std_logic_vector(31 downto 0);
signal address_bus : STD_LOGIC_VECTOR(31 downto 0);
signal instruction_bus : STD_LOGIC_VECTOR(31 downto 0);
signal mux_pc_bus : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address_bus : STD_LOGIC_VECTOR(31 downto 0);

begin

---- User Signal Assignments ----
A <= std_logic_vector(to_unsigned(4, 32));

----  Component instantiations  ----

IF_ID_REG_01 : IF_ID_REG
  port map(
       Clk => Clk,
       Instruction => Instruction,
       Reset => Reset,
       instruction_bus => instruction_bus,
       next_instruction_address => next_instruction_address,
       next_instruction_address_bus => next_instruction_address_bus
  );

INSTRUCTION_MEMORY_IF : instruction_memory
  port map(
       address_bus => address_bus,
       instruction_bus => instruction_bus
  );

PC_IF : PC
  port map(
       Clk => Clk,
       Reset => Reset,
       address_bus => address_bus,
       mux_pc_bus => mux_pc_bus
  );

U3 : multiplexador
  port map(
       input0 => next_instruction_address_bus,
       input1 => branch_instruction_address,
       output => mux_pc_bus,
       selection => PCSrc
  );

U6 : adder
  port map(
       A => A,
       B => address_bus,
       resultado => next_instruction_address_bus
  );


end instruction_fetch;
