library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Adder is
	 port(
		 address_bus : in STD_LOGIC_VECTOR(31 downto 0);
		 next_instruction_address_bus : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end Adder;

--}} End of automatically maintained section

architecture Adder of Adder is
begin

	-- enter your statements here --  	 
	next_instruction_address_bus <= address_bus + std_logic_vector(to_unsigned(4, 32));	
end Adder;