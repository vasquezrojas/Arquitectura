LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_Wm IS
END test_Wm;
 
ARCHITECTURE behavior OF test_Wm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WM
    PORT(
         rs1_in : IN  std_logic_vector(4 downto 0);
         rs2_in : IN  std_logic_vector(4 downto 0);
         rd_in : IN  std_logic_vector(4 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         cwp : IN  std_logic;
         rs1_out : OUT  std_logic_vector(5 downto 0);
         rs2_out : OUT  std_logic_vector(5 downto 0);
         rd_out : OUT  std_logic_vector(5 downto 0);
         ncwp : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rs1_in : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2_in : std_logic_vector(4 downto 0) := (others => '0');
   signal rd_in : std_logic_vector(4 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal cwp : std_logic := '0';

 	--Outputs
   signal rs1_out : std_logic_vector(5 downto 0);
   signal rs2_out : std_logic_vector(5 downto 0);
   signal rd_out : std_logic_vector(5 downto 0);
   signal ncwp : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WM PORT MAP (
          rs1_in => rs1_in,
          rs2_in => rs2_in,
          rd_in => rd_in,
          op => op,
          op3 => op3,
          cwp => cwp,
          rs1_out => rs1_out,
          rs2_out => rs2_out,
          rd_out => rd_out,
          ncwp => ncwp
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
