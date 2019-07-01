library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file is
	 port(
		 RegWrite : in STD_LOGIC;
		 write_register : in STD_LOGIC_VECTOR(4 downto 0);
		 write_data : in STD_LOGIC_VECTOR(31 downto 0);
		 Instruction : in STD_LOGIC_VECTOR(25 downto 21);	-- RS Address
		 Instruction_2 : in STD_LOGIC_VECTOR(20 downto 16); -- RT Address
		 Reset : in STD_LOGIC;
		 Clk : in STD_LOGIC;
		 rs_bus : out STD_LOGIC_VECTOR(31 downto 0);
		 rt_bus : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end register_file;

--}} End of automatically maintained section

architecture register_file of register_file is	

type REGS_T is array (31 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
signal REGISTRADORES : REGS_T;

begin

	process(Clk,Reset,RegWrite,write_data,write_register)
	begin
	if  Reset='1' then
			for i in 0 to 31 loop
				REGISTRADORES <= (
				    x"00000000",  -- $ra	31
				    x"FFFFFFFF", -- $fp	30
				    x"FFFFFFFF", -- $sp	29
				    x"00000200", -- $gp	28
					x"00011011", -- $k1 27
					x"00011010", -- $k0 26
					x"00011001", -- $t9 25
					x"00011000", -- $t8 24
					x"00010111", -- $s7 23
					x"00010110", -- $s6 22
					x"00010101", -- $s5 21
					x"00010100", -- $s4 20
					x"00010011", -- $s3 19
					x"00010010", -- $s2 18
					x"00010001", -- $s1 17
					x"00010000", -- $s0 16
					x"00001111", -- $t7 15
					x"0000000E", -- $t6 14
					x"0000000D", -- $t5 13
					x"0000000C", -- $t4 12
				    x"0000000B", -- $t3 11
				    x"0000000A", -- $t2 10
				    x"00000009", -- $t1 09
				    x"00000008", -- $t0 08
				    x"00000007", -- $a3 07
				    x"00000006", -- $a2 06
				    x"00000005", -- $a1 05
				    x"00000004", -- $a0 04
				    x"00000003", -- $v1 03
				    x"00000002", -- $v0 02
				    x"00000008", -- $at 01
				    x"00000000" -- $0  00
				);
			end loop;
	elsif rising_edge(Clk) then
		if  RegWrite='1' and write_register /= "00000" then
			REGISTRADORES(to_integer(unsigned(write_register)))<= write_data after 5 ns; -- escrita
		end if;
	end if;
	end process;
	
	process(Clk,Reset,Instruction, REGISTRADORES)
	begin
		if  Reset='1' then
			rs_bus <= "00000000000000000000000000000000";
		elsif falling_edge(Clk) then
			rs_bus <= REGISTRADORES(to_integer(unsigned(Instruction))) after 0 ns; -- leitura
		end if;
	end	process;
	
	process(Clk,Reset,Instruction_2, REGISTRADORES)
	begin
		if  Reset='1' then	
			rt_bus <= "00000000000000000000000000000000";
		elsif falling_edge(Clk) then
			rt_bus <= REGISTRADORES(to_integer(unsigned(Instruction_2))) after 0 ns; -- leitura
		end if;
	end process;


end register_file;
