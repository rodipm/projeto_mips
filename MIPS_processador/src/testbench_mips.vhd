library IEEE;
use IEEE.std_logic_1164.all;

entity testbench_mips is
	 port(
		 Clk : out STD_LOGIC;
		 PCSrc : out STD_LOGIC;
		 branch_instruction_address : out STD_LOGIC_VECTOR(31 downto 0);
		 Reset : out STD_LOGIC;
		 RegWrite : out STD_LOGIC;
		 write_register : out STD_LOGIC_VECTOR(4 downto 0);
		 write_data : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end testbench_mips;

architecture testbench_mips of testbench_mips is
begin
	branch_instruction_address <= "00000000000000000000000000000000";	
	PCSrc <= '0'; 
	write_register <= "00011";
	write_data <= X"deadbeef";
	
	process
	begin 	 
			Reset <= '1';
			wait for 20 ns;
			Reset <= '0'; 
			wait for 10 ns;
			while true loop	
				Clk <= '1';	 
				wait for 5 ns;
				Clk <= '0';	  
				wait for 5 ns;	
			end loop;
	end process;
	
	process
	begin
		RegWrite <= '0';
		wait for 40 ns;
		RegWrite <= '0';
		wait for 10 ns;
		RegWrite <= '0';
	end process;

end testbench_mips;
