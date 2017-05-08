library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;

entity IM is
    Port ( pc : in  STD_LOGIC_VECTOR (31 downto 0);
			  reset : in  STD_LOGIC;
           rf : out  STD_LOGIC_VECTOR (31 downto 0));
end IM;

architecture Behavioral of IM is
	type rom_type is array (0 to 31) of std_logic_vector (31 downto 0);
		
	impure function InitRomFromFile (RomFileName : in string) return rom_type is
		FILE RomFile : text open read_mode is RomFileName;
		variable RomFileLine : line;
		variable temp_bv : bit_vector(31 downto 0);
		variable temp_mem : rom_type;
		begin
			for I in rom_type'range loop
				readline (RomFile, RomFileLine);
				read(RomFileLine, temp_bv);
				temp_mem(i) := to_stdlogicvector(temp_bv);
			end loop;
		return temp_mem;
	end function;

	signal instructions : rom_type := InitRomFromFile("proce3.data");

	begin
		process(pc,reset)
		begin
			if(reset = '1')then
				rf <= (others=>'0');
			else
				rf <= instructions(conv_integer(pc(5 downto 0)));
			end if;
		end process;

end Behavioral;

