-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : MIPS_processador
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : d:\Code\OrgArq\MIPS\MIPS_processador\compile\MIPS.vhd
-- Generated   : Sun Jun 30 20:12:43 2019
-- From        : d:\Code\OrgArq\MIPS\MIPS_processador\src\MIPS.bde
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
       Zero : out STD_LOGIC;
       EX_MEM_CONTROL : out STD_LOGIC_VECTOR(1 downto 0);
       EX_WB_CONTROL : out STD_LOGIC_VECTOR(1 downto 0);
       EX_jump_address : out STD_LOGIC_VECTOR(31 downto 0);
       EX_rs : out STD_LOGIC_VECTOR(31 downto 0);
       ULA_RES : out STD_LOGIC_VECTOR(31 downto 0);
       val : out STD_LOGIC_VECTOR(4 downto 0)
  );
end mips;

architecture mips of mips is

---- Component declarations -----

component execution
  port (
       EX_CONTROL : in STD_LOGIC_VECTOR(3 downto 0);
       MEM_CONTROL : in STD_LOGIC_VECTOR(5 downto 0);
       WB_CONTROL : in STD_LOGIC_VECTOR(1 downto 0);
       clk : in STD_LOGIC;
       jump_address : in STD_LOGIC_VECTOR(31 downto 0);
       next_instruction_address_ID : in STD_LOGIC_VECTOR(31 downto 0);
       rd_address : in STD_LOGIC_VECTOR(4 downto 0);
       reset : in STD_LOGIC;
       rs : in STD_LOGIC_VECTOR(31 downto 0);
       rt : in STD_LOGIC_VECTOR(31 downto 0);
       rt_address : in STD_LOGIC_VECTOR(4 downto 0);
       shamt : in STD_LOGIC_VECTOR(4 downto 0);
       signal_extended : in STD_LOGIC_VECTOR(31 downto 0);
       EX_MEM_CONTROL : out STD_LOGIC_VECTOR(1 downto 0);
       EX_WB_CONTROL : out STD_LOGIC_VECTOR(1 downto 0);
       EX_jump_address : out STD_LOGIC_VECTOR(31 downto 0);
       EX_rs : out STD_LOGIC_VECTOR(31 downto 0);
       ULA_RES : out STD_LOGIC_VECTOR(31 downto 0);
       Zero : out STD_LOGIC;
       val : out STD_LOGIC_VECTOR(4 downto 0)
  );
end component;
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
       MEM_CONTROL : out STD_LOGIC_VECTOR(5 downto 0);
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

signal NET410 : STD_LOGIC;
signal BUS3223 : STD_LOGIC_VECTOR(1 downto 0);
signal BUS3234 : STD_LOGIC_VECTOR(5 downto 0);
signal BUS3293 : STD_LOGIC_VECTOR(3 downto 0);
signal BUS3297 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS3340 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS3355 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS3363 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS3389 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS3517 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS3532 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS3540 : STD_LOGIC_VECTOR(31 downto 0);
signal EX_rt : STD_LOGIC_VECTOR(31 downto 0);
signal Instruction : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address : STD_LOGIC_VECTOR(31 downto 0);

begin

----  Component instantiations  ----

U1 : execution
  port map(
       EX_CONTROL => BUS3293,
       EX_MEM_CONTROL => EX_MEM_CONTROL,
       EX_WB_CONTROL => EX_WB_CONTROL,
       EX_jump_address => EX_jump_address,
       EX_rs => EX_rt,
       MEM_CONTROL => BUS3234,
       ULA_RES => ULA_RES,
       WB_CONTROL => BUS3223,
       Zero => Zero,
       clk => Clk,
       jump_address => BUS3540,
       next_instruction_address_ID => BUS3297,
       rd_address => BUS3355,
       reset => reset,
       rs => BUS3389,
       rt => BUS3517,
       rt_address => BUS3340,
       shamt => BUS3532,
       signal_extended => BUS3363,
       val => val
  );

instruction_decode_01 : instruction_decode
  port map(
       Clk => Clk,
       EX_CONTROL => BUS3293,
       Instruction => Instruction,
       MEM_CONTROL => BUS3234,
       RegWrite => RegWrite,
       Reset => NET410,
       WB_CONTROL => BUS3223,
       jump_address => BUS3540,
       next_instruction_address => next_instruction_address,
       next_instruction_address_ID => BUS3297,
       rd_address => BUS3355,
       rs => BUS3389,
       rt => BUS3517,
       rt_address => BUS3340,
       shamt => BUS3532,
       signal_extended => BUS3363,
       write_data => write_data,
       write_register => write_register
  );

instruction_fetch_01 : instruction_fetch
  port map(
       Clk => Clk,
       Instruction => Instruction,
       PCSrc => PCSrc,
       Reset => NET410,
       branch_instruction_address => branch_instruction_address,
       next_instruction_address => next_instruction_address
  );


---- Terminal assignment ----

    -- Inputs terminals
	NET410 <= Reset;

    -- Output\buffer terminals
	EX_rs <= EX_rt;


end mips;
