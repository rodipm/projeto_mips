-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : MIPS_processador
-- Author      : ALDEC
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : d:\Code\OrgArq\github_mips\projeto_mips\MIPS_processador\compile\execution.vhd
-- Generated   : Mon Jul  1 00:51:33 2019
-- From        : d:\Code\OrgArq\github_mips\projeto_mips\MIPS_processador\src\execution.bde
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

entity execution is
  port(
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       EX_CONTROL : in STD_LOGIC_VECTOR(3 downto 0);
       MEM_CONTROL : in STD_LOGIC_VECTOR(5 downto 0);
       WB_CONTROL : in STD_LOGIC_VECTOR(1 downto 0);
       jump_address : in STD_LOGIC_VECTOR(31 downto 0);
       next_instruction_address_ID : in std_logic_vector(31 downto 0);
       rd_address : in STD_LOGIC_VECTOR(4 downto 0);
       rs : in STD_LOGIC_VECTOR(31 downto 0);
       rt : in STD_LOGIC_VECTOR(31 downto 0);
       rt_address : in STD_LOGIC_VECTOR(4 downto 0);
       shamt : in STD_LOGIC_VECTOR(4 downto 0);
       signal_extended : in STD_LOGIC_VECTOR(31 downto 0);
       Zero : out STD_LOGIC;
       EX_MEM_CONTROL : out STD_LOGIC_VECTOR(1 downto 0);
       EX_WB_CONTROL : out STD_LOGIC_VECTOR(1 downto 0);
       EX_branch_address : out STD_LOGIC_VECTOR(31 downto 0);
       EX_jump_address : out STD_LOGIC_VECTOR(31 downto 0);
       EX_rs : out STD_LOGIC_VECTOR(31 downto 0);
       ULA_RES : out STD_LOGIC_VECTOR(31 downto 0);
       val : out STD_LOGIC_VECTOR(4 downto 0)
  );
end execution;

architecture execution of execution is

---- Component declarations -----

component adder
  port (
       A : in std_logic_vector(31 downto 0);
       B : in std_logic_vector(31 downto 0);
       resultado : out std_logic_vector(31 downto 0)
  );
end component;
component ALU
  generic(
       NumeroBits : integer := 32
  );
  port (
       A : in STD_LOGIC_VECTOR(NumeroBits - 1 downto 0);
       B : in STD_LOGIC_VECTOR(NumeroBits - 1 downto 0);
       selection : in STD_LOGIC_VECTOR(2 downto 0);
       Zero : out std_logic;
       output : out STD_LOGIC_VECTOR(NumeroBits - 1 downto 0)
  );
end component;
component ALU_Control
  port (
       ULAop1 : in STD_LOGIC;
       ULAop2 : in STD_LOGIC;
       instruction : in STD_LOGIC_VECTOR(5 downto 0);
       ulaSelection : out STD_LOGIC_VECTOR(2 downto 0)
  );
end component;
component EX_MEM_REG
  port (
       MEM_CONTROL : in STD_LOGIC_VECTOR(5 downto 0);
       RS_in : in STD_LOGIC_VECTOR(31 downto 0);
       ULA_in : in STD_LOGIC_VECTOR(31 downto 0);
       WB_CONTROL : in STD_LOGIC_VECTOR(1 downto 0);
       branch_address_in : in STD_LOGIC_VECTOR(31 downto 0);
       clk : in STD_LOGIC;
       jump_address_in : in STD_LOGIC_VECTOR(31 downto 0);
       reset : in STD_LOGIC;
       val_res : in STD_LOGIC_VECTOR(4 downto 0);
       zero_in : in STD_LOGIC;
       EX_MEM_CONTROL : out STD_LOGIC_VECTOR(5 downto 0);
       EX_WB_CONTROL : out STD_LOGIC_VECTOR(1 downto 0);
       EX_branch_address : out STD_LOGIC_VECTOR(31 downto 0);
       EX_jump_address : out STD_LOGIC_VECTOR(31 downto 0);
       EX_rs : out STD_LOGIC_VECTOR(31 downto 0);
       ULA_RES : out STD_LOGIC_VECTOR(31 downto 0);
       val : out STD_LOGIC_VECTOR(4 downto 0);
       zero : out STD_LOGIC
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
component shiftLeft2
  port (
       In1 : in STD_LOGIC_VECTOR(31 downto 0);
       Out1 : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal NET1834 : std_logic;
signal BUS1767 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS2593 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS3590 : std_logic_vector(31 downto 0);
signal BUS3665 : STD_LOGIC_VECTOR(2 downto 0);
signal BUS4096 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS544 : std_logic_vector(31 downto 0);

---- Declarations for Dangling outputs ----
signal DANGLING_U1_EX_MEM_CONTROL_3 : STD_LOGIC;
signal DANGLING_U1_EX_MEM_CONTROL_2 : STD_LOGIC;
signal DANGLING_U1_EX_MEM_CONTROL_1 : STD_LOGIC;
signal DANGLING_U1_EX_MEM_CONTROL_0 : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : EX_MEM_REG
  port map(
       EX_MEM_CONTROL(0) => DANGLING_U1_EX_MEM_CONTROL_0,
       EX_MEM_CONTROL(1) => DANGLING_U1_EX_MEM_CONTROL_1,
       EX_MEM_CONTROL(2) => DANGLING_U1_EX_MEM_CONTROL_2,
       EX_MEM_CONTROL(3) => DANGLING_U1_EX_MEM_CONTROL_3,
       EX_MEM_CONTROL(4) => EX_MEM_CONTROL(0),
       EX_MEM_CONTROL(5) => EX_MEM_CONTROL(1),
       EX_WB_CONTROL => EX_WB_CONTROL,
       EX_branch_address => EX_branch_address,
       EX_jump_address => EX_jump_address,
       EX_rs => EX_rs,
       MEM_CONTROL => MEM_CONTROL,
       RS_in => rs,
       ULA_RES => ULA_RES,
       ULA_in => BUS2593,
       WB_CONTROL => WB_CONTROL,
       branch_address_in => BUS3590,
       clk => clk,
       jump_address_in => jump_address,
       reset => reset,
       val => val,
       val_res => BUS1767,
       zero => Zero,
       zero_in => NET1834
  );

U2 : ALU_Control
  port map(
       instruction(0) => signal_extended(26),
       instruction(1) => signal_extended(27),
       instruction(2) => signal_extended(28),
       instruction(3) => signal_extended(29),
       instruction(4) => signal_extended(30),
       instruction(5) => signal_extended(31),
       ULAop1 => EX_CONTROL(1),
       ULAop2 => EX_CONTROL(2),
       ulaSelection => BUS3665
  );

U4 : adder
  port map(
       A => next_instruction_address_ID,
       B => BUS544,
       resultado => BUS3590
  );

U5 : shiftLeft2
  port map(
       In1 => signal_extended,
       Out1 => BUS544
  );

U7 : multiplexador
  generic map(
       NumeroBits => 32
  )
  port map(
       input0 => rs(31 downto 0),
       input1 => signal_extended(31 downto 0),
       output => BUS4096(31 downto 0),
       selection => EX_CONTROL(3)
  );

U8 : multiplexador
  generic map(
       NumeroBits => 5
  )
  port map(
       input0 => rt_address(4 downto 0),
       input1 => rd_address(4 downto 0),
       output => BUS1767(4 downto 0),
       selection => EX_CONTROL(0)
  );

U9 : ALU
  port map(
       A => rt(31 downto 0),
       B => BUS4096(31 downto 0),
       Zero => NET1834,
       output => BUS2593(31 downto 0),
       selection => BUS3665
  );


end execution;
