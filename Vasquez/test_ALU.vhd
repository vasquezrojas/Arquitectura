LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_ALU IS
END test_ALU;
 
ARCHITECTURE behavior OF test_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         contRS1 : IN  std_logic_vector(31 downto 0);
         contRS2 : IN  std_logic_vector(31 downto 0);
         alu_op : IN  std_logic_vector(5 downto 0);
         salida_Alu : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal contRS1 : std_logic_vector(31 downto 0) := (others => '0');
   signal contRS2 : std_logic_vector(31 downto 0) := (others => '0');
   signal alu_op : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal salida_Alu : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 


BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	uut: ALU PORT MAP (
		contRS1 => contRS1,
		contRS2 => contRS2,
		alu_op => alu_op,
		salida_Alu => salida_Alu
	);

	-- Stimulus process
	stim_proc: process
	begin
		contRS1 <= x"00000004";
		contRS2 <= x"00000002";
		salida_Alu <= "000010";

      wait;
   end process;

END;
