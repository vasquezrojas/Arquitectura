library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IM is
    Port ( direccion : in  STD_LOGIC_VECTOR (31 downto 0);
			  reset : in  STD_LOGIC;
           ref : out  STD_LOGIC_VECTOR (31 downto 0));
end IM;

architecture Behavioral of IM is

	type rom_type is array (0 to 63) of std_logic_vector (31 downto 0);
		
	signal instructions : rom_type := InitRomFromFile("testJMPL.data");
	
begin
	process(reset,direccion, ref)
	begin
			if(reset = '1')then
				ref <= (others=>'0');
			else
				ref <= instructions(conv_integer(direccion(5 downto 0)));
			end if;
	end process;

end Behavioral;

