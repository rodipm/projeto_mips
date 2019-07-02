-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : MIPS_processador
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : D:\Code\OrgArq\MIPS - Copia (2) - Copia\MIPS_processador\compile\shiftLeft2.vhd
-- Generated   : Mon Jul  1 22:28:22 2019
-- From        : D:\Code\OrgArq\MIPS - Copia (2) - Copia\MIPS_processador\src\Componentes\shiftLeft2.bde
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

entity shiftLeft2 is
  port(
       In1 : in STD_LOGIC_VECTOR(31 downto 0);
       Out1 : out STD_LOGIC_VECTOR(31 downto 0)
  );
end shiftLeft2;

architecture shiftLeft2 of shiftLeft2 is

begin

---- User Signal Assignments ----
Out1  <= In1(29 downto 0) & "00";

end shiftLeft2;
