LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_UC IS
END test_UC;
 
ARCHITECTURE behavior OF test_UC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT UC
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         Alu_op : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Alu_op : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: UC PORT MAP (
		op => op,
		op3 => op3,
		Alu_op => Alu_op
	);


	-- Stimulus process
	stim_proc: process
	begin		
		op <= "10";
		op3<="000000";

		wait;
	end process;

END;
