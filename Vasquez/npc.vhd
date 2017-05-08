library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity npc is
    Port ( direccion_in : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           direccion_out : out  STD_LOGIC_VECTOR (31 downto 0));
end npc;

architecture Behavioral of npc is

	begin

	process (direccion_in, reset, clk)
		begin
			if (reset = '1')then
				direccion_out <= x"00000000";
			else
				if(rising_edge(Clk))then
					direccion_out <= direccion_in;
				end if;
			end if;
	end process;

end Behavioral;

