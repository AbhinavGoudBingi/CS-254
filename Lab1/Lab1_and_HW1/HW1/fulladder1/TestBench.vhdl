LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TestBench IS
END TestBench;
 
ARCHITECTURE behavior OF TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fulladder1
    PORT(
         I1 : IN  std_logic := '0';
         I2: IN std_logic := '0';
         Cin: IN  std_logic := '0';
         S : OUT  std_logic;
         C: OUT std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal I1,I2,Cin,S,C : std_logic;

 
BEGIN
 

   uut: fulladder1 PORT MAP (
          I1 => I1,
          I2 => I2,
          Cin => Cin,
          S => S,
          C => C
        );


   stim_proc_I1: process
   begin	
	   I1<='0';
      wait for 200 ns;	
      I1<='1';
      wait;
   end process;

   stim_proc_I2: process
   begin	
	   I2<='0';
      wait for 100 ns;
      I2<='1';
      wait for 100 ns;	
      I2<='0';
      wait for 100 ns;
      I2<='1';
      wait;
   end process;

   stim_proc_Cin: process
   begin	
	   Cin<='0';
      wait for 50 ns;
      Cin<='1';
      wait for 50 ns;	
      Cin<='0';
      wait for 50 ns;
      Cin<='1';
      wait for 50 ns;
      Cin<='0';
      wait for 50 ns;
      Cin<='1';
      wait for 50 ns;	
      Cin<='0';
      wait for 50 ns;
      Cin<='1';
      wait;
   end process;
	
END;
