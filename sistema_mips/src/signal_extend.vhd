library IEEE;
use IEEE.std_logic_1164.all;

entity signal_extend is
	 port(
		 Instruction : in STD_LOGIC_VECTOR(15 downto 0);
		 signal_extended_bus : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end signal_extend;

architecture signal_extend of signal_extend is
begin

	 signal_extended_bus <= X"0000" & Instruction when Instruction(15)='0' else X"ffff" & Instruction;
end signal_extend;
