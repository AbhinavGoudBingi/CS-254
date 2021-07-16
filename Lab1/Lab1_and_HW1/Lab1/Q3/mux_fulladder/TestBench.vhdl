LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TestBench IS
END TestBench;
 
ARCHITECTURE behavior OF TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_fulladder
    PORT(
         A : IN  std_logic := '0';
         B: IN std_logic := '0';
         Cin: IN  std_logic := '0';
         S : OUT  std_logic;
         C: OUT std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A,B,Cin,S,C : std_logic;

 
BEGIN
 

   uut: mux_fulladder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          S => S,
          C => C
        );


   stim_proc_A: process
   begin	
	   A<='0';
      wait for 200 ns;	
      A<='1';
      wait;
   end process;

   stim_proc_B: process
   begin	
	   B<='0';
      wait for 100 ns;
      B<='1';
      wait for 100 ns;	
      B<='0';
      wait for 100 ns;
      B<='1';
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
