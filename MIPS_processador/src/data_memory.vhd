library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
entity data_memory is
	 port(
		 reset : in STD_LOGIC;
		 EX_rs : in STD_LOGIC_VECTOR(31 downto 0);
		 ULA_RES : in STD_LOGIC_VECTOR(31 downto 0);
		 EX_MEM_CONTROL_1 : in STD_LOGIC_VECTOR(5 downto 0);
		 DATA_BUS : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end data_memory;


architecture data_memory of data_memory is
type MEM_T is array (1023 downto 0) of STD_LOGIC_VECTOR (31 downto 0);
signal MEM : MEM_T;
begin

	MEM_PROC:
		process(reset,EX_MEM_CONTROL_1(3),EX_MEM_CONTROL_1(2),EX_rs,MEM,ULA_RES)
		begin	
			if (reset = '1') then -- Reset Asincrónico
				for i in 0 to 1023 loop
					MEM(i) <= (others => '1');
				end loop;
			elsif EX_MEM_CONTROL_1(3)='1' then --Write
				MEM(to_integer(unsigned( ULA_RES(9 downto 0) ))) <= EX_rs;
			elsif EX_MEM_CONTROL_1(2)='1' then	 --Read
			    	DATA_BUS <= MEM(to_integer(unsigned( ULA_RES(9 downto 0) )));
			end if;
		end process MEM_PROC;

end data_memory;	 

