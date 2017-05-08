LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_MUX IS
END test_MUX;
 
ARCHITECTURE behavior OF test_MUX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT MUX
    PORT(
         inm : IN  std_logic;
         crs2 : IN  std_logic_vector(31 downto 0);
         sseu : IN  std_logic_vector(31 downto 0);
         smux : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inm : std_logic := '0';
   signal crs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal sseu : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal smux : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	uut: MUX PORT MAP (
		inm => inm,
		crs2 => crs2,
		sseu => sseu,
		smux => smux
	);


	-- Stimulus process
	stim_proc: process
	begin
		inm <= '1';
		sseu <= x"00000004";
		crs2 	<= x"00000008";

      wait;
   end process;

END;
