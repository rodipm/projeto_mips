library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity IC_CONTROL is
	 port(
		 address : in STD_LOGIC_VECTOR(31 downto 0);
		 ic_pronto : in STD_LOGIC;
		 ic_enable : out STD_LOGIC;
		 ic_stall  : out STD_LOGIC
	     );
end IC_CONTROL;

architecture IC_CONTROL_ARCH of IC_CONTROL is
begin
	process(address, ic_pronto)		
	begin
		if address'event then
			ic_enable <= '1';
			ic_stall <= '1';
		end if;
		
		if rising_edge(ic_pronto) then
			ic_enable <= '0';
			ic_stall <= '0';
		end if;
	end process;
end IC_CONTROL_ARCH;
