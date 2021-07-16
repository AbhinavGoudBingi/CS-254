LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

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

SIGNAL    h_sum              :    STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL    carry_generate     :    STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL    carry_propagate    :    STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL    carry_in_internal  :    STD_LOGIC_VECTOR(7 DOWNTO 1);

BEGIN
    h_sum <= x_in XOR y_in;
    carry_generate <= x_in AND y_in;
    carry_propagate <= x_in OR y_in;
    PROCESS (x_in,y_in,carry_generate,carry_propagate,carry_in_internal)
    BEGIN
    carry_in_internal(1) <= carry_generate(0) OR (carry_propagate(0) AND '0');
        inst: FOR i IN 1 TO 6 LOOP
              carry_in_internal(i+1) <= carry_generate(i) OR (carry_propagate(i) AND carry_in_internal(i));
              END LOOP;
    carry_out <= carry_generate(7) OR (carry_propagate(7) AND carry_in_internal(7));
    END PROCESS;

    sum(0) <= h_sum(0) XOR '0';
    sum(7 DOWNTO 1) <= h_sum(7 DOWNTO 1) XOR carry_in_internal(7 DOWNTO 1);
END behavioral;
