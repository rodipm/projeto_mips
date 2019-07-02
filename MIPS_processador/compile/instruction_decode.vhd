-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : MIPS_processador
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : E:\rpm-dev\tmp_orgArq\projeto_mips\MIPS_processador\compile\instruction_decode.vhd
-- Generated   : Tue Jul  2 10:42:03 2019
-- From        : E:\rpm-dev\tmp_orgArq\projeto_mips\MIPS_processador\src\instruction_decode.bde
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

entity instruction_decode is
  port(
       Clk : in STD_LOGIC;
       RegWrite : in STD_LOGIC;
       Reset : in STD_LOGIC;
       stall : in STD_LOGIC;
       Instruction : in STD_LOGIC_VECTOR(31 downto 0);
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
       rs_address : out STD_LOGIC_VECTOR(4 downto 0);
       rt : out STD_LOGIC_VECTOR(31 downto 0);
       rt_address : out STD_LOGIC_VECTOR(4 downto 0);
       shamt : out STD_LOGIC_VECTOR(4 downto 0);
       signal_extended : out STD_LOGIC_VECTOR(31 downto 0)
  );
end instruction_decode;

architecture instruction_decode of instruction_decode is

---- Component declarations -----

component control_unit
  port (
       Instruction : in STD_LOGIC_VECTOR(31 downto 0);
       EX_CONTROL_BUS : out STD_LOGIC_VECTOR(3 downto 0);
       MEM_CONTROL_BUS : out STD_LOGIC_VECTOR(5 downto 0);
       WB_CONTROL_BUS : out STD_LOGIC_VECTOR(1 downto 0)
  );
