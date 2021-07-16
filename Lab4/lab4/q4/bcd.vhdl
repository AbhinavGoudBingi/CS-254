library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd is
port(
	  G1:IN std_logic;
          G0:IN std_logic;
	  X:OUT std_logic;
          Y:OUT std_logic;
          Z: OUT std_logic;
          W: OUT std_logic
	  );
end bcd;

architecture sms of bcd is
	
component d12 IS
    PORT
        (
         I      :  IN   STD_LOGIC;
         S0      :  IN   STD_LOGIC;
         A       :  OUT  STD_LOGIC;
         B :  OUT  STD_LOGIC
        );
END component d12;

component d24 IS
    PORT
        (
         I11      :  IN   STD_LOGIC;
         I01      :  IN   STD_LOGIC;
         A1       :  OUT  STD_LOGIC;
         B1 :  OUT  STD_LOGIC;
         C1       :  OUT  STD_LOGIC;
         D1 :  OUT  STD_LOGIC
        );
END component d24;

signal s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,not1,not2: std_logic;
begin
	
inst1: d24 port map(I11=>G1,I01=>G0,A1=>s1,B1=>s2,C1=>s3,D1=>s4);
inst2: d12 port map(I=>'1',S0=>s1,A=>not1,B=>s5);
inst3: d12 port map(I=>'1',S0=>s2,A=>not2,B=>s6);
inst4: d12 port map(I=>s5,S0=>s6,A=>X,B=>s7);
inst5: d12 port map(I=>s5,S0=>s6,A=>Y,B=>s8);
inst6: d12 port map(I=>s3,S0=>s4,A=>Z,B=>s9);
inst7: d12 port map(I=>s1,S0=>s4,A=>W,B=>s10);

end sms;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY d12 IS
    PORT
        (
         I      :  IN   STD_LOGIC;
         S0      :  IN   STD_LOGIC;
         A       :  OUT  STD_LOGIC;
         B :  OUT  STD_LOGIC
        );
END d12;

ARCHITECTURE behavioral OF d12 IS
BEGIN
A <= I and S0;
B <= I and (not S0);
 
END behavioral;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY d24 IS
    PORT
        (
         I11      :  IN   STD_LOGIC;
         I01      :  IN   STD_LOGIC;
         A1       :  OUT  STD_LOGIC;
         B1 :  OUT  STD_LOGIC;
         C1       :  OUT  STD_LOGIC;
         D1 :  OUT  STD_LOGIC
        );
END d24;

ARCHITECTURE behaviorals OF d24 IS
BEGIN
A1 <= I11 nand I01;
B1 <= (not I11) or I01;
C1 <= (not I01) or I11;
D1 <= I11 or I01;
 
END behaviorals;
