library ieee;
use ieee.std_logic_1164.all;
library work;
use work.BasicGates.all;

entity fulladder1 is
  port (I1, I2, Cin: in std_logic; S, C: out std_logic);
end entity fulladder1;

architecture Struct of fulladder1 is
signal x,y,z :std_logic;
begin
  h1: HALF_ADDER port map (A => I1, B => I2, S => x, C => y);
  h2: HALF_ADDER port map (A => Cin, B => x, S => S, C => z);
  o1: OR_2 port map (A => y, B => z, Y => C);
end Struct;
