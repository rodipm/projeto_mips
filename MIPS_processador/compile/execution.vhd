-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : MIPS_processador
-- Author      : ALDEC
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : E:\rpm-dev\tmp_orgArq\projeto_mips\MIPS_processador\compile\execution.vhd
-- Generated   : Tue Jul  2 10:44:43 2019
-- From        : E:\rpm-dev\tmp_orgArq\projeto_mips\MIPS_processador\src\execution.bde
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

-- Included from components --
use IEEE.std_logic_signed.all;
use IEEE.numeric_std.all;

entity execution is
  port(
       clk : in STD_LOGIC;
       next_instruction_address_IF5800 : in STD_LOGIC;
       reset : in STD_LOGIC;
       stall : in STD_LOGIC;
       EX_CONTROL : in STD_LOGIC_VECTOR(3 downto 0);
       MEM_CONTROL : in STD_LOGIC_VECTOR(5 downto 0);
       MEM_WB_RegisterRD : in STD_LOGIC_VECTOR(4 downto 0);
       WB_CONTROL : in STD_LOGIC_VECTOR(1 downto 0);
       jump_address : in STD_LOGIC_VECTOR(31 downto 0);
       next_instruction_address_ID : in std_logic_vector(31 downto 0);
       rd_address : in STD_LOGIC_VECTOR(4 downto 0);
       rs : in STD_LOGIC_VECTOR(31 downto 0);
       rs_address : in STD_LOGIC_VECTOR(4 downto 0);
       rt : in STD_LOGIC_VECTOR(31 downto 0);
       rt_address : in STD_LOGIC_VECTOR(4 downto 0);
       shamt : in STD_LOGIC_VECTOR(4 downto 0);
       signal_extended : in STD_LOGIC_VECTOR(31 downto 0);
       Zero : out STD_LOGIC;
       EX_MEM_CONTROL : out STD_LOGIC_VECTOR(5 downto 0);
       EX_WB_CONTROL : out STD_LOGIC_VECTOR(1 downto 0);
       EX_branch_address : out STD_LOGIC_VECTOR(31 downto 0);
       EX_jump_address : out STD_LOGIC_VECTOR(31 downto 0);
       EX_rs : out STD_LOGIC_VECTOR(31 downto 0);
       EX_rt : out STD_LOGIC_VECTOR(31 downto 0);
       ForwardA : out STD_LOGIC_VECTOR(1 downto 0);
       ForwardB : out STD_LOGIC_VECTOR(1 downto 0);
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
       shamt : in STD_LOGIC_VECTOR(4 downto 0);
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
       RT_in : in STD_LOGIC_VECTOR(31 downto 0);
       ULA_in : in STD_LOGIC_VECTOR(31 downto 0);
       WB_CONTROL : in STD_LOGIC_VECTOR(1 downto 0);
       branch_address_in : in STD_LOGIC_VECTOR(31 downto 0);
       clk : in STD_LOGIC;
       jump_address_in : in STD_LOGIC_VECTOR(31 downto 0);
       reset : in STD_LOGIC;
       stall : in STD_LOGIC;
       val_res : in STD_LOGIC_VECTOR(4 downto 0);
       zero_in : in STD_LOGIC;
       EX_MEM_CONTROL : out STD_LOGIC_VECTOR(5 downto 0);
       EX_MEM_REGISTER_RD : out STD_LOGIC_VECTOR(4 downto 0);
       EX_WB_CONTROL : out STD_LOGIC_VECTOR(1 downto 0);
       EX_branch_address : out STD_LOGIC_VECTOR(31 downto 0);
       EX_jump_address : out STD_LOGIC_VECTOR(31 downto 0);
       EX_rs : out STD_LOGIC_VECTOR(31 downto 0);
       EX_rt : out STD_LOGIC_VECTOR(31 downto 0);
       ULA_RES : out STD_LOGIC_VECTOR(31 downto 0);
       zero : out STD_LOGIC
  );
