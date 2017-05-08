LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_IM IS
END test_IM;
 
ARCHITECTURE behavior OF test_IM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IM
    PORT(
         pc : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         rf : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal pc : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal rf : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IM PORT MAP (
          pc => pc,
          reset => reset,
          rf => rf
        );

 

   -- Stimulus process
   stim_proc: process
   begin	
		reset <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;
		reset <= '0';
		pc <= x"00000002";
		wait;
			

   end process;

END;
