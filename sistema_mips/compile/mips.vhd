-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : sistema_mips
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : E:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\sistema_mips\compile\mips.vhd
-- Generated   : Sun Jun 30 01:00:07 2019
-- From        : E:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\sistema_mips\src\mips.bde
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
       RegWrite : in STD_LOGIC;
       Reset : in STD_LOGIC;
       branch_instruction_address : in STD_LOGIC_VECTOR(31 downto 0);
       write_data : in STD_LOGIC_VECTOR(31 downto 0);
       write_register : in STD_LOGIC_VECTOR(4 downto 0);
       EX_CONTROL : out STD_LOGIC_VECTOR(3 downto 0);
       MEM_CONTROL : out STD_LOGIC_VECTOR(3 downto 0);
       WB_CONTROL : out STD_LOGIC_VECTOR(1 downto 0);
       jump_address : out STD_LOGIC_VECTOR(31 downto 0);
       next_instruction_address_ID : out STD_LOGIC_VECTOR(31 downto 0);
       rd_address : out STD_LOGIC_VECTOR(4 downto 0);
       rs : out STD_LOGIC_VECTOR(31 downto 0);
       rt : out STD_LOGIC_VECTOR(31 downto 0);
       rt_address : out STD_LOGIC_VECTOR(4 downto 0);
       shamt : out STD_LOGIC_VECTOR(4 downto 0);
       signal_extended : out STD_LOGIC_VECTOR(31 downto 0)
  );
end mips;

architecture mips of mips is

---- Component declarations -----

component instruction_decode
  port (
       Clk : in STD_LOGIC;
       Instruction : in STD_LOGIC_VECTOR(31 downto 0);
       RegWrite : in STD_LOGIC;
       Reset : in STD_LOGIC;
       next_instruction_address : in STD_LOGIC_VECTOR(31 downto 0);
       write_data : in STD_LOGIC_VECTOR(31 downto 0);
       write_register : in STD_LOGIC_VECTOR(4 downto 0);
       EX_CONTROL : out STD_LOGIC_VECTOR(3 downto 0);
       MEM_CONTROL : out STD_LOGIC_VECTOR(3 downto 0);
       WB_CONTROL : out STD_LOGIC_VECTOR(1 downto 0);
       jump_address : out STD_LOGIC_VECTOR(31 downto 0);
       next_instruction_address_ID : out STD_LOGIC_VECTOR(31 downto 0);
       rd_address : out STD_LOGIC_VECTOR(4 downto 0);
       rs : out STD_LOGIC_VECTOR(31 downto 0);
       rt : out STD_LOGIC_VECTOR(31 downto 0);
       rt_address : out STD_LOGIC_VECTOR(4 downto 0);
       shamt : out STD_LOGIC_VECTOR(4 downto 0);
       signal_extended : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component instruction_fetch
  port (
       Clk : in STD_LOGIC;
       PCSrc : in STD_LOGIC;
       Reset : in STD_LOGIC;
       branch_instruction_address : in STD_LOGIC_VECTOR(31 downto 0);
       Instruction : out STD_LOGIC_VECTOR(31 downto 0);
       next_instruction_address : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal Instruction : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address : STD_LOGIC_VECTOR(31 downto 0);

begin

----  Component instantiations  ----

instruction_decode_01 : instruction_decode
  port map(
       Clk => Clk,
       EX_CONTROL => EX_CONTROL,
       Instruction => Instruction,
       MEM_CONTROL => MEM_CONTROL,
       RegWrite => RegWrite,
       Reset => Reset,
       WB_CONTROL => WB_CONTROL,
       jump_address => jump_address,
       next_instruction_address => next_instruction_address,
       next_instruction_address_ID => next_instruction_address_ID,
       rd_address => rd_address,
       rs => rs,
       rt => rt,
       rt_address => rt_address,
       shamt => shamt,
       signal_extended => signal_extended,
       write_data => write_data,
       write_register => write_register
  );

instruction_fetch_01 : instruction_fetch
  port map(
       Clk => Clk,
       Instruction => Instruction,
       PCSrc => PCSrc,
       Reset => Reset,
       branch_instruction_address => branch_instruction_address,
       next_instruction_address => next_instruction_address
  );


end mips;
