library IEEE;
use IEEE.std_logic_1164.all;
		 
entity ID_EX_REG is
	 port(
		 WB_CONTROL_BUS : in STD_LOGIC_VECTOR(1 downto 0);
		 MEM_CONTROL_BUS : in STD_LOGIC_VECTOR(2 downto 0);
		 EX_CONTROL_BUS : in STD_LOGIC_VECTOR(3 downto 0);
		 next_instruction_address_bus : in STD_LOGIC_VECTOR(31 downto 0);
		 signal_extended_bus : in STD_LOGIC_VECTOR(31 downto 0);
		 rs_bus : in STD_LOGIC_VECTOR(31 downto 0);
		 rt_bus : in STD_LOGIC_VECTOR(31 downto 0);
		 Clk : in STD_LOGIC;
		 Reset : in STD_LOGIC;
		 Instruction : in STD_LOGIC_VECTOR(20 downto 16);
		 Instruction_3 : in STD_LOGIC_VECTOR(15 downto 11);
		 Instruction_4 : in STD_LOGIC_VECTOR(10 downto 06);
		 Instruction_2 : in STD_LOGIC_VECTOR(25 downto 0);
		 signal_extended : out STD_LOGIC_VECTOR(31 downto 0);
		 rs : out STD_LOGIC_VECTOR(31 downto 0);
		 rt : out STD_LOGIC_VECTOR(31 downto 0);
		 WB_CONTROL : out STD_LOGIC_VECTOR(1 downto 0);
		 MEM_CONTROL : out STD_LOGIC_VECTOR(2 downto 0);
		 EX_CONTROL : out STD_LOGIC_VECTOR(3 downto 0);
		 next_instrucion_address_ID : out STD_LOGIC_VECTOR(31 downto 0);
		 rt_address : out STD_LOGIC_VECTOR(4 downto 0);
		 rd_address : out STD_LOGIC_VECTOR(4 downto 0);
		 shamt : out STD_LOGIC_VECTOR(4 downto 0);
		 jump_address : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end ID_EX_REG;

architecture ID_EX_REG of ID_EX_REG is
begin
		process(Clk,Reset, next_instruction_address_bus, Instruction, Instruction_2, WB_CONTROL_BUS, MEM_CONTROL_BUS, EX_CONTROL_BUS, signal_extended_bus, rt_bus, rs_bus)
	begin
		if Reset = '1' then
			WB_CONTROL <= "00";
			MEM_CONTROL <= "000";
			EX_CONTROL <= "0000";
			next_instrucion_address_ID <= "00000000000000000000000000000000";
			rt_address <= "00000";
			rd_address <= "00000";
			signal_extended <= "00000000000000000000000000000000";
			rs <= "00000000000000000000000000000000";
			rt <= "00000000000000000000000000000000";	
			shamt <= "00000";
			jump_address <= "00000000000000000000000000000000";
		elsif rising_edge(Clk) then
			WB_CONTROL <= WB_CONTROL_BUS;
			MEM_CONTROL <= MEM_CONTROL_BUS;
			EX_CONTROL <= EX_CONTROL_BUS;
			next_instrucion_address_ID  <= next_instruction_address_bus;
			rt_address <= Instruction(20 downto 16);
			rd_address <= Instruction_3(15 downto 11);
			signal_extended <= signal_extended_bus;
			rs <= rs_bus;
			rt <= rt_bus;
			shamt <= Instruction_4(10 downto 06);
			jump_address <= next_instruction_address_bus(31 downto 28) & Instruction_2(25 downto 0) & "00";
		end if;
	end process;
end ID_EX_REG;

