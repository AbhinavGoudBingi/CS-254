LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

library work;
use work.Basicstructure.all;

ENTITY lab31 IS
    PORT
        (
         x_in      :  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
         y_in      :  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
         sum       :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
         carry_out :  OUT  STD_LOGIC
        );
END lab31;

ARCHITECTURE behavioral OF lab31 IS
BEGIN
inst1: CLA port map(x_in => x_in, y_in => y_in, carry_in => '0', sum => sum, carry_out =>carry_out); 
END behavioral;
