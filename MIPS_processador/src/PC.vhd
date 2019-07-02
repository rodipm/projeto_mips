library IEEE;
use IEEE.std_logic_1164.all;

entity PC is
	 port(
	 	 mux_pc_bus : in STD_LOGIC_VECTOR(31 downto 0);
	 	 stall : in STD_LOGIC;
		 Clk : in STD_LOGIC;
		 Reset : in STD_LOGIC;
		 address_bus : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end PC;

architecture PC of PC is
begin

	process (Clk, Reset, mux_pc_bus)
	begin	  
		if Reset='1' then
			address_bus <= "00000000000000000000000000000000";
		elsif rising_edge(Clk) and stall='0' then
			address_bus <= mux_pc_bus;
		end if;
	end process;
end PC;
