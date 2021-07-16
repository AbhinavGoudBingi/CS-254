LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY d24 IS
    PORT
        (
         I1      :  IN   STD_LOGIC;
         I0      :  IN   STD_LOGIC;
         A       :  OUT  STD_LOGIC;
         B :  OUT  STD_LOGIC;
         C       :  OUT  STD_LOGIC;
         D :  OUT  STD_LOGIC
        );
END d24;

ARCHITECTURE behavioral OF d24 IS
BEGIN
A <= I1 nand I0;
B <= (not I1) or I0;
C <= (not I0) or I1;
D <= I1 or I0;
 
END behavioral;
