LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TestBench IS
END TestBench;
 
ARCHITECTURE behavior OF TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_xor
    PORT(
         A : IN  std_logic;
         B: IN std_logic;
         Y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Y : std_logic;

 
BEGIN
 

   uut: mux_xor PORT MAP (
          A => A,
          B => B,
          Y => Y
        );


   stim_proc_A: process
   begin	
	   A<='1';
      wait for 100 ns;	
      A<='0';
      wait;
   end process;

   stim_proc_B: process
   begin	
	   B<='1';
      wait for 50 ns;
      B<='0';
      wait for 100 ns;	
      B<='1';
      wait;
   end process;
	
END;
