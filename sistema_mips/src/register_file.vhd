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
signal REGISTRADORES : REGS_T := (
    x"00000000", -- $0  00
    x"00000001", -- $at 01
    x"00000010", -- $v0 02
    x"00000011", -- $v1 03
    x"00000100", -- $a0 04
    x"00000101", -- $a1 05
    x"00000110", -- $a2 06
    x"00000111", -- $a3 07
    x"00001000", -- $t0 08
    x"00001001", -- $t1 09
    x"00001010", -- $t2 10
    x"00001011", -- $t3 11
	x"00001100", -- $t4 12
	x"00001101", -- $t5 13
	x"00001110", -- $t6 14
	x"00001111", -- $t7 15
	x"00010000", -- $s0 16
	x"00010001", -- $s1 17
	x"00010010", -- $s2 18
	x"00010011", -- $s3 19
	x"00010100", -- $s4 20
	x"00010101", -- $s5 21
	x"00010110", -- $s6 22
	x"00010111", -- $s7 23
	x"00011000", -- $t8 24
	x"00011001", -- $t9 25
	x"00011010", -- $k0 26
	x"00011011", -- $k1 27
    x"00000200", -- $gp	28
    x"FFFFFFFF", -- $sp	29
    x"FFFFFFFF", -- $fp	30
    x"00000000"  -- $ra	31
);	  

begin

	process(Clk,Reset,RegWrite,write_data,write_register)
	begin
	if  Reset='1' then
			for i in 0 to 31 loop
				REGISTRADORES(i) <= (others => '0');
			end loop;
	elsif rising_edge(Clk) then
		if  RegWrite='1' and write_register /= "00000" then
			REGISTRADORES(to_integer(unsigned(write_register)))<= write_data after 5 ns;
		end if;
	end if;
	end process;
	
	process(Clk,Reset,RegWrite,write_data,write_register)
	begin
		rs_bus <= REGISTRADORES(to_integer(unsigned(Instruction))) after 5 ns;
	end	process;
	
	process(Clk,Reset,RegWrite,write_data,write_register)
	begin
		rt_bus <= REGISTRADORES(to_integer(unsigned(Instruction_2))) after 5 ns;
	end process;


end register_file;
