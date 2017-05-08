library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CRUZ is
    Port ( direccion_in : in  STD_LOGIC_VECTOR (31 downto 0);
           entrada : in  STD_LOGIC_VECTOR (31 downto 0);
           direccion_out : out  STD_LOGIC_VECTOR (31 downto 0)
			);
end CRUZ;

architecture Behavioral of CRUZ is
	begin
	process (direccion_in, entrada)
		begin
			direccion_out <= direccion_in + entrada;
	end process;

end Behavioral;