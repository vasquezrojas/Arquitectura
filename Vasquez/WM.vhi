
-- VHDL Instantiation Created from source file WM.vhd -- 19:52:20 05/04/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT WM
	PORT(
		rs1_in : IN std_logic_vector(4 downto 0);
		rs2_in : IN std_logic_vector(4 downto 0);
		rd_in : IN std_logic_vector(4 downto 0);
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		cwp : IN std_logic;          
		rs1_out : OUT std_logic_vector(5 downto 0);
		rs2_out : OUT std_logic_vector(5 downto 0);
		rd_out : OUT std_logic_vector(5 downto 0);
		ncwp : OUT std_logic
		);
	END COMPONENT;

	Inst_WM: WM PORT MAP(
		rs1_in => ,
		rs2_in => ,
		rd_in => ,
		op => ,
		op3 => ,
		cwp => ,
		rs1_out => ,
		rs2_out => ,
		rd_out => ,
		ncwp => 
	);


