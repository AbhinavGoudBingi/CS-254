LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lab32 IS
PORT ( 
         x_in      :  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
         y_in      :  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
         S1  :  IN   STD_LOGIC;
         S0 : In std_logic;
         output : out std_logic_vector(7 downto 0);
         carry_out : out std_logic;
         zf : out std_logic
);
END lab32;

ARCHITECTURE structural OF lab32 IS

SIGNAL    h_sum              :    STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL    carry_generate     :    STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL    carry_propagate    :    STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL    carry_in_internal  :    STD_LOGIC_VECTOR(7 DOWNTO 1);
SIGNAL    h_sum2              :    STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL    carry_generate2     :    STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL    carry_propagate2    :    STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL    carry_in_internal2  :    STD_LOGIC_VECTOR(7 DOWNTO 1);
signal temp : std_logic_vector(7 downto 0);
signal tempo : std_logic;

begin

process(x_in,y_in,S1,S0,h_sum,carry_generate,carry_propagate,carry_in_internal,h_sum2,carry_generate2,carry_propagate2,carry_in_internal2,tempo,temp)

begin

if S0 = '0' and S1 = '0' then
h_sum <= x_in XOR y_in;
    carry_generate <= x_in AND y_in;
    carry_propagate <= x_in OR y_in;
carry_in_internal(1) <= carry_generate(0) OR (carry_propagate(0) AND '0');
        inst: FOR i IN 1 TO 6 LOOP
              carry_in_internal(i+1) <= carry_generate(i) OR (carry_propagate(i) AND carry_in_internal(i));
              END LOOP;
    carry_out <= carry_generate(7) OR (carry_propagate(7) AND carry_in_internal(7));
    tempo <= carry_generate(7) OR (carry_propagate(7) AND carry_in_internal(7));
output(0) <= h_sum(0) XOR '0';
temp(0) <= h_sum(0) XOR '0';
    output(7 DOWNTO 1) <= h_sum(7 DOWNTO 1) XOR carry_in_internal(7 DOWNTO 1);
temp(7 DOWNTO 1) <= h_sum(7 DOWNTO 1) XOR carry_in_internal(7 DOWNTO 1);

elsif S0 = '1' and S1 = '0' then
h_sum2 <= x_in XOR (not y_in);
    carry_generate2 <= x_in AND (not y_in);
    carry_propagate2 <= x_in OR (not y_in);
carry_in_internal2(1) <= carry_generate2(0) OR (carry_propagate2(0) AND '1');
        inst1: FOR i IN 1 TO 6 LOOP
              carry_in_internal2(i+1) <= carry_generate2(i) OR (carry_propagate2(i) AND carry_in_internal2(i));
              END LOOP;
    carry_out <= carry_generate2(7) OR (carry_propagate2(7) AND carry_in_internal2(7));
tempo <= carry_generate2(7) OR (carry_propagate2(7) AND carry_in_internal2(7));
output(0) <= h_sum2(0) XOR '1';
temp(0) <= h_sum2(0) XOR '1';
    output(7 DOWNTO 1) <= h_sum2(7 DOWNTO 1) XOR carry_in_internal2(7 DOWNTO 1);
temp(7 DOWNTO 1) <= h_sum2(7 DOWNTO 1) XOR carry_in_internal2(7 DOWNTO 1);

elsif S0 = '0' and S1 = '1' then
output <= x_in and y_in;
temp <= x_in and y_in;
carry_out <= '0';
tempo <= '0';

else
output <= x_in xor y_in;
temp <= x_in xor y_in; 
carry_out <= '0';
tempo <= '0';

end if;

if temp(7 downto 0) = "00000000" then
zf <= '1';
else
zf <= '0';
end if;

end process;

end structural;
