-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : MIPS_processador
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : E:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\MIPS_processador\compile\multiplexador.vhd
-- Generated   : Mon Jul  1 14:32:12 2019
-- From        : E:\rpm-dev\Poli\OrgArq\Projetos\projeto_mips\MIPS_processador\src\Componentes\multiplexador.bde
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

entity multiplexador is
  generic(
       NumeroBits : integer := 32
  );
  port(
       selection : in STD_LOGIC;
       input0 : in STD_LOGIC_VECTOR(NumeroBits - 1 downto 0);
       input1 : in STD_LOGIC_VECTOR(NumeroBits - 1 downto 0);
       output : out STD_LOGIC_VECTOR(NumeroBits - 1 downto 0)
  );
end multiplexador;

architecture multiplexador of multiplexador is

begin

---- Processes ----

Process_1 :
process (selection, input0, input1)		
begin	
	case selection is
		when '0' 	=> output <= input0 		 after 0.5 ns;
		when '1' 	=> output <= input1 		 after 0.5 ns;
		when others => output <= (others => 'X') after 0.5 ns;
	end case;	 
end process;



end multiplexador;
