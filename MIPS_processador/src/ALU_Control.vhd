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

	ulaSelection <= (ULAop2 and (instruction(2) or instruction(3)))
				  & (ULAop1 or (ULAop2 and (instruction(1) or (not instruction(5)))))
				  & ((not ULAop1) and ((not ULAop2) or instruction(0) or (not instruction(5))));
	
end ALU_Control;   

