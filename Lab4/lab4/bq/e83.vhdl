library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity e83 is
port(
	  En:IN std_logic;
          D0,D1,D2,D3,D4,D5,D6,D7:IN std_logic;
	  X:OUT std_logic;
          Y:OUT std_logic;
          Z: OUT std_logic;
          V: OUT std_logic
	  );
end e83;

architecture sms of e83 is
	
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

component e42 IS
    PORT
        (
         O1      :  out   STD_LOGIC;
         O0      :  out   STD_LOGIC;
         A2       :  IN  STD_LOGIC;
         B2 :  IN  STD_LOGIC;
         C2       :  IN  STD_LOGIC;
         D2 :  IN  STD_LOGIC;
         En2 : IN std_logic;
         V2 : out std_logic
        );
END component e42;

signal s1,s2,s3,s4,s5,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,not2,not3,not4,not5,not6,not7,oc1,oc2,oc3: std_logic;
begin
	
inst1: e42 port map(En2=>En,A2=>D7,B2=>D6,C2=>D5,D2=>D4,O1=>s1,O0=>s2,V2=>s3);
inst3: e42 port map(En2=>En,A2=>D3,B2=>D2,C2=>D1,D2=>D0,O1=>s4,O0=>s5,V2=>s7);

inst4: d12 port map(I=>'1',S0=>s7,A=>s8,B=>not2);
inst5: d12 port map(I=>'1',S0=>s3,A=>s9,B=>not3);
inst6: d12 port map(I=>not2,S0=>not3,A=>oc1,B=>s10);
inst7: d12 port map(I=>'1',S0=>oc1,A=>s11,B=>V);

inst8: d12 port map(I=>'1',S0=>s1,A=>s12,B=>not4);
inst9: d12 port map(I=>'1',S0=>s4,A=>s13,B=>not5);
inst10: d12 port map(I=>not4,S0=>not5,A=>oc2,B=>s14);
inst11: d12 port map(I=>'1',S0=>oc2,A=>s15,B=>Y);

inst12: d12 port map(I=>'1',S0=>s2,A=>s16,B=>not6);
inst13: d12 port map(I=>'1',S0=>s5,A=>s17,B=>not7);
inst14: d12 port map(I=>not6,S0=>not7,A=>oc3,B=>s18);
inst15: d12 port map(I=>'1',S0=>oc3,A=>s19,B=>Z);

inst16: d12 port map(I=>'1',S0=>s3,A=>X,B=>s20);

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

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY e42 IS
    PORT
        (
         O1      :  out   STD_LOGIC;
         O0      :  out   STD_LOGIC;
         A2       :  IN  STD_LOGIC;
         B2 :  IN  STD_LOGIC;
         C2       :  IN  STD_LOGIC;
         D2 :  IN  STD_LOGIC;
         En2 : IN std_logic;
         V2 : out std_logic
        );
END e42;

ARCHITECTURE behaviora OF e42 IS
BEGIN
V2 <= En2 and (A2 or B2 or C2 or D2);
O1 <= A2 or B2;
O0 <= A2 or ((not B2) and C2);

END behaviora;
