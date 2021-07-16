library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_or is
port(
	  A:IN std_logic;
          B:IN std_logic;
	  Y:OUT std_logic
	  );
end mux_or;

architecture sms of mux_or is
	
component mux is
port(
		I0:IN std_logic;
		I1:IN std_logic;
		S1:IN std_logic;
		y:OUT std_logic
		);
end component;

signal ba: std_logic;
begin
	
muxB:mux port map(I0=>'1',I1=>'0',S1=>B,y=>ba);
muxA:mux port map(I0=>'1' ,I1=>ba,S1=>A,y=>Y);

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
