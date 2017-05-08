library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PSR is
    Port ( ModPsrOut : in  STD_LOGIC_VECTOR (3 downto 0);
			  ncwp : in STD_LOGIC;
           clock : in  STD_LOGIC;
			  reset :in  STD_LOGIC;
			  cwp : out STD_LOGIC;
           PsrOut : out STD_LOGIC);
end PSR;

architecture Behavioral of PSR is

	begin
	process(ModPsrOut,clock,reset)
		begin
			if(rising_edge(clock))then
				if(reset = '1') then
					PsrOut <= '0';
				else
					PsrOut <= ModPsrOut(0);
				end if;
			end if;
	end process;

end Behavioral;
