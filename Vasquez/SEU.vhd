library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEU is
    Port ( im_entrada : in  STD_LOGIC_VECTOR(12 downto 0);
           im_salida : out  STD_LOGIC_VECTOR(31 downto 0));
end SEU;

architecture Behavioral of SEU is

	begin

	process(im_entrada)
		begin
		if(im_entrada(12) = '1')then
			im_salida(12 downto 0) <= im_entrada;
			im_salida(31 downto 13) <= (others=>'1');
		else
			im_salida(12 downto 0) <= im_entrada;
			im_salida(31 downto 13) <= (others=>'0');
		end if;
	end process; 

end Behavioral;

