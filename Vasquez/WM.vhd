library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity WM is
    Port ( rs1_in : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2_in : in  STD_LOGIC_VECTOR (4 downto 0);
           rd_in : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  cwp : in STD_LOGIC;
           rs1_out : out  STD_LOGIC_VECTOR (5 downto 0);
           rs2_out : out  STD_LOGIC_VECTOR (5 downto 0);
           rd_out : out  STD_LOGIC_VECTOR (5 downto 0);
			  ncwp : out STD_LOGIC := '0');
end WM;

architecture Behavioral of WM is
	signal rs1Ent,rs2Ent,rdEnt: integer range 0 to 39:=0;
	signal cwpEnt: integer := conv_integer(cwp);

	begin
	process(rs1_in, rs2_in, rd_in, op, op3, cwp, rs1Ent, rs2Ent, rdEnt)
		begin
		
		if(op="10" and op3="111100")then
			if cwp ='1' then
				ncwp <= '1';
				cwpEnt <= 0;
			else
				ncwp <= '0';
				cwpEnt <= 1;
			end if;
		else
			if (op="10" and op3="111101")then
				if cwp = '1' then
					ncwp <= '0';
					cwpEnt <= 0;
				else
					ncwp <= '1';
					cwpEnt <= 1;
				end if;
			end if;
		end if;
		
		if(rs1_in >= "00000" and rs1_in <= "00111")then
			rs1Ent <= conv_integer(rs1_in);
		else
			if(rs1_in >= "11000" and rs1_in <= "11111")then
				rs1Ent <= conv_integer(rs1_in) - (conv_integer(cwpEnt)*16);
			else
				if(rs1_in >= "10000" and rs1_in <= "10111")then
					rs1Ent <= conv_integer(rs1_in) + (conv_integer(cwpEnt)*16);
				else
					if(rs1_in >= "01000" and rs1_in <= "01111")then
						rs1Ent <= conv_integer(rs1_in) + (conv_integer(cwpEnt)*16);
					end if;
				end if;
			end if;
		end if;
		
		if(rs2_in >="00000" and rs2_in<="00111") then
			rS2Ent <= conv_integer(rs2_in);
		else
			if(rs2_in >= "11000" and rs2_in <= "11111") then
				rs2Ent <= conv_integer(rs2_in) - (conv_integer(cwpEnt)*16);
			else
				if(rs2_in >= "10000" and rs2_in <= "10111") then
					rs2Ent <= conv_integer(rs2_in) + (conv_integer(cwpEnt)*16);
				else
					if(rs2_in >= "01000" and rs2_in <= "01111") then
						rs2Ent <= conv_integer(rs2_in) + (conv_integer(cwpEnt)*16);
					end if;
				end if;
			end if;
		end if;
		
		if(rd_in >= "00000" and rd_in <= "00111") then
			rdEnt <= conv_integer(rd_in);
		else
			if(rd_in >= "11000" and rd_in <= "11111") then
				rdEnt <= conv_integer(rd_in) - (conv_integer(cwp)*16);
			else
				if(rd_in >= "10000" and rs1_in <= "10111") then
					rdEnt <= conv_integer(rd_in) + (conv_integer(cwp)*16);
				else
					if(rd_in >= "01000" and rd_in <= "01111") then
						rdEnt <= conv_integer(rd_in) + (conv_integer(cwp)*16);
					end if;
				end if;
			end if;
		end if;

	end process;
	
	rs1_out <= conv_std_logic_vector(rs1Ent, 6);
   rs2_out <= conv_std_logic_vector(rs2Ent, 6);
   rd_out <=  conv_std_logic_vector(rdEnt, 6);

end Behavioral;
