library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX is
    Port ( inm : in  STD_LOGIC;
			  crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           sseu : in  STD_LOGIC_VECTOR (31 downto 0);
           smux : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX;

architecture Behavioral of MUX is

	begin
	process(inm,sseu,crs2)
		begin
		if(inm='1')then
			smux <= sseu;
		else 
			if(inm='0')then
				smux <= crs2;
			end if ; 
		end if; 	
	end process; 

end Behavioral;

