library IEEE;
use IEEE.std_logic_1164.all;

entity instruction_memory is
	 port(
		 address_bus : in STD_LOGIC_VECTOR(31 downto 0);
		 instruction_bus : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end instruction_memory;

architecture instruction_memory of instruction_memory is
begin
	process	(address_bus)
	begin
		case address_bus is
			when "00000000000000000000000000000000" =>
				------- Type R -------
				--instruction_bus <= "000000"&"00010"&"00101"&"00001"&"00000"&"100000"; -- Type R (add $1, $2, $5)
				--instruction_bus <= "000000"&"00010"&"00101"&"00001"&"00000"&"100001"; -- Type R (addu $1, $2, $5)
				--instruction_bus <= "000000"&"00010"&"00101"&"00001"&"00000"&"101010"; -- Type R (slt $1, $2, $5)
				--instruction_bus <= "000000"&"00101"&"00010"&"00001"&"00000"&"101010"; -- Type R (slt $2, $1, $5)
				--instruction_bus <= "000000"&"00000"&"00000"&"00000"&"00000"&"001000"; -- Type R (jr $0)
				--instruction_bus <= "000000"&"00010"&"00000"&"00001"&"00111"&"000000"; -- Type R (sll $1, $2, 7)
				
				------- Type I -------
				--instruction_bus <= "100011"&"00010"&"00001"&"0000000000000000"; -- Type I (lw $1, 0($2))
				--instruction_bus <= "100011"&"00010"&"00001"&"0000000000010000"; -- Type I (lw $1, 16($2))
				--instruction_bus <= "101011"&"00010"&"00001"&"0000000000000000"; -- Type I (sw $1, 0($2))
				--instruction_bus <= "101011"&"00010"&"00001"&"0000000000010000"; -- Type I (sw $1, 16($2))
				
				--instruction_bus <= "001000"&"00010"&"00001"&"0000000000010000"; -- Type I (addi $1, $2, 16)
				--instruction_bus <= "001010"&"00010"&"00001"&"0000000000000001"; -- Type I (slti $1, $2, 1)
				--instruction_bus <= "001010"&"00010"&"00001"&"0000000000000010"; -- Type I (slti $1, $2, 2)  
				
				--instruction_bus <= "000100"&"00010"&"00001"&"0000000000000001"; -- Type I (beq $1, $2, 1)
				--instruction_bus <= "000100"&"00001"&"00001"&"0000000000000001"; -- Type I (beq $1, $1, 1)
				--instruction_bus <= "000101"&"00010"&"00001"&"0000000000000001"; -- Type I (bnq $1, $2, 1)
				--instruction_bus <= "000101"&"00001"&"00001"&"0000000000000001"; -- Type I (bnq $1, $1, 1)
				
				------- Type J -------
				--instruction_bus <= "000010"&"00000000000000000000000001"; -- Type J (j 1)
				--instruction_bus <= "000011"&"00000000000000000000000001"; -- Type J (jal 1)
		
				
				
				
			--when "00000000000000000000000000000000" =>   
				--instruction_bus <= "10001100010000100000000000000000"; -- LW
			--when "00000000000000000000000000000000" =>
				--instruction_bus <= "10101100001000100000000000000010"; -- SW
			--when "00000000000000000000000000000000" => 
			--	instruction_bus <= "00010000000000000000000000000000"; -- BEQ
			--when "00000000000000000000000000000000" =>
			--	instruction_bus <= "00010100000000000000000000000000"; -- BNE
			--when "00000000000000000000000000000000" =>
			--	instruction_bus <= "00100000000000000000000000000000"; -- ADDI
			--when "00000000000000000000000000000000" =>
			--	instruction_bus <= "00101000000000000000000000000000"; -- SLTI 
			--when "00000000000000000000000000000000" =>
				--instruction_bus <= "00001000000000000000000000000010"; -- J
			--when "00000000000000000000000000000000" =>
			--	instruction_bus <= "00001100000000000000000000000011"; -- JAL  
			--when "00000000000000000000000000000000" =>  
			--instruction_bus <= "00000000001000100001100000101010"; -- SLT	
			--when "00000000000000000000000000000000" =>
				--instruction_bus <= "00000000001000000000000000001000"; -- JR	
			when others =>
				instruction_bus <= "11111100000000000000000000111111";
		end case;
	end process;

end instruction_memory;
