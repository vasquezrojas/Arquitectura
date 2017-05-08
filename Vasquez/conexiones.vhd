library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity conexiones is
    Port ( reset : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end conexiones;

architecture Behavioral of conexiones is

	--Coneccion a CRUZ
	COMPONENT CRUZ
	PORT(
		direccion_in : IN std_logic_vector(31 downto 0);
		entrada : IN std_logic_vector(31 downto 0);          
		direccion_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Coneccion a NPC
	COMPONENT npc
	PORT(
		direccion_in : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;
		clk : IN std_logic;          
		direccion_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Coneccion a Instruction Memory
	COMPONENT IM
	PORT(
		pc : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		rf : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Coneccion a Register File
	COMPONENT RF
	PORT(
		RS1 : IN std_logic_vector(4 downto 0);
		RS2 : IN std_logic_vector(4 downto 0);
		RD : IN std_logic_vector(4 downto 0);
		reset : IN std_logic;
		DWR : IN std_logic_vector(31 downto 0);          
		ContRS1 : OUT std_logic_vector(31 downto 0);
		ContRS2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Coneccion Unidad Control
	COMPONENT UC
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		Alu_op : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	--Coneccio SEU
	COMPONENT SEU
	PORT(
		im_entrada : IN std_logic_vector(12 downto 0);          
		im_salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Coneccion MUX
	COMPONENT MUX
	PORT(
		inm : IN std_logic;
		crs2 : IN std_logic_vector(31 downto 0);
		sseu : IN std_logic_vector(31 downto 0);          
		smux : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Coneccion ALU
	COMPONENT ALU
	PORT(
		contRS1 : IN std_logic_vector(31 downto 0);
		contRS2 : IN std_logic_vector(31 downto 0);
		alu_op : IN std_logic_vector(5 downto 0);          
		PSR_result : IN std_logic;
		salida_Alu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	---Coneccion ModOSR
	COMPONENT ModPSR
	PORT(
		AluOut : IN std_logic_vector(31 downto 0);
		MuxOut : IN std_logic_vector(31 downto 0);
		RfCrs1Out : IN std_logic_vector(31 downto 0);
		UcOut : IN std_logic_vector(5 downto 0);          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	--Coneccion PSR
	COMPONENT PSR
	PORT(
		ModPsrOut : IN std_logic_vector(3 downto 0);
		clock : IN std_logic;
		reset : IN std_logic;          
		PsrOut : OUT std_logic
		);
	END COMPONENT;

	--Coneccion WM
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

	signal pcregisterfile, sumadortonpc, npctopc, pctoIm, signaltoURS, AluOut, SeutoMux, MuxtoALu, rftoMux, RftoAlu: std_logic_vector(31 downto 0);
	signal UctoAlu: std_logic_vector(5 downto 0);
	signal ModPSRtoPSR: std_logic_vector(3 downto 0);
	signal PSRtoALU,PSR_result:std_logic;


begin
	Inst_CRUZ: CRUZ PORT MAP(
		direccion_in => x"00000001",
		entrada => pcregisterfile,
		direccion_out => sumadortonpc
	);

	Inst_npc: npc PORT MAP(
		direccion_in => sumadortonpc,
		reset => reset,
		clk => clock,
		direccion_out => npctopc
	);

	Inst_pc: npc PORT MAP(
		direccion_in => npctopc,
		reset => reset,
		clk => clock,
		direccion_out => pctoIm
	);

	Inst_IM: IM PORT MAP(
		pc => pctoIm,
		reset => reset,
		rf => signaltoURS
	);

	Inst_RF: RF PORT MAP(
		RS1 => signaltoURS(18 downto 14),
		RS2 => signaltoURS(4 downto 0),
		RD => signaltoURS(29 downto 25),
		reset => reset,
		DWR => AluOut,
		ContRS1 => RftoAlu,
		ContRS2 => rftoMux
	);

	Inst_UC: UC PORT MAP(
		op => signaltoURS(31 downto 30),
		op3 => signaltoURS(24 downto 19),
		Alu_op => UctoAlu
	);

	Inst_SEU: SEU PORT MAP(
		im_entrada => signaltoURS(12 downto 0),
		im_salida => SeutoMux
	);

	Inst_MUX: MUX PORT MAP(
		inm => signaltoURS(13),
		crs2 => rftoMux,
		sseu => SeutoMux,
		smux => MuxtoAlu 
	);

	Inst_ALU: ALU PORT MAP(
		contRS1 => RftoAlu,
		contRS2 => MuxtoAlu,
		alu_op => UctoAlu,
		PSR_result => PSRtoALU,
		salida_Alu => AluOut
	);

	Inst_ModPSR: ModPSR PORT MAP(
		AluOut => AluOut,
		MuxOut => MuxtoAlu,
		RfCrs1Out => RftoAlu,
		UcOut => UctoAlu,
		nzvc => ModPSRtoPSR
	);

	Inst_PSR: PSR PORT MAP(
		ModPsrOut => ModPSRtoPSR,
		clock => clock,
		reset => reset,
		PsrOut => PSRtoALU
	);
	
	
	Inst_WM: WM PORT MAP(
		rs1_in => signaltoURS(18 downto 14),
		rs2_in => signaltoURS(4 downto 0),
		rd_in => RD => signaltoURS(29 downto 25),
		op => signaltoURS(31 downto 30),
		op3 => signaltoURS(24 downto 19),
		cwp => ,
		rs1_out => ,
		rs2_out => ,
		rd_out => ,
		ncwp => 
	);

	salida <= AluOut;

end Behavioral;
