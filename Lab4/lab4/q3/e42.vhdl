LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY e42 IS
    PORT
        (
         O1      :  out   STD_LOGIC;
         O0      :  out   STD_LOGIC;
         A       :  IN  STD_LOGIC;
         B :  IN  STD_LOGIC;
         C       :  IN  STD_LOGIC;
         D :  IN  STD_LOGIC;
         En : IN std_logic;
         V : out std_logic
        );
END e42;

ARCHITECTURE behavioral OF e42 IS
BEGIN
V <= En and (A or B or C or D);
O1 <= A or B;
O0 <= A or ((not B) and C);

END behavioral;
