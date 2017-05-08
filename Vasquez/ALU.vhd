library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( contRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           contRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  alu_op:  in  STD_LOGIC_VECTOR (5 downto 0); 
			  PSR_result : in  STD_LOGIC;
           salida_Alu : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

	begin
	process(alu_op ,contRS1,contRS2, PSR_result)
		begin
			case alu_op is

				when "000000" => -- add
					salida_Alu <= contRS1 + contRS2;

				when "010000" => -- addcc
					salida_Alu <= contRS1 + contRS2;

				when "001000" => -- addX
					salida_Alu <= contRS1 + contRS2 + PSR_result;

				when "011000" => -- addXcc
					salida_Alu <= contRS1 + contRS2 + PSR_result;
				
				when "000100" => -- sub
					salida_Alu <= contRS1 - contRS2;
				
				when "010100" => -- subcc
					salida_Alu <= contRS1 - contRS2;
				
				when "001100" => -- subX
					salida_Alu <= contRS1- contRS2 - PSR_result;
				
				when "011100" => -- subXcc
					salida_Alu <= contRS1 - contRS2 - PSR_result;
				
				when "000001" => -- and
					salida_Alu <= contRS1 and contRS2;
			
				when "000101" => -- andn
					salida_Alu <= contRS1 and not (contRS2);
				
				when "010101" => --andNcc
					salida_Alu <= contRS1 and contRS2;
				
				when "010001" => --andcc
					salida_Alu <= contRS1 and contRS2;
				
				when "000010" => --or
					salida_Alu <= contRS1 or contRS2;
				
				when "000110" => --orn
					salida_Alu <= contRS1 or not (contRS2);	
					
				when "010010" => --orcc
					salida_Alu <= contRS1 or contRS2;	
				
				when "010110" => --orNcc
					salida_Alu <= contRS1 or contRS2;  
				
				when "000011" => -- xor
					salida_Alu <= contRS1 xor contRS2;
				
				when "000111" => -- xnor
					salida_Alu <= contRS1 xnor contRS2;
				
				when "010011" => -- xorcc
					salida_Alu <= contRS1 xor contRS2;				
					
				when others => --otras instrucciones
					salida_Alu <= (others=>'0');
						
			end case;
end process; 

end Behavioral;

