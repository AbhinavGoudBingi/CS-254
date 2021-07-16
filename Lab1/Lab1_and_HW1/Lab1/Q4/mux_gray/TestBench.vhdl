LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TestBench IS
END TestBench;
 
ARCHITECTURE behavior OF TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_gray
    PORT(
         B2 : IN  std_logic := '0';
         B1: IN std_logic := '0';
         B0: IN  std_logic := '0';
         G2 : OUT  std_logic;
         G1: OUT std_logic;
         G0: OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal B2,B1,B0,G2,G1,G0 : std_logic;

 
BEGIN
 

   uut: mux_gray PORT MAP (
          B2 => B2,
          B1 => B1,
          B0 => B0,
          G2 => G2,
          G1 => G1,
          G0 => G0
        );


   stim_proc_B2: process
   begin	
	   B2<='0';
      wait for 200 ns;	
      B2<='1';
      wait;
   end process;

   stim_proc_B1: process
   begin	
	   B1<='0';
      wait for 100 ns;
      B1<='1';
      wait for 100 ns;	
      B1<='0';
      wait for 100 ns;
      B1<='1';
      wait;
   end process;

   stim_proc_B0: process
   begin	
	   B0<='0';
      wait for 50 ns;
      B0<='1';
      wait for 50 ns;	
      B0<='0';
      wait for 50 ns;
      B0<='1';
      wait for 50 ns;
      B0<='0';
      wait for 50 ns;
      B0<='1';
      wait for 50 ns;	
      B0<='0';
      wait for 50 ns;
      B0<='1';
      wait;
   end process;
	
END;