end component;
component ID_EX_REG
  port (
       Clk : in STD_LOGIC;
       EX_CONTROL_BUS : in STD_LOGIC_VECTOR(3 downto 0);
       Instruction : in STD_LOGIC_VECTOR(20 downto 16);
       Instruction_1 : in STD_LOGIC_VECTOR(25 downto 21);
       Instruction_2 : in STD_LOGIC_VECTOR(25 downto 0);
       Instruction_3 : in STD_LOGIC_VECTOR(15 downto 11);
       Instruction_4 : in STD_LOGIC_VECTOR(10 downto 06);
       MEM_CONTROL_BUS : in STD_LOGIC_VECTOR(5 downto 0);
       Reset : in STD_LOGIC;
       WB_CONTROL_BUS : in STD_LOGIC_VECTOR(1 downto 0);
       next_instruction_address_bus : in STD_LOGIC_VECTOR(31 downto 0);
       rs_bus : in STD_LOGIC_VECTOR(31 downto 0);
       rt_bus : in STD_LOGIC_VECTOR(31 downto 0);
       signal_extended_bus : in STD_LOGIC_VECTOR(31 downto 0);
       stall : in STD_LOGIC;
       EX_CONTROL : out STD_LOGIC_VECTOR(3 downto 0);
       MEM_CONTROL : out STD_LOGIC_VECTOR(5 downto 0);
       WB_CONTROL : out STD_LOGIC_VECTOR(1 downto 0);
       jump_address : out STD_LOGIC_VECTOR(31 downto 0);
       next_instruction_address_ID : out STD_LOGIC_VECTOR(31 downto 0);
       rd_address : out STD_LOGIC_VECTOR(4 downto 0);
       rs : out STD_LOGIC_VECTOR(31 downto 0);
       rs_address : out STD_LOGIC_VECTOR(4 downto 0);
       rt : out STD_LOGIC_VECTOR(31 downto 0);
       rt_address : out STD_LOGIC_VECTOR(4 downto 0);
       shamt : out STD_LOGIC_VECTOR(4 downto 0);
       signal_extended : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component register_file
  port (
       Clk : in STD_LOGIC;
       Instruction : in STD_LOGIC_VECTOR(25 downto 21);
       Instruction_2 : in STD_LOGIC_VECTOR(20 downto 16);
       RegWrite : in STD_LOGIC;
       Reset : in STD_LOGIC;
       write_data : in STD_LOGIC_VECTOR(31 downto 0);
       write_register : in STD_LOGIC_VECTOR(4 downto 0);
       rs_bus : out STD_LOGIC_VECTOR(31 downto 0);
       rt_bus : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component signal_extend
  port (
       Instruction : in STD_LOGIC_VECTOR(15 downto 0);
       signal_extended_bus : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal EX_CONTROL_BUS : STD_LOGIC_VECTOR(3 downto 0);
signal MEM_CONTROL_BUS : STD_LOGIC_VECTOR(5 downto 0);
signal next_instruction_address_bus : STD_LOGIC_VECTOR(31 downto 0);
signal rs_bus : STD_LOGIC_VECTOR(31 downto 0);
signal rt_bus : STD_LOGIC_VECTOR(31 downto 0);
signal signal_extended_bus : STD_LOGIC_VECTOR(31 downto 0);
signal WB_CONTROL_BUS : STD_LOGIC_VECTOR(1 downto 0);

begin

----  Component instantiations  ----

U4 : ID_EX_REG
  port map(
       Clk => Clk,
       EX_CONTROL => EX_CONTROL,
       EX_CONTROL_BUS => EX_CONTROL_BUS,
       Instruction(16) => Instruction(16),
       Instruction(17) => Instruction(17),
       Instruction(18) => Instruction(18),
       Instruction(19) => Instruction(19),
       Instruction(20) => Instruction(20),
       Instruction_1(21) => Instruction(21),
       Instruction_1(22) => Instruction(22),
       Instruction_1(23) => Instruction(23),
       Instruction_1(24) => Instruction(24),
       Instruction_1(25) => Instruction(25),
       Instruction_2(0) => Instruction(0),
       Instruction_2(1) => Instruction(1),
       Instruction_2(2) => Instruction(2),
       Instruction_2(3) => Instruction(3),
       Instruction_2(4) => Instruction(4),
       Instruction_2(5) => Instruction(5),
       Instruction_2(6) => Instruction(6),
       Instruction_2(7) => Instruction(7),
       Instruction_2(8) => Instruction(8),
       Instruction_2(9) => Instruction(9),
       Instruction_2(10) => Instruction(10),
       Instruction_2(11) => Instruction(11),
       Instruction_2(12) => Instruction(12),
       Instruction_2(13) => Instruction(13),
       Instruction_2(14) => Instruction(14),
       Instruction_2(15) => Instruction(15),
       Instruction_2(16) => Instruction(16),
       Instruction_2(17) => Instruction(17),
       Instruction_2(18) => Instruction(18),
       Instruction_2(19) => Instruction(19),
       Instruction_2(20) => Instruction(20),
       Instruction_2(21) => Instruction(21),
       Instruction_2(22) => Instruction(22),
       Instruction_2(23) => Instruction(23),
       Instruction_2(24) => Instruction(24),
       Instruction_2(25) => Instruction(25),
       Instruction_3(11) => Instruction(11),
       Instruction_3(12) => Instruction(12),
       Instruction_3(13) => Instruction(13),
       Instruction_3(14) => Instruction(14),
       Instruction_3(15) => Instruction(15),
       Instruction_4(6) => Instruction(6),
       Instruction_4(7) => Instruction(7),
       Instruction_4(8) => Instruction(8),
       Instruction_4(9) => Instruction(9),
       Instruction_4(10) => Instruction(10),
       MEM_CONTROL => MEM_CONTROL,
       MEM_CONTROL_BUS => MEM_CONTROL_BUS,
       Reset => Reset,
       WB_CONTROL => WB_CONTROL,
       WB_CONTROL_BUS => WB_CONTROL_BUS,
       jump_address => jump_address,
       next_instruction_address_ID => next_instruction_address_ID,
       next_instruction_address_bus => next_instruction_address_bus,
       rd_address => rd_address,
       rs => rs,
       rs_address => rs_address,
       rs_bus => rs_bus,
       rt => rt,
       rt_address => rt_address,
       rt_bus => rt_bus,
       shamt => shamt,
       signal_extended => signal_extended,
       signal_extended_bus => signal_extended_bus,
       stall => stall
  );

control_unit_01 : control_unit
  port map(
       EX_CONTROL_BUS => EX_CONTROL_BUS,
       Instruction => Instruction,
       MEM_CONTROL_BUS => MEM_CONTROL_BUS,
       WB_CONTROL_BUS => WB_CONTROL_BUS
  );

register_file_01 : register_file
  port map(
       Clk => Clk,
       Instruction(21) => Instruction(21),
       Instruction(22) => Instruction(22),
       Instruction(23) => Instruction(23),
       Instruction(24) => Instruction(24),
       Instruction(25) => Instruction(25),
       Instruction_2(16) => Instruction(16),
       Instruction_2(17) => Instruction(17),
       Instruction_2(18) => Instruction(18),
       Instruction_2(19) => Instruction(19),
       Instruction_2(20) => Instruction(20),
       RegWrite => RegWrite,
       Reset => Reset,
       rs_bus => rs_bus,
       rt_bus => rt_bus,
       write_data => write_data,
       write_register => write_register
  );

signal_extend_01 : signal_extend
  port map(
       Instruction(0) => Instruction(0),
       Instruction(1) => Instruction(1),
       Instruction(2) => Instruction(2),
       Instruction(3) => Instruction(3),
       Instruction(4) => Instruction(4),
       Instruction(5) => Instruction(5),
       Instruction(6) => Instruction(6),
       Instruction(7) => Instruction(7),
       Instruction(8) => Instruction(8),
       Instruction(9) => Instruction(9),
       Instruction(10) => Instruction(10),
       Instruction(11) => Instruction(11),
       Instruction(12) => Instruction(12),
       Instruction(13) => Instruction(13),
       Instruction(14) => Instruction(14),
       Instruction(15) => Instruction(15),
       signal_extended_bus => signal_extended_bus
  );


---- Terminal assignment ----

    -- Inputs terminals
	next_instruction_address_bus <= next_instruction_address;


end instruction_decode;
