-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : MIPS_processador
-- Author      : bruno.inacio@usp.br
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : E:\rpm-dev\tmp_orgArq\projeto_mips\MIPS_processador\compile\adder.vhd
-- Generated   : Tue Jul  2 09:32:44 2019
-- From        : E:\rpm-dev\tmp_orgArq\projeto_mips\MIPS_processador\src\Componentes\adder.bde
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

entity adder is
  port(
       A : in std_logic_vector(31 downto 0);
       B : in std_logic_vector(31 downto 0);
       resultado : out std_logic_vector(31 downto 0)
  );
end adder;

architecture adder of adder is

begin

---- User Signal Assignments ----
resultado <= (A + B) after 1.0 ns;

end adder;