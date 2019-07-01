library IEEE;
use IEEE.std_logic_1164.all;

entity MEM_WB_REG is
	 port(
		 val : in STD_LOGIC_VECTOR(4 downto 0);
		 ULA_RES : in STD_LOGIC_VECTOR(31 downto 0);
		 DATA : in STD_LOGIC_VECTOR(31 downto 0);
		 reset : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 
		 write_register : out STD_LOGIC_VECTOR(4 downto 0);
		 M_ULA_RES : out STD_LOGIC_VECTOR(31 downto 0);
		 M_DATA : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end MEM_WB_REG;

architecture MEM_WB_REG of MEM_WB_REG is
begin
	process(clk, reset)
	begin
		if reset = '1' then
			M_DATA <= "00000000000000000000000000000000";
			M_ULA_RES <= "00000000000000000000000000000000";
			write_register <= "00000";
			
		elsif rising_edge(clk) then
			M_DATA <= DATA;
			M_ULA_RES <= ULA_RES;
			write_register <= val;
		end if;
	end process;
end MEM_WB_REG;
