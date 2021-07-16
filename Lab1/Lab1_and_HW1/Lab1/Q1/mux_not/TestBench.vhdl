LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TestBench IS
END TestBench;
 
ARCHITECTURE behavior OF TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_not
    PORT(
         A : IN  std_logic;
         Y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal Y : std_logic;

 
BEGIN
 

   uut: mux_not PORT MAP (
          A => A,
          Y => Y
        );


   stim_proc_A: process
   begin	
	   A<='1';
      wait for 100 ns;	
      A<='0';

      wait;
   end process;
	
END;
