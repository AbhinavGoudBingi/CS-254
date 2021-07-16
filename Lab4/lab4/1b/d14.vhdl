LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY d14 IS
    PORT
        (
         I      :  IN   STD_LOGIC;
         S0      :  IN   STD_LOGIC;
         S1     : IN STD_LOGIC;
         A       :  OUT  STD_LOGIC;
         B :  OUT  STD_LOGIC;
         C       :  OUT  STD_LOGIC;
         D :  OUT  STD_LOGIC
        );
END d14;

ARCHITECTURE behavioral OF d14 IS
BEGIN
A <= I and S0 and S1;
B <= I and (not S0) and S1;
C <= I and S0 and (not S1);
D <= I and (not S0) and (not S1);
 
END behavioral;
