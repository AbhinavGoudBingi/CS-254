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
