-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : sistema_mips
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : E:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\sistema_mips\compile\instruction_fetch.vhd
-- Generated   : Fri May 24 17:53:54 2019
-- From        : E:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\sistema_mips\src\instruction_fetch.bde
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
       Instruction : out STD_LOGIC_VECTOR(31 downto 0);
       next_instruction_address : out STD_LOGIC_VECTOR(31 downto 0)
  );
end instruction_fetch;

architecture instruction_fetch of instruction_fetch is

---- Component declarations -----

component Adder
  port (
       address_bus : in STD_LOGIC_VECTOR(31 downto 0);
       next_instruction_address_bus : out STD_LOGIC_VECTOR(31 downto 0)
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
component Mux
  port (
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
signal instruction_bus : STD_LOGIC_VECTOR(31 downto 0);
signal mux_pc_bus : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address_bus : STD_LOGIC_VECTOR(31 downto 0);

begin

----  Component instantiations  ----

ADDER_IF : Adder
  port map(
       address_bus => address_bus,
       next_instruction_address_bus => next_instruction_address_bus
  );

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

MUX_IF : Mux
  port map(
       PCSrc => PCSrc,
       branch_instruction_address => branch_instruction_address,
       mux_pc_bus => mux_pc_bus,
       next_instruction_address_bus => next_instruction_address_bus
  );

PC_IF : PC
  port map(
       Clk => Clk,
       Reset => Reset,
       address_bus => address_bus,
       mux_pc_bus => mux_pc_bus
  );


end instruction_fetch;
