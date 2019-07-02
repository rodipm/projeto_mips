library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
entity data_memory is
	 port(
		 reset : in STD_LOGIC;
		 EX_rt : in STD_LOGIC_VECTOR(31 downto 0);	
		 dc_enable : in STD_LOGIC;
		 ULA_RES : in STD_LOGIC_VECTOR(31 downto 0);
		 EX_MEM_CONTROL_1 : in STD_LOGIC_VECTOR(5 downto 0);
		 DATA_BUS : out STD_LOGIC_VECTOR(31 downto 0);
		 clk : in STD_LOGIC;
		 dc_pronto_out : out STD_LOGIC
	     );
end data_memory;


architecture data_memory of data_memory is
type MEM_T is array (1023 downto 0) of STD_LOGIC_VECTOR (31 downto 0);
signal MEM : MEM_T;
signal MemRead : STD_LOGIC; 
signal MemWrite : STD_LOGIC;
signal DEBUG : STD_LOGIC_VECTOR (9 downto 0);
begin

	MEM_PROC:
	process(clk, reset,EX_MEM_CONTROL_1(3),EX_MEM_CONTROL_1(2),EX_rt,MEM,ULA_RES)
	begin		
		DEBUG <= ULA_RES(9 downto 0) after 0.5 ns;
		MemRead <= 	EX_MEM_CONTROL_1(2);
		 MemWrite <= 	EX_MEM_CONTROL_1(3);
		if (reset = '1') then -- Reset Asincrónico
			MEM(0) <= x"DEADBEEF";
			MEM(1) <= x"BABEF00D";
			MEM(2) <= x"F00DF00D";
			for i in 3 to 1023 loop
				MEM(i) <= (others => '1');
			end loop;
			DATA_BUS <= MEM(0);
		elsif EX_MEM_CONTROL_1(3)='1' and dc_enable='1' then --Write
			MEM(to_integer(unsigned( ULA_RES(9 downto 0) ))) <= EX_rt;
		elsif MemRead='1' and dc_enable='1' then	 --Read
		    	DATA_BUS <= MEM(to_integer(unsigned( ULA_RES(9 downto 0) )));
		end if;
	end process MEM_PROC;
		
	process 
	begin  
		wait for 30 ns;	
		
		dc_pronto_out <= '0';
		wait for 2 ns;
		dc_pronto_out <= '1';
		wait for 8 ns; 
		
		dc_pronto_out <= '0';
		wait for 2 ns;
		dc_pronto_out <= '1';
		wait for 8 ns; 
		
		dc_pronto_out <= '0';
		wait for 2 ns;
		dc_pronto_out <= '1';
		wait for 8 ns; 
		
		dc_pronto_out <= '0';
		wait for 15 ns;
		dc_pronto_out <= '1'; 
		wait for 5 ns;
	end process;
end data_memory;	 

