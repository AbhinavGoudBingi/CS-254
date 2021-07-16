library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;


entity mux1 is

    Port ( I1 : in  STD_LOGIC;

           I2 : in  STD_LOGIC;

           Cin : in  STD_LOGIC;

           Y : out  STD_LOGIC);

end mux1;

architecture Behavioral of mux1 is

signal s0,s1,s2:std_logic;

begin

n1:INVERTER port map(A=>Cin,Y=>s0);

a1:AND_2 port map(A=>s0,B=>I1,Y=>s1);

a2:AND_2 port map(A=>Cin,B=>I2,Y=>s2);

o1:OR_2 port map(A=>s1,B=>s2,Y=>Y);

end Behavioral;
