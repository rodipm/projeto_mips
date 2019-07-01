library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity ALU_Control is
	 port(
	 	ULAop1 : in STD_LOGIC;
	 	ULAop2 : in STD_LOGIC;
		instruction : in STD_LOGIC_VECTOR(5 downto 0);
		
		ulaSelection : out STD_LOGIC_VECTOR(2 downto 0)
	);
		 
end ALU_Control;

architecture ALU_Control of ALU_Control is

begin

	ulaSelection <= (ULAop1 and instruction(3))
				  & (ULAop2 or (ULAop1 and (instruction(4) or instruction(5))))
				  & ((not ULAop1) or (not instruction(2)));
	
end ALU_Control;
