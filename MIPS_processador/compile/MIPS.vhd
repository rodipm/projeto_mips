-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : MIPS_processador
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : D:\Code\OrgArq\github_mips\projeto_mips\MIPS_processador\compile\MIPS.vhd
-- Generated   : Mon Jul  1 01:57:52 2019
-- From        : D:\Code\OrgArq\github_mips\projeto_mips\MIPS_processador\src\MIPS.bde
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
       write_register : in STD_LOGIC_VECTOR(4 downto 0)
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
       EX_branch_address : out STD_LOGIC_VECTOR(31 downto 0);
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
component memory_access
  port (
       EX_MEM_CONTROL : in STD_LOGIC_VECTOR(1 downto 0);
       EX_WB_CONTROL : in STD_LOGIC_VECTOR(1 downto 0);
       EX_branch_address : in STD_LOGIC_VECTOR(31 downto 0);
       EX_jump_address : in STD_LOGIC_VECTOR(31 downto 0);
       EX_rs : in STD_LOGIC_VECTOR(31 downto 0);
       ULA_RES : in STD_LOGIC_VECTOR(31 downto 0);
       Zero : in STD_LOGIC;
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       val : in STD_LOGIC_VECTOR(4 downto 0);
       M_DATA : out STD_LOGIC_VECTOR(31 downto 0);
       M_ULA_RES : out STD_LOGIC_VECTOR(31 downto 0);
       M_WB_CONTROL : out STD_LOGIC_VECTOR(1 downto 0);
       write_register : out STD_LOGIC_VECTOR(4 downto 0)
  );
end component;
component write_back
  port (
       M_DATA : in STD_LOGIC_VECTOR(31 downto 0);
       M_ULA_RES : in STD_LOGIC_VECTOR(31 downto 0);
       M_WB_CONTROL : in STD_LOGIC_VECTOR(1 downto 0);
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       write_register : in STD_LOGIC_VECTOR(4 downto 0);
       M_write_register : out STD_LOGIC_VECTOR(4 downto 0);
       RegWrite : out STD_LOGIC;
       WB_DATA : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Signal declarations used on the diagram ----

signal NET138 : STD_LOGIC;
signal NET410 : STD_LOGIC;
signal NET5251 : STD_LOGIC;
signal NET6046 : STD_LOGIC;
signal BUS2335 : STD_LOGIC_VECTOR(31 downto 0);
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
signal BUS5239 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS5243 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS5247 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS5255 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS5259 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS5263 : STD_LOGIC_VECTOR(1 downto 0);
signal BUS5267 : STD_LOGIC_VECTOR(1 downto 0);
signal BUS5717 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS5721 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS5800 : STD_LOGIC_VECTOR(1 downto 0);
signal BUS6149 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS6588 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS6592 : STD_LOGIC_VECTOR(31 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

----  Component instantiations  ----

execution_01 : execution
  port map(
       EX_CONTROL => BUS3293,
       EX_MEM_CONTROL => BUS5263,
       EX_WB_CONTROL => BUS5267,
       EX_branch_address => BUS5255,
       EX_jump_address => BUS5259,
       EX_rs => BUS5243,
       MEM_CONTROL => BUS3234,
       ULA_RES => BUS5247,
       WB_CONTROL => BUS3223,
       Zero => NET5251,
       clk => NET138,
       jump_address => BUS3540,
       next_instruction_address_ID => BUS3297,
       rd_address => BUS3355,
       reset => NET410,
       rs => BUS3389,
       rt => BUS3517,
       rt_address => BUS3340,
       shamt => BUS3532,
       signal_extended => BUS3363,
       val => BUS5239
  );

instruction_decode_01 : instruction_decode
  port map(
       Clk => NET138,
       EX_CONTROL => BUS3293,
       Instruction => BUS6588,
       MEM_CONTROL => BUS3234,
       RegWrite => NET6046,
       Reset => Dangling_Input_Signal,
       WB_CONTROL => BUS3223,
       jump_address => BUS3540,
       next_instruction_address => BUS6592,
       next_instruction_address_ID => BUS3297,
       rd_address => BUS3355,
       rs => BUS3389,
       rt => BUS3517,
       rt_address => BUS3340,
       shamt => BUS3532,
       signal_extended => BUS3363,
       write_data => BUS2335,
       write_register => BUS6149
  );

instruction_fetch_01 : instruction_fetch
  port map(
       Clk => NET138,
       Instruction => BUS6588,
       PCSrc => PCSrc,
       Reset => NET410,
       branch_instruction_address => branch_instruction_address,
       next_instruction_address => BUS6592
  );

memory_access_01 : memory_access
  port map(
       EX_MEM_CONTROL => BUS5263,
       EX_WB_CONTROL => BUS5267,
       EX_branch_address => BUS5255,
       EX_jump_address => BUS5259,
       EX_rs => BUS5243,
       M_DATA => BUS5721,
       M_ULA_RES => BUS5717,
       M_WB_CONTROL => BUS5800,
       ULA_RES => BUS5247,
       Zero => NET5251,
       clk => NET138,
       reset => reset,
       val => BUS5239
  );

write_back_01 : write_back
  port map(
       M_DATA => BUS5721,
       M_ULA_RES => BUS5717,
       M_WB_CONTROL => BUS5800,
       M_write_register => BUS6149,
       RegWrite => NET6046,
       WB_DATA => BUS2335,
       write_register(0) => Dangling_Input_Signal,
       write_register(1) => Dangling_Input_Signal,
       write_register(2) => Dangling_Input_Signal,
       write_register(3) => Dangling_Input_Signal,
       write_register(4) => Dangling_Input_Signal,
       clk => NET138,
       reset => reset
  );


---- Terminal assignment ----

    -- Inputs terminals
	NET138 <= Clk;
	NET410 <= Reset;


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end mips;
