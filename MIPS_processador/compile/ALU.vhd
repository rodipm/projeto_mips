-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : MIPS_processador
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : D:\Code\OrgArq\projeto_mips\MIPS_processador\compile\ALU.vhd
-- Generated   : Mon Jul  1 23:44:15 2019
-- From        : D:\Code\OrgArq\projeto_mips\MIPS_processador\src\Componentes\ALU.bde
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
use IEEE.std_logic_signed.all;
use IEEE.numeric_std.all;

entity ALU is
  generic(
       NumeroBits : integer := 32
  );
  port(
       A : in STD_LOGIC_VECTOR(NumeroBits - 1 downto 0);
       B : in STD_LOGIC_VECTOR(NumeroBits - 1 downto 0);
       selection : in STD_LOGIC_VECTOR(2 downto 0);
       shamt : in STD_LOGIC_VECTOR(4 downto 0);
       Zero : out std_logic;
       output : out STD_LOGIC_VECTOR(NumeroBits - 1 downto 0)
  );
end ALU;

architecture ALU of ALU is

---- Architecture declarations -----
signal S_NB : std_logic_vector (NumeroBits downto 0);
signal sigZero : std_logic_vector (NumeroBits - 1 downto 0) := (others => '0');


begin

---- User Signal Assignments ----
With selection select
		S_NB <=	(('0' &  A) + B)			when "000",
								(('0' &  A) + B)			when "001",
								(('0' &  A) - B)			when "010",
								std_logic_vector(shift_left(unsigned('0'&A), to_integer(unsigned(shamt)))) when "011",
								('0' &  (A and B))	 when "100",
								('0' &  (A or B))			when "101",
								(('0' &  A) - B)		when "110",
								('0' & (not A))				when "111",
								(others => '0')			when others;

-- Resultado da Operação
output <= S_NB(NumeroBits - 1 downto 0) after 1.00 ns when selection = "000" else
					 S_NB(NumeroBits - 1 downto 0) after 1.00 ns when selection = "001" else
					 S_NB(NumeroBits - 1 downto 0) after 1.25 ns when selection = "010" else
					 S_NB(NumeroBits - 1 downto 0) after 0.50 ns when selection = "011" else
					 S_NB(NumeroBits - 1 downto 0) after 0.25 ns when selection = "100"  else
					 S_NB(NumeroBits - 1 downto 0) after 0.25 ns when selection =  "101" else
					 "0000000000000000000000000000000" & S_NB(NumeroBits) after 1.25 ns when selection =  "110" else
					 S_NB(NumeroBits - 1 downto 0) after 0.25 ns when selection = "111";

-- Atualização de Zero
Zero <= '1' after 1.00 ns when S_NB(NumeroBits - 1 downto 0) = sigZero else
				  '0' after 1.00 ns;


end ALU;
