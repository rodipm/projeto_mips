-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : MIPS_processador
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : D:\Code\OrgArq\MIPS - Copia (2) - Copia\MIPS_processador\compile\execution2.vhd
-- Generated   : Mon Jul  1 22:28:18 2019
-- From        : D:\Code\OrgArq\MIPS - Copia (2) - Copia\MIPS_processador\src\execution2.bde
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

-- other libraries declarations
library BIBLIOTECA_DE_COMPONENTES;

entity Fub1 is
  port(
       clk : in STD_LOGIC;
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
       Sinal : out STD_LOGIC;
       Zero : out STD_LOGIC;
       C : out STD_LOGIC_VECTOR(31 downto 0)
  );
end Fub1;

architecture execution of Fub1 is

---- Component declarations -----

component adder
  port (
       A : in std_logic_vector(31 downto 0);
       B : in std_logic_vector(31 downto 0);
       resultado : out std_logic_vector(31 downto 0)
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
component mux8x1
  generic(
       NB : integer := 8;
       Tsel : time := 3 ns;
       Tdata : time := 2 ns
  );
  port (
       I0 : in STD_LOGIC_VECTOR(NB - 1 downto 0);
       I1 : in STD_LOGIC_VECTOR(NB - 1 downto 0);
       I2 : in STD_LOGIC_VECTOR(NB - 1 downto 0);
       I3 : in STD_LOGIC_VECTOR(NB - 1 downto 0);
       I4 : in STD_LOGIC_VECTOR(NB - 1 downto 0);
       I5 : in STD_LOGIC_VECTOR(NB - 1 downto 0);
       I6 : in STD_LOGIC_VECTOR(NB - 1 downto 0);
       I7 : in STD_LOGIC_VECTOR(NB - 1 downto 0);
       Sel : in STD_LOGIC_VECTOR(2 downto 0);
       O : out STD_LOGIC_VECTOR(NB - 1 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal NET1231 : STD_LOGIC;
signal BUS292 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS813 : STD_LOGIC_VECTOR(7 downto 0);
signal WB_CONTRO : std_logic_vector(31 downto 0);

begin

----  Component instantiations  ----

U1 : adder
  port map(
       A => next_instruction_address_ID,
       B => next_instruction_address_ID,
       resultado => WB_CONTRO
  );

U2 : multiplexador
  port map(
       input0 => BUS292(7 downto 0),
       input1 => BUS292(7 downto 0),
       selection => NET1231
  );

U7 : mux8x1
  port map(
       I0 => MEM_CONTROL(5 downto 0),
       I1 => EX_CONTROL(3 downto 0),
       I2 => rt_address(4 downto 0),
       I3 => BUS813(7 downto 0),
       I4 => rd_address(4 downto 0),
       I5 => signal_extended(31 downto 0),
       I6 => rs(31 downto 0),
       I7 => shamt(4 downto 0),
       O => BUS813(7 downto 0),
       Sel(0) => jump_address(0),
       Sel(1) => jump_address(1),
       Sel(2) => jump_address(2)
  );


---- Terminal assignment ----

    -- Inputs terminals
	NET1231 <= clk;
	BUS292(0) <= rt(24);
	BUS292(1) <= rt(25);
	BUS292(2) <= rt(26);
	BUS292(3) <= rt(27);
	BUS292(4) <= rt(28);
	BUS292(5) <= rt(29);
	BUS292(6) <= rt(30);
	BUS292(7) <= rt(31);

    -- Output\buffer terminals
	C <= WB_CONTRO;
	Sinal <= NET1231;
	Zero <= NET1231;


end execution;
