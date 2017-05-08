library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UC is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           Alu_op : out  STD_LOGIC_VECTOR (5 downto 0));
end UC;

architecture Behavioral of UC is

	begin
	process(op,op3)

		begin
		if (op="10")then 
			case op3 is 
				when "000000" => -- ADD
				Alu_op  <= "000000";
					
				when "010000" => -- ADDcc
				Alu_op  <= "010000";
					
				when "001000" => -- ADDX
				Alu_op  <= "001000";
				
				when "011000" => -- ADDXcc
				Alu_op  <= "011000";

				when "000100" => -- SUB
				Alu_op <= "000100";
			 
				when "010100" => -- SUBcc
				Alu_op <= "010100";	
					 
				when "001100" => -- SUBX
				Alu_op <= "001100";	
				
				when "011100" => -- SUBXcc
				Alu_op <= "011100";							
					 
				when "000001" => -- AND
				Alu_op <= "000001";
					 
				when "000101" => -- ANDN
				Alu_op <= "000101";
				
				when "010101" => -- ANDNcc
				Alu_op <= "010101";
					 
				when "010001" => -- ANDcc
				Alu_op <= "010001";							
					 
				when "000010" => -- OR
				Alu_op <= "000010";
					
				when "000110" => -- ORN
				Alu_op <= "000110";
					
				when "010010" => -- ORcc
				Alu_op <= "010010";
					
				when "010110" => -- ORNcc
				Alu_op <= "010110";	
					 
				when "000011" => -- XOR
				Alu_op  <= "000011"; 
					
				when "000111" => -- XNOR
				Alu_op <= "000111";
				
				when "010011" => -- XORcc
				Alu_op  <= "010011"; 
					
				when "010111" => -- XNORcc
				Alu_op <= "010111";	
					
				when others => --otras instrucciones
				Alu_op <= "111111"; 
											
			end case;
		end if;
end process;

end Behavioral;

