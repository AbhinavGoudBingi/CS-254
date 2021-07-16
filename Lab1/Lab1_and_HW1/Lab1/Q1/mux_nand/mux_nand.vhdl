library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_nand is
port(
	  A:IN std_logic;
          B:IN std_logic;
	  Y:OUT std_logic
	  );
end mux_nand;

architecture sms of mux_nand is
	
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
	
muxB:mux port map(I0=>'0',I1=>'1',S1=>B,y=>ba);
muxA:mux port map(I0=>ba ,I1=>'1',S1=>A,y=>Y);

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
