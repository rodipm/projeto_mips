-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : MIPS_processador
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : E:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\MIPS_processador\compile\MIPS.vhd
-- Generated   : Mon Jul  1 12:38:08 2019
-- From        : E:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\MIPS_processador\src\MIPS.bde
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
       EX_MEM_CONTROL : out STD_LOGIC_VECTOR(5 downto 0);
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
       EX_MEM_CONTROL : in STD_LOGIC_VECTOR(5 downto 0);
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
       PCSrc : out STD_LOGIC;
       branch_instruction_address : out STD_LOGIC_VECTOR(31 downto 0);
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

---- Signal declarations used on the diagram ----

signal NET138 : STD_LOGIC;
signal NET410 : STD_LOGIC;
signal NET5251 : STD_LOGIC;
signal NET6046 : STD_LOGIC;
signal NET6613 : STD_LOGIC;
signal next_instruction_address_IF2335 : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address_IF3223 : STD_LOGIC_VECTOR(1 downto 0);
signal next_instruction_address_IF3234 : STD_LOGIC_VECTOR(5 downto 0);
signal next_instruction_address_IF3293 : STD_LOGIC_VECTOR(3 downto 0);
signal next_instruction_address_IF3297 : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address_IF3340 : STD_LOGIC_VECTOR(4 downto 0);
signal next_instruction_address_IF3355 : STD_LOGIC_VECTOR(4 downto 0);
signal next_instruction_address_IF3363 : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address_IF3389 : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address_IF3517 : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address_IF3532 : STD_LOGIC_VECTOR(4 downto 0);
signal next_instruction_address_IF3540 : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address_IF5239 : STD_LOGIC_VECTOR(4 downto 0);
signal next_instruction_address_IF5243 : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address_IF5247 : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address_IF5255 : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address_IF5259 : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address_IF5263 : STD_LOGIC_VECTOR(5 downto 0);
signal next_instruction_address_IF5267 : STD_LOGIC_VECTOR(1 downto 0);
signal next_instruction_address_IF5717 : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address_IF5721 : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address_IF5800 : STD_LOGIC_VECTOR(1 downto 0);
signal next_instruction_address_IF6149 : STD_LOGIC_VECTOR(4 downto 0);
signal next_instruction_address_IF6588 : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address_IF6592 : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address_IF6691 : STD_LOGIC_VECTOR(4 downto 0);
signal next_instruction_address_IF6738 : STD_LOGIC_VECTOR(31 downto 0);

begin

----  Component instantiations  ----

execution_01 : execution
  port map(
       EX_CONTROL => next_instruction_address_IF3293,
       EX_MEM_CONTROL => next_instruction_address_IF5263,
       EX_WB_CONTROL => next_instruction_address_IF5267,
       EX_branch_address => next_instruction_address_IF5255,
       EX_jump_address => next_instruction_address_IF5259,
       EX_rs => next_instruction_address_IF5243,
       MEM_CONTROL => next_instruction_address_IF3234,
       ULA_RES => next_instruction_address_IF5247,
       WB_CONTROL => next_instruction_address_IF3223,
       Zero => NET5251,
       clk => NET138,
       jump_address => next_instruction_address_IF3540,
       next_instruction_address_ID => next_instruction_address_IF3297,
       rd_address => next_instruction_address_IF3355,
       reset => NET410,
       rs => next_instruction_address_IF3389,
       rt => next_instruction_address_IF3517,
       rt_address => next_instruction_address_IF3340,
       shamt => next_instruction_address_IF3532,
       signal_extended => next_instruction_address_IF3363,
       val => next_instruction_address_IF5239
  );

instruction_decode_01 : instruction_decode
  port map(
       Clk => NET138,
       EX_CONTROL => next_instruction_address_IF3293,
       Instruction => next_instruction_address_IF6588,
       MEM_CONTROL => next_instruction_address_IF3234,
       RegWrite => NET6046,
       Reset => NET410,
       WB_CONTROL => next_instruction_address_IF3223,
       jump_address => next_instruction_address_IF3540,
       next_instruction_address => next_instruction_address_IF6592,
       next_instruction_address_ID => next_instruction_address_IF3297,
       rd_address => next_instruction_address_IF3355,
       rs => next_instruction_address_IF3389,
       rt => next_instruction_address_IF3517,
       rt_address => next_instruction_address_IF3340,
       shamt => next_instruction_address_IF3532,
       signal_extended => next_instruction_address_IF3363,
       write_data => next_instruction_address_IF2335,
       write_register => next_instruction_address_IF6149
  );

instruction_fetch_01 : instruction_fetch
  port map(
       Clk => NET138,
       Instruction => next_instruction_address_IF6588,
       PCSrc => NET6613,
       Reset => NET410,
       branch_instruction_address => next_instruction_address_IF6738,
       next_instruction_address => next_instruction_address_IF6592
  );

memory_access_01 : memory_access
  port map(
       EX_MEM_CONTROL => next_instruction_address_IF5263,
       EX_WB_CONTROL => next_instruction_address_IF5267,
       EX_branch_address => next_instruction_address_IF5255,
       EX_jump_address => next_instruction_address_IF5259,
       EX_rs => next_instruction_address_IF5243,
       M_DATA => next_instruction_address_IF5721,
       M_ULA_RES => next_instruction_address_IF5717,
       M_WB_CONTROL => next_instruction_address_IF5800,
       PCSrc => NET6613,
       ULA_RES => next_instruction_address_IF5247,
       Zero => NET5251,
       branch_instruction_address => next_instruction_address_IF6738,
       clk => NET138,
       reset => reset,
       val => next_instruction_address_IF5239,
       write_register => next_instruction_address_IF6691
  );

write_back_01 : write_back
  port map(
       M_DATA => next_instruction_address_IF5721,
       M_ULA_RES => next_instruction_address_IF5717,
       M_WB_CONTROL => next_instruction_address_IF5800,
       M_write_register => next_instruction_address_IF6149,
       RegWrite => NET6046,
       WB_DATA => next_instruction_address_IF2335,
       clk => NET138,
       reset => reset,
       write_register => next_instruction_address_IF6691
  );


---- Terminal assignment ----

    -- Inputs terminals
	NET138 <= Clk;
	NET410 <= Reset;


end mips;
