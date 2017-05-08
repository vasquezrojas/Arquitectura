LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_npc IS
END test_npc;

ARCHITECTURE behavior OF test_npc IS

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT npc
	PORT(
		direccion_in : IN  std_logic_vector(31 downto 0);
		reset : IN  std_logic;
		clk : IN  std_logic;
		direccion_out : OUT  std_logic_vector(31 downto 0)
	  );
	END COMPONENT;

   --Inputs
   signal direccion_in : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal direccion_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: npc PORT MAP (
          direccion_in => direccion_in,
          reset => reset,
          clk => clk,
          direccion_out => direccion_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin
		reset <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;
		reset <= '0';
		direccion_in <= x"00000004";
		
		wait for 100 ns;
		direccion_in <= x"00000014";
		
		wait for 100 ns;
		direccion_in <= x"00000010";

      -- insert stimulus here

      wait;
   end process;

END;