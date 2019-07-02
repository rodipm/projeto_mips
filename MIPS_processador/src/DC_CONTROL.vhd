library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity DC_CONTROL is
	 port(
		 ULA_RES : in STD_LOGIC_VECTOR(31 downto 0);
		 dc_pronto_out : in STD_LOGIC;
		 dc_enable : out STD_LOGIC;
		 dc_stall  : out STD_LOGIC
	     );
end DC_CONTROL;

architecture DC_CONTROL_ARCH of DC_CONTROL is
begin
	process(ULA_RES, dc_pronto_out)		
	begin
		if ULA_RES'event then
			dc_enable <= '1';
			dc_stall <= '1';
		end if;
		
		if rising_edge(dc_pronto_out) then
			dc_enable <= '0';
			dc_stall <= '0';
		end if;
	end process;
end DC_CONTROL_ARCH;
