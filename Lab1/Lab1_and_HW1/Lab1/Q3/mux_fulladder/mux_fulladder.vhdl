library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_fulladder is
port(
	  A:IN std_logic;
          B:IN std_logic;
          Cin:IN std_logic;
	  S:OUT std_logic;
          C:OUT std_logic
	  );
end mux_fulladder;

architecture sms of mux_fulladder is
	
component mux is
port(
		I0:IN std_logic;
		I1:IN std_logic;
		S1:IN std_logic;
		y:OUT std_logic
		);
end component;

signal c1,s1,c2,ba,ba1,ba2,ba3,ba4,ba5,ba6: std_logic;

begin
	
muxB:mux port map(I0=>'1',I1=>'0',S1=>B,y=>ba);
muxB1:mux port map(I0=>'0' ,I1=>'1',S1=>B,y=>ba1);
muxA:mux port map(I0=>ba1 ,I1=>ba,S1=>A,y=>s1);

muxB2:mux port map(I0=>'1',I1=>'0',S1=>B,y=>ba2);
muxA1:mux port map(I0=>ba2 ,I1=>'0',S1=>A,y=>c1);

muxX:mux port map(I0=>'1',I1=>'0',S1=>Cin,y=>ba3);
muxX1:mux port map(I0=>'0' ,I1=>'1',S1=>Cin,y=>ba4);
muxY:mux port map(I0=>ba4 ,I1=>ba3,S1=>s1,y=>S);

muxX2:mux port map(I0=>'1',I1=>'0',S1=>Cin,y=>ba5);
muxY1:mux port map(I0=>ba5 ,I1=>'0',S1=>s1,y=>c2);

muxP:mux port map(I0=>'1',I1=>'0',S1=>c2,y=>ba6);
muxQ:mux port map(I0=>'1' ,I1=>ba6,S1=>c1,y=>C);

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
