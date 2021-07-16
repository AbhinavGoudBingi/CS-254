library ieee;
use ieee.std_logic_1164.all;
package Basicstructure is
  component CLA is
  PORT
        (
         x_in      :  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
         y_in      :  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
         carry_in  :  IN std_logic;
         sum       :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
         carry_out :  OUT  STD_LOGIC
        );
  end component CLA;

end package Basicstructure;


library ieee;
use ieee.std_logic_1164.all;
entity CLA is
   PORT
        (
         x_in      :  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
         y_in      :  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
         carry_in  :  IN std_logic;
         sum       :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
         carry_out :  OUT  STD_LOGIC
        );
end entity CLA;

architecture Equations of CLA is
SIGNAL h_sum,G,P:STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL C:STD_LOGIC_VECTOR(7 DOWNTO 1);

BEGIN
    h_sum <= x_in XOR y_in;
    G <= x_in AND y_in;
    P <= x_in OR y_in;

C(1) <= G(0) OR (P(0) AND carry_in) ;

C(2) <= G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND carry_in) ;

C(3) <= G(2) OR (P(2) AND G(1)) OR (P(2) AND P(1) AND G(0)) OR (P(2) AND P(1) AND P(0) AND carry_in) ;

C(4) <= G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND carry_in) ;

C(5) <= G(4) OR (P(4) AND G(3)) OR (P(4) AND P(3) AND G(2)) OR (P(4) AND P(3) AND P(2) AND G(1)) OR (P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR (P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND  carry_in) ;

C(6) <= G(5) OR (P(5) AND G(4)) OR (P(5) AND P(4) AND G(3)) OR (P(5) AND P(4) AND P(3) AND G(2)) OR (P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR (P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND  G(0)) OR (P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND carry_in) ;

C(7) <= G(6) OR (P(6) AND G(5)) OR (P(6) AND P(5) AND G(4)) OR (P(6) AND P(5) AND P(4) AND G(3)) OR (P(6) AND P(5) AND P(4) AND P(3) AND G(2)) OR (P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND  G(1)) OR (P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR (P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND carry_in) ;

carry_out <= G(7) OR (P(7) AND G(6)) OR (P(7) AND P(6) AND G(5)) OR (P(7) AND P(6) AND P(5) AND G(4)) OR (P(7) AND P(6) AND P(5) AND P(4) AND G(3)) OR (P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND  G(2)) OR (P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR (P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR (P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND carry_in) ; 
    

sum(0) <= h_sum(0) XOR carry_in;
sum(7 DOWNTO 1) <= h_sum(7 DOWNTO 1) XOR C(7 DOWNTO 1);
end Equations;
