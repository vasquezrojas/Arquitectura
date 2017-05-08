library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity RF is
    Port ( RS1 : in  STD_LOGIC_VECTOR (4 downto 0);
           RS2 : in  STD_LOGIC_VECTOR (4 downto 0);
           RD : in  STD_LOGIC_VECTOR (4 downto 0);
			  reset : in STD_LOGIC;
			  DWR : in  STD_LOGIC_VECTOR (31 downto 0);
           ContRS1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ContRS2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RF;

architecture Behavioral of RF is
	type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);
	signal registros : ram_type :=(others => x"00000000");

	begin
	process(RS1,RS2, DWR, reset, RD)
		begin
			if(reset = '1')then
				ContRS1 <= (others=>'0');
				ContRS2 <= (others=>'0');
					registros <= (others => x"00000000");
			else
				ContRS1 <= registros(conv_integer(RS1));
				ContRS2 <= registros(conv_integer(RS2));
				if(RD  /= "000000")then
					registros(conv_integer(RD)) <= DWR;
				end if;
			end if;
	end process;

end Behavioral;

