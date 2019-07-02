-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : MIPS_processador
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : E:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\MIPS_processador\compile\write_back.vhd
-- Generated   : Tue Jul  2 00:15:47 2019
-- From        : E:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\MIPS_processador\src\write_back.bde
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

entity write_back is
  port(
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       M_DATA : in STD_LOGIC_VECTOR(31 downto 0);
       M_ULA_RES : in STD_LOGIC_VECTOR(31 downto 0);
       M_WB_CONTROL : in STD_LOGIC_VECTOR(1 downto 0);
       write_register : in STD_LOGIC_VECTOR(4 downto 0);
       RegWrite : out STD_LOGIC;
       M_write_register : out STD_LOGIC_VECTOR(4 downto 0);
       WB_DATA : out STD_LOGIC_VECTOR(31 downto 0)
  );
end write_back;

architecture write_back of write_back is

---- Component declarations -----

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

begin

----  Component instantiations  ----

U1 : multiplexador
  generic map(
       NumeroBits => 32
  )
  port map(
       input0 => M_ULA_RES(31 downto 0),
       input1 => M_DATA(31 downto 0),
       output => WB_DATA(31 downto 0),
       selection => M_WB_CONTROL(1)
  );


---- Terminal assignment ----

    -- Output\buffer terminals
	M_write_register <= write_register;
	RegWrite <= M_WB_CONTROL(0);


end write_back;
