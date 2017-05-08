LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_Conexiones IS
END test_Conexiones;

ARCHITECTURE behavior OF test_Conexiones IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT conexiones
	PORT(
		reset : IN  std_logic;
		clock : IN  std_logic;
		salida : OUT  std_logic_vector(31 downto 0)
	  );
	END COMPONENT;

   --Inputs
   signal reset : std_logic := '0';
   signal clock : std_logic := '0';

 	--Outputs
   signal salida : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clock_period : time := 20 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: conexiones PORT MAP (
          reset => reset,
          clock => clock,
          salida => salida
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		reset <= '1';
			wait for 100 ns;
		reset <= '0';
			wait for clock_period*10;
      wait;
   end process;

END;
