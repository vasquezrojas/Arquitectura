LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_CRUZ IS
END test_CRUZ;

ARCHITECTURE behavior OF test_CRUZ IS 

	COMPONENT CRUZ
		PORT(direccion_in : IN  std_logic_vector(31 downto 0);
			  entrada : IN  std_logic_vector(31 downto 0);
			  direccion_out : OUT  std_logic_vector(31 downto 0));
	END COMPONENT;

	--Inputs
	signal direccion_in : std_logic_vector(31 downto 0) := (others => '0');
	signal entrada : std_logic_vector(31 downto 0) := (others => '0');

	--Outputs
	signal direccion_out : std_logic_vector(31 downto 0);
	-- No clocks detected in port list. Replace <clock> below with
	-- appropriate port name

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: CRUZ PORT MAP (
          direccion_in => direccion_in,
          entrada => entrada,
          direccion_out => direccion_out
        );


   -- Stimulus process
   stim_proc: process
   begin
		direccion_in <= x"00000001";
		entrada <= x"00000002";
      -- hold reset state for 100 ns.
      wait for 30 ns;
			direccion_in <= x"00000002";
			entrada <= x"00000002";
		wait for 30 ns;
			direccion_in <= x"00000008";
			entrada <= x"00000002";
		wait for 30 ns;
			direccion_in <= x"00000004";
			entrada <= x"00000002";
      wait;
   end process;

END;
