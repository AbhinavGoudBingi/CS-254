library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_halfadder is
port(
	  A:IN std_logic;
          B:IN std_logic;
	  S:OUT std_logic;
          C:OUT std_logic
	  );
end mux_halfadder;

architecture sms of mux_halfadder is
	
component mux is
port(
		I0:IN std_logic;
		I1:IN std_logic;
		S1:IN std_logic;
		y:OUT std_logic
		);
end component;

signal ba,ba1,ba2: std_logic;

begin
	
muxB:mux port map(I0=>'1',I1=>'0',S1=>B,y=>ba);
muxB1:mux port map(I0=>'0' ,I1=>'1',S1=>B,y=>ba1);
muxA:mux port map(I0=>ba1 ,I1=>ba,S1=>A,y=>S);

muxB2:mux port map(I0=>'1',I1=>'0',S1=>B,y=>ba2);
muxA1:mux port map(I0=>ba2 ,I1=>'0',S1=>A,y=>C);

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
