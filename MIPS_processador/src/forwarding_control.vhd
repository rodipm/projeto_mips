library IEEE;
use IEEE.std_logic_1164.all;

entity forwarding_control is
	 port(
		 forwarding_rs_address : in STD_LOGIC_vector (4 downto 0);
		 forwarding_rt_address : in STD_LOGIC_vector (4 downto 0);
		 EX_MEM_RegisterRD : in STD_LOGIC_vector (4 downto 0);
		 MEM_WB_RegisterRD : in STD_LOGIC_vector (4 downto 0);
		 EX_MEM_RegWrite : in STD_LOGIC;
		 MEM_WB_RegWrite : in STD_LOGIC;
		 ForwardA : out STD_LOGIC_vector (1 downto 0);
		 ForwardB : out STD_LOGIC_vector (1 downto 0)
	     );
end forwarding_control;


architecture forwarding_control of forwarding_control is
begin
	process (forwarding_rs_address,	forwarding_rt_address, EX_MEM_RegisterRD, MEM_WB_RegisterRD, EX_MEM_RegWrite, MEM_WB_RegWrite)
	begin
		if (EX_MEM_RegWrite = '1' and (EX_MEM_RegisterRD /= "00000") 
			and (EX_MEM_RegisterRD	= forwarding_rs_address)) then
			ForwardA <= "10"; 
		end if;	
		
		if (EX_MEM_RegWrite = '1' 
			and (EX_MEM_RegisterRD /= "00000") 
			and (EX_MEM_RegisterRD	= forwarding_rt_address)) then
			ForwardB <= "10"; 
		end if;
		if (MEM_WB_RegWrite = '1' 
		and (MEM_WB_RegisterRD /= "00000") 
		and not (EX_MEM_RegWrite = '1' and (EX_MEM_RegisterRD /= "00000"))
		and (MEM_WB_RegisterRD	= forwarding_rs_address)) then
			ForwardA <= "01";
		end if;
		if (MEM_WB_RegWrite = '1' 
		and (MEM_WB_RegisterRD /= "00000")
		and not (EX_MEM_RegWrite = '1' and (EX_MEM_RegisterRD /= "00000"))
		and (MEM_WB_RegisterRD	= forwarding_rt_address)) then
			ForwardB <= "01";
		end if;
			
	end process;

end forwarding_control;
