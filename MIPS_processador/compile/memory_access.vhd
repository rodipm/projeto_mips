-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : MIPS_processador
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : D:\Code\OrgArq\github_mips\projeto_mips\MIPS_processador\compile\memory_access.vhd
-- Generated   : Mon Jul  1 04:57:27 2019
-- From        : D:\Code\OrgArq\github_mips\projeto_mips\MIPS_processador\src\memory_access.bde
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

entity memory_access is
  port(
       Zero : in STD_LOGIC;
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       EX_MEM_CONTROL : in STD_LOGIC_VECTOR(5 downto 0);
       EX_WB_CONTROL : in STD_LOGIC_VECTOR(1 downto 0);
       EX_branch_address : in STD_LOGIC_VECTOR(31 downto 0);
       EX_jump_address : in STD_LOGIC_VECTOR(31 downto 0);
       EX_rs : in STD_LOGIC_VECTOR(31 downto 0);
       ULA_RES : in STD_LOGIC_VECTOR(31 downto 0);
       val : in STD_LOGIC_VECTOR(4 downto 0);
       PCSrc : out STD_LOGIC;
       M_DATA : out STD_LOGIC_VECTOR(31 downto 0);
       M_ULA_RES : out STD_LOGIC_VECTOR(31 downto 0);
       M_WB_CONTROL : out STD_LOGIC_VECTOR(1 downto 0);
       branch_instruction_address : out STD_LOGIC_VECTOR(31 downto 0);
       write_register : out STD_LOGIC_VECTOR(4 downto 0)
  );
end memory_access;

architecture memory_access of memory_access is

---- Component declarations -----

component MEM_WB_REG
  port (
       DATA : in STD_LOGIC_VECTOR(31 downto 0);
       ULA_RES : in STD_LOGIC_VECTOR(31 downto 0);
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       val : in STD_LOGIC_VECTOR(4 downto 0);
       M_DATA : out STD_LOGIC_VECTOR(31 downto 0);
       M_ULA_RES : out STD_LOGIC_VECTOR(31 downto 0);
       write_register : out STD_LOGIC_VECTOR(4 downto 0)
  );
end component;
component multiplexador
  generic(
       NumeroBits : INTEGER := 32
  );
  port (
       input0 : in STD_LOGIC_VECTOR(NumeroBits - 1 downto 0);
       input1 : in STD_LOGIC_VECTOR(NumeroBits - 1 downto 0);
       selection : in STD_LOGIC;
       output : out STD_LOGIC_VECTOR(NumeroBits - 1 downto 0)
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Signal declarations used on the diagram ----

signal NET356 : STD_LOGIC;
signal NET405 : STD_LOGIC;
signal NET536 : STD_LOGIC;
signal NET600 : STD_LOGIC;
signal NET911 : STD_LOGIC;
signal BUS1180 : STD_LOGIC_VECTOR(31 downto 0);
signal BusOutput1 : STD_LOGIC_VECTOR(7 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

----  Component instantiations  ----

NET911 <= EX_MEM_CONTROL(1) or EX_MEM_CONTROL(0);

U11 : multiplexador
  generic map(
       NumeroBits => 32
  )
  port map(
       input0 => EX_rs(31 downto 0),
       input1 => EX_jump_address(31 downto 0),
       output => BUS1180(31 downto 0),
       selection => EX_MEM_CONTROL(4)
  );

U12 : MEM_WB_REG
  port map(
       DATA(0) => Dangling_Input_Signal,
       DATA(1) => Dangling_Input_Signal,
       DATA(2) => Dangling_Input_Signal,
       DATA(3) => Dangling_Input_Signal,
       DATA(4) => Dangling_Input_Signal,
       DATA(5) => Dangling_Input_Signal,
       DATA(6) => Dangling_Input_Signal,
       DATA(7) => Dangling_Input_Signal,
       DATA(8) => Dangling_Input_Signal,
       DATA(9) => Dangling_Input_Signal,
       DATA(10) => Dangling_Input_Signal,
       DATA(11) => Dangling_Input_Signal,
       DATA(12) => Dangling_Input_Signal,
       DATA(13) => Dangling_Input_Signal,
       DATA(14) => Dangling_Input_Signal,
       DATA(15) => Dangling_Input_Signal,
       DATA(16) => Dangling_Input_Signal,
       DATA(17) => Dangling_Input_Signal,
       DATA(18) => Dangling_Input_Signal,
       DATA(19) => Dangling_Input_Signal,
       DATA(20) => Dangling_Input_Signal,
       DATA(21) => Dangling_Input_Signal,
       DATA(22) => Dangling_Input_Signal,
       DATA(23) => Dangling_Input_Signal,
       DATA(24) => Dangling_Input_Signal,
       DATA(25) => Dangling_Input_Signal,
       DATA(26) => Dangling_Input_Signal,
       DATA(27) => Dangling_Input_Signal,
       DATA(28) => Dangling_Input_Signal,
       DATA(29) => Dangling_Input_Signal,
       DATA(30) => Dangling_Input_Signal,
       DATA(31) => Dangling_Input_Signal,
       M_DATA => M_DATA,
       M_ULA_RES => M_ULA_RES,
       ULA_RES => ULA_RES,
       clk => clk,
       reset => reset,
       val => val,
       write_register => write_register
  );

NET356 <= Zero and EX_MEM_CONTROL(0);

NET536 <= NET405 or NET356;

NET405 <= not(Zero) and EX_MEM_CONTROL(1);

PCSrc <= NET600 or NET536;

NET600 <= EX_MEM_CONTROL(5) or EX_MEM_CONTROL(4);

U9 : multiplexador
  port map(
       input0 => BUS1180(31 downto 0),
       input1 => EX_branch_address(31 downto 0),
       output => branch_instruction_address(31 downto 0),
       selection => NET911
  );


---- Terminal assignment ----

    -- Inputs terminals
	BusOutput1(6) <= EX_WB_CONTROL(0);
	BusOutput1(7) <= EX_WB_CONTROL(1);

    -- Output\buffer terminals
	M_WB_CONTROL(0) <= BusOutput1(6);
	M_WB_CONTROL(1) <= BusOutput1(7);


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end memory_access;
