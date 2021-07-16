LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lab3hw IS
PORT ( A12,A22,A32,A42,B12,B22,B32,B42,S0,S1  : IN STD_LOGIC;
O12,O22,O32,O42,O52 : OUT STD_LOGIC);
END lab3hw;

ARCHITECTURE structural OF lab3hw IS

signal so,s2,s3,s4,s5,s6,m1,m2,m3,m4:std_logic;

begin

process(A12,A22,A32,A42,B12,B22,B32,B42,so,s2,s3,s4,s5,s6,m1,m2,m3,m4)

begin

if S0 = '0' and S1 = '0' then
O12 <= (A12 xor B12) xor '0';
so <= (A12 and B12) or ('0' and (A12 xor B12));
O22 <= (A22 xor B22) xor so;
s2 <= (A22 and B22) or (so and (A22 xor B22));
O32 <= (A32 xor B32) xor s2;
s3 <= (A32 and B32) or (s2 and (A32 xor B32));
O42 <= (A42 xor B42) xor s3;
O52 <= (A42 and B42) or (s3 and (A42 xor B42));

elsif S0 = '1' and S1 = '0' then
O12 <= (A12 xor (not B12)) xor '1';
s4 <= (A12 and (not B12)) or ('1' and (A12 xor (not B12)));
O22 <= (A22 xor (not B22)) xor s4;
s5 <= (A22 and (not B22)) or (s4 and (A22 xor (not B22)));
O32 <= (A32 xor (not B32)) xor s5;
s6 <= (A32 and (not B32)) or (s5 and (A32 xor (not B32)));
O42 <= (A42 xor (not B42)) xor s6;
O52 <= '0';

elsif S0 = '0' and S1 = '1' then
O12 <= A12 nand B12;
O22 <= A22 nand B22;
O32 <= A32 nand B32;
O42 <= A42 nand B42;
O52 <= '0';

else
O12 <= A12 and B12;
m1 <= A12 and B22;
m2 <= A22 and B12;
O22 <= m1 xor m2;
m3 <= m1 and m2;
m4 <= A22 and B22;
O32 <= m4 xor m3;
O42 <= m4 and m3;
O52 <= '0';

end if;

end process;

end structural;
