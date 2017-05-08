library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ModPSR is
    Port ( AluOut : in  STD_LOGIC_VECTOR (31 downto 0);
           MuxOut : in  STD_LOGIC_VECTOR (31 downto 0);
			  RfCrs1Out : in  STD_LOGIC_VECTOR (31 downto 0);
           UcOut : in  STD_LOGIC_VECTOR (5 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
end ModPSR;

architecture Behavioral of ModPSR is

begin
process(AluOut,MuxOut,UcOut,RfCrs1Out)
	begin
		if(UcOut = "000001" or UcOut = "000011")then	--ADDCC ADDXCC
			nzvc(3) <= AluOut(31);	
			if(AluOut = X"00000000")then
				nzvc(2) <= '1';
			else
				nzvc(2) <= '0';
			end if;
			nzvc(1) <= (MuxOut(31) and RfCrs1Out(31) and (not AluOut(31))) or ((MuxOut(31)) and (not RfCrs1Out(31)) and AluOut(31));
			nzvc(0) <= (MuxOut(31) and RfCrs1Out(31)) or ((not AluOut(31)) and (MuxOut(31) or RfCrs1Out(31)));
		else
			if(UcOut = "000101")then	--SUBCC
				nzvc(3) <= AluOut(31);
				if(AluOut = X"00000000")then
					nzvc(2) <= '1';
				else
					nzvc(2) <= '0';
				end if;
				nzvc(1) <= ((MuxOut(31) and (not RfCrs1Out(31)) and (not AluOut(31))) or ((not MuxOut(31)) and RfCrs1Out(31) and AluOut(31)));
				nzvc(0) <= ((not MuxOut(31)) and RfCrs1Out(31)) or (AluOut(31) and ((not MuxOut(31)) or RfCrs1Out(31)));
			else
				if(UcOut = "000101" or UcOut = "000111" or UcOut = "001001" or UcOut = "001011" or UcOut = "001101" or UcOut = "001111")then
					nzvc(3) <= AluOut(31);
					if(AluOut = X"00000000")then
						nzvc(2) <= '1';
					else
						nzvc(2) <= '0';
					end if;
					nzvc(1) <= '0';
					nzvc(0) <= '0';
				end if;
			end if;
		end if;
end process;

end Behavioral;