end component;
component forwarding_control
  port (
       EX_MEM_RegWrite : in STD_LOGIC;
       EX_MEM_RegisterRD : in STD_LOGIC;
       MEM_WB_RegWrite : in STD_LOGIC;
       MEM_WB_RegisterRD : in STD_LOGIC_VECTOR(4 downto 0);
       forwarding_rs_address : in STD_LOGIC_VECTOR(4 downto 0);
       forwarding_rt_address : in STD_LOGIC_VECTOR(4 downto 0);
       ForwardA : out STD_LOGIC_VECTOR(1 downto 0);
       ForwardB : out STD_LOGIC_VECTOR(1 downto 0)
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
signal BUS4096 : STD_LOGIC_VECTOR(31 downto 0);
signal EX_MEM_REGISTER_RD : STD_LOGIC_VECTOR(4 downto 0);
signal forwarding_rs_address : STD_LOGIC_VECTOR(4 downto 0);
signal forwarding_rt_address : STD_LOGIC_VECTOR(4 downto 0);
signal next_instruction_address_IF1767 : STD_LOGIC_VECTOR(4 downto 0);
signal next_instruction_address_IF2593 : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address_IF3590 : STD_LOGIC_VECTOR(31 downto 0);
signal next_instruction_address_IF3665 : STD_LOGIC_VECTOR(2 downto 0);
signal next_instruction_address_IF544 : STD_LOGIC_VECTOR(31 downto 0);

begin

----  Component instantiations  ----

U1 : EX_MEM_REG
  port map(
       EX_MEM_CONTROL => EX_MEM_CONTROL,
       EX_MEM_REGISTER_RD => EX_MEM_REGISTER_RD,
       EX_WB_CONTROL => EX_WB_CONTROL,
       EX_branch_address => EX_branch_address,
       EX_jump_address => EX_jump_address,
       EX_rs => EX_rs,
       EX_rt => EX_rt,
       MEM_CONTROL => MEM_CONTROL,
       RS_in => rs,
       RT_in => rt,
       ULA_RES => ULA_RES,
       ULA_in => next_instruction_address_IF2593,
       WB_CONTROL => WB_CONTROL,
       branch_address_in => next_instruction_address_IF3590,
       clk => clk,
       jump_address_in => jump_address,
       reset => reset,
       stall => stall,
       val_res => next_instruction_address_IF1767,
       zero => Zero,
       zero_in => NET1834
  );

U2 : ALU_Control
  port map(
       instruction(0) => signal_extended(0),
       instruction(1) => signal_extended(1),
       instruction(2) => signal_extended(2),
       instruction(3) => signal_extended(3),
       instruction(4) => signal_extended(4),
       instruction(5) => signal_extended(5),
       ULAop1 => EX_CONTROL(1),
       ULAop2 => EX_CONTROL(2),
       ulaSelection => next_instruction_address_IF3665
  );

U4 : adder
  port map(
       A => next_instruction_address_ID,
       B => next_instruction_address_IF544,
       resultado => next_instruction_address_IF3590
  );

U5 : shiftLeft2
  port map(
       In1 => signal_extended,
       Out1 => next_instruction_address_IF544
  );

U7 : multiplexador
  generic map(
       NumeroBits => 32
  )
  port map(
       input0 => rt(31 downto 0),
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
       output => next_instruction_address_IF1767(4 downto 0),
       selection => EX_CONTROL(0)
  );

U9 : ALU
  port map(
       A => rs(31 downto 0),
       B => BUS4096(31 downto 0),
       Zero => NET1834,
       output => next_instruction_address_IF2593(31 downto 0),
       selection => next_instruction_address_IF3665,
       shamt => shamt
  );

forwarding_control_01 : forwarding_control
  port map(
       EX_MEM_RegWrite => EX_WB_CONTROL(0),
       EX_MEM_RegisterRD => EX_MEM_REGISTER_RD(4),
       ForwardA => ForwardA,
       ForwardB => ForwardB,
       MEM_WB_RegWrite => next_instruction_address_IF5800,
       MEM_WB_RegisterRD => MEM_WB_RegisterRD,
       forwarding_rs_address => forwarding_rs_address,
       forwarding_rt_address => forwarding_rt_address
  );


---- Terminal assignment ----

    -- Inputs terminals
	forwarding_rs_address <= rs_address;

    -- Output\buffer terminals
	val <= EX_MEM_REGISTER_RD;


end execution;
