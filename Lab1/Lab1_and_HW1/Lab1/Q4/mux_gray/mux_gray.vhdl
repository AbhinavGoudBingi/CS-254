library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_gray is
port(
	  B2:IN std_logic;
          B1:IN std_logic;
          B0:IN std_logic;
          G2:OUT std_logic;
          G1:OUT std_logic;
	  G0:OUT std_logic
	  );
end mux_gray;

architecture sms of mux_gray is
	
component mux is
port(
		I0:IN std_logic;
		I1:IN std_logic;
		S1:IN std_logic;
		y:OUT std_logic
		);
end component;

signal ba,ba1,x1,xa1: std_logic;

begin
	
muxX1:mux port map(I0=>'1',I1=>'0',S1=>B2,y=>x1);
muxX12:mux port map(I0=>'0' ,I1=>'1',S1=>B2,y=>xa1);
muxX13:mux port map(I0=>xa1 ,I1=>x1,S1=>B1,y=>G1);

muxB:mux port map(I0=>'1',I1=>'0',S1=>B0,y=>ba);
muxB1:mux port map(I0=>'0' ,I1=>'1',S1=>B0,y=>ba1);
muxA:mux port map(I0=>ba1 ,I1=>ba,S1=>B1,y=>G0);

muxG2: mux port map(I0=>'1' ,I1=>'0',S1=>B2,y=>G2);

end sms;

library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
port(
	   I0:IN std_logic;
		I1:IN std_logic;
		S1:IN std_logic;
		y:OUT std_logic
	  );
end mux;

architecture structure of mux is

begin
y <= ((not S1) and I1) or (S1 and I0);
	 
end structure;
