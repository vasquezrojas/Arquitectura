LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_SEU IS
END test_SEU;
 
ARCHITECTURE behavior OF test_SEU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU
    PORT(
         im_entrada : IN  std_logic_vector(12 downto 0);
         im_salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal im_entrada : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal im_salida : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: seu PORT MAP (
		im_entrada => im_entrada,
		im_salida => im_salida
	);

	-- Stimulus process
	stim_proc: process
	begin		
		im_entrada <= "1111111111001";
      wait;
   end process;

END;
