library IEEE;
use IEEE.std_logic_1164.all;
		 
entity EX_MEM_REG is
	port(	   
		 clk : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 
		 WB_CONTROL : in STD_LOGIC_VECTOR(1 downto 0);
		 MEM_CONTROL : in STD_LOGIC_VECTOR(5 downto 0);
		 
		 jump_address_in : in STD_LOGIC_VECTOR(31 downto 0);
		 branch_address_in : in STD_LOGIC_VECTOR(31 downto 0);
		 
		 ULA_in : in STD_LOGIC_VECTOR(31 downto 0);
		 RS_in : in STD_LOGIC_VECTOR(31 downto 0);
		 zero_in: in STD_LOGIC;
		 val_res : in STD_LOGIC_VECTOR(4 downto 0);		 
		 
		 EX_WB_CONTROL : out STD_LOGIC_VECTOR(1 downto 0);
		 EX_MEM_CONTROL : out STD_LOGIC_VECTOR(5 downto 0);
		 
		 EX_branch_address : out STD_LOGIC_VECTOR(31 downto 0);
		 EX_jump_address : out STD_LOGIC_VECTOR(31 downto 0);		 
		 ULA_RES : out STD_LOGIC_VECTOR(31 downto 0);
		 zero : out STD_LOGIC;
		 
		 EX_rs : out STD_LOGIC_VECTOR(31 downto 0);		 
		 val : out STD_LOGIC_VECTOR(4 downto 0)
	     );
end EX_MEM_REG;

architecture EX_MEM_REG of EX_MEM_REG is
begin
	process(Clk, Reset)
	begin
		if Reset = '1' then
			EX_WB_CONTROL <= "00";
			EX_MEM_CONTROL <= "000000";

			EX_jump_address <= "00000000000000000000000000000000";
			EX_branch_address <= "00000000000000000000000000000000";
			ULA_RES <= "00000000000000000000000000000000";
			EX_rs <= "00000000000000000000000000000000";
			val <= "00000";
			zero <= '0';
			
		elsif rising_edge(Clk) then
			EX_WB_CONTROL <= WB_CONTROL;
			EX_MEM_CONTROL <= MEM_CONTROL;
			
			EX_branch_address <= branch_address_in;
			EX_jump_address <= jump_address_in;
			ULA_RES <= ULA_in;
			EX_rs <= RS_in;
			val <= val_res;
			zero <= zero_in;
		end if;
	end process;
end EX_MEM_REG;

