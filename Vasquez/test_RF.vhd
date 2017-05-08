LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_RF IS
END test_RF;
 
ARCHITECTURE behavior OF test_RF IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RF
    PORT(
         RS1 : IN  std_logic_vector(4 downto 0);
         RS2 : IN  std_logic_vector(4 downto 0);
         RD : IN  std_logic_vector(4 downto 0);
         reset : IN  std_logic;
         DWR : IN  std_logic_vector(31 downto 0);
         ContRS1 : OUT  std_logic_vector(31 downto 0);
         ContRS2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RS1 : std_logic_vector(4 downto 0) := (others => '0');
   signal RS2 : std_logic_vector(4 downto 0) := (others => '0');
   signal RD : std_logic_vector(4 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal DWR : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal ContRS1 : std_logic_vector(31 downto 0);
   signal ContRS2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RF PORT MAP (
          RS1 => RS1,
          RS2 => RS2,
          RD => RD,
          reset => reset,
          DWR => DWR,
          ContRS1 => ContRS1,
          ContRS2 => ContRS2
        );


   -- Stimulus process
   stim_proc: process
   begin	
		reset <= '1';

      wait for 100 ns;
			reset <='0';
			RS1 <= "10000";
			RS2 <= "10001";
			RD <= "10010";
			DWR  <= "00000000000000000000000000010011";
		wait;
   end process;

END;
