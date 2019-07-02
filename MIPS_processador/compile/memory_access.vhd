-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : MIPS_processador
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : E:\rpm-dev\tmp_orgArq\projeto_mips\MIPS_processador\compile\memory_access.vhd
-- Generated   : Tue Jul  2 08:53:34 2019
-- From        : E:\rpm-dev\tmp_orgArq\projeto_mips\MIPS_processador\src\memory_access.bde
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
       stall : in STD_LOGIC;
       EX_MEM_CONTROL : in STD_LOGIC_VECTOR(5 downto 0);
       EX_WB_CONTROL : in STD_LOGIC_VECTOR(1 downto 0);
       EX_branch_address : in STD_LOGIC_VECTOR(31 downto 0);
       EX_jump_address : in STD_LOGIC_VECTOR(31 downto 0);
       EX_rs : in STD_LOGIC_VECTOR(31 downto 0);
       EX_rt : in STD_LOGIC_VECTOR(31 downto 0);
       ULA_RES : in STD_LOGIC_VECTOR(31 downto 0);
       val : in STD_LOGIC_VECTOR(4 downto 0);
       PCSrc : out STD_LOGIC;
       dc_stall : out STD_LOGIC;
       M_DATA : out STD_LOGIC_VECTOR(31 downto 0);
       M_ULA_RES : out STD_LOGIC_VECTOR(31 downto 0);
       M_WB_CONTROL : out STD_LOGIC_VECTOR(1 downto 0);
       branch_instruction_address : out STD_LOGIC_VECTOR(31 downto 0);
       write_register : out STD_LOGIC_VECTOR(4 downto 0)
  );
end memory_access;

architecture memory_access of memory_access is

---- Component declarations -----

component data_memory
  port (
       EX_MEM_CONTROL_1 : in STD_LOGIC_VECTOR(5 downto 0);
       EX_rt : in STD_LOGIC_VECTOR(31 downto 0);
       ULA_RES : in STD_LOGIC_VECTOR(31 downto 0);
       clk : in STD_LOGIC;
       dc_enable : in STD_LOGIC;
       reset : in STD_LOGIC;
       DATA_BUS : out STD_LOGIC_VECTOR(31 downto 0);
       dc_pronto_out : out STD_LOGIC
  );
end component;
component DC_CONTROL
  port (
       ULA_RES : in STD_LOGIC_VECTOR(31 downto 0);
       dc_pronto_out : in STD_LOGIC;
       dc_enable : out STD_LOGIC;
       dc_stall : out STD_LOGIC
  );
end component;
component MEM_WB_REG
  port (
       DATA_BUS : in STD_LOGIC_VECTOR(31 downto 0);
       EX_WB_CONTROL : in STD_LOGIC_VECTOR(1 downto 0);
       ULA_RES : in STD_LOGIC_VECTOR(31 downto 0);
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       stall : in STD_LOGIC;
       val : in STD_LOGIC_VECTOR(4 downto 0);
       M_DATA : out STD_LOGIC_VECTOR(31 downto 0);
       M_ULA_RES : out STD_LOGIC_VECTOR(31 downto 0);
       M_WB_CONTROL : out STD_LOGIC_VECTOR(1 downto 0);
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

---- Signal declarations used on the diagram ----

signal dc_enable : STD_LOGIC;
signal dc_pronto_out : STD_LOGIC;
signal NET356 : STD_LOGIC;
signal NET405 : STD_LOGIC;
signal NET536 : STD_LOGIC;
signal NET600 : STD_LOGIC;
signal NET911 : STD_LOGIC;
signal BUS1180 : STD_LOGIC_VECTOR(31 downto 0);
signal DATA_BUS : STD_LOGIC_VECTOR(31 downto 0);

begin

----  Component instantiations  ----

DC_CONTROL_01 : DC_CONTROL
  port map(
       ULA_RES => ULA_RES,
       dc_enable => dc_enable,
       dc_pronto_out => dc_pronto_out,
       dc_stall => dc_stall
  );

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
       DATA_BUS => DATA_BUS,
       EX_WB_CONTROL => EX_WB_CONTROL,
       M_DATA => M_DATA,
       M_ULA_RES => M_ULA_RES,
       M_WB_CONTROL => M_WB_CONTROL,
       ULA_RES => ULA_RES,
       clk => clk,
       reset => reset,
       stall => stall,
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

data_memory_01 : data_memory
  port map(
       DATA_BUS => DATA_BUS,
       EX_MEM_CONTROL_1 => EX_MEM_CONTROL,
       EX_rt => EX_rt,
       ULA_RES => ULA_RES,
       clk => clk,
       dc_enable => dc_enable,
       dc_pronto_out => dc_pronto_out,
       reset => reset
  );


end memory_access;
