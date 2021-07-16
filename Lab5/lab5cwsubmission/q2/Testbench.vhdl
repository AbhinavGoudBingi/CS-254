library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;

entity Testbench is
end entity;
architecture Behave of Testbench is

  ----------------------------------------------------------------
  --  edit the following lines to set the number of i/o's of your
  --  DUT.
  ----------------------------------------------------------------
  constant number_of_inputs  : integer := 120;  -- # input bits to your design.
  constant number_of_outputs : integer := 4;  -- # output bits from your design.
  ----------------------------------------------------------------
  ----------------------------------------------------------------

  -- Note that you will have to wrap your design into the DUT
  -- as indicated in class.

component repetitions is
	port(textfile: std_logic_vector(119 downto 0); reset, clk: in std_logic; value: out std_logic_vector(3 downto 0); valid: out std_logic);
end component;


  --signal input_vector  : std_logic_vector(number_of_inputs-1 downto 0);
  --signal output_vector : std_logic_vector(number_of_outputs-1 downto 0);
  
  -- create a constrained string
  function to_string(x: string) return string is
      variable ret_val: string(1 to x'length);
      alias lx : string (1 to x'length) is x;
  begin  
      ret_val := lx;
      return(ret_val);
  end to_string;

  -- bit-vector to std-logic-vector and vice-versa
  function to_std_logic_vector(x: bit_vector) return std_logic_vector is
     alias lx: bit_vector(1 to x'length) is x;
     variable ret_val: std_logic_vector(1 to x'length);
  begin
     for I in 1 to x'length loop
        if(lx(I) = '1') then
          ret_val(I) := '1';
        else
          ret_val(I) := '0';
        end if;
     end loop; 
     return ret_val;
  end to_std_logic_vector;

  function to_bit_vector(x: std_logic_vector) return bit_vector is
     alias lx: std_logic_vector(1 to x'length) is x;
     variable ret_val: bit_vector(1 to x'length);
  begin
     for I in 1 to x'length loop
        if(lx(I) = '1') then
          ret_val(I) := '1';
        else
          ret_val(I) := '0';
        end if;
     end loop; 
     return ret_val;
  end to_bit_vector;

-- Inputs
signal clk : std_logic := '0';
signal reset : std_logic := '1';
signal textfile: std_logic_vector(119 downto 0) := (others => '0');
-- Clock period definitions
constant Clk_period : time := 10 ns;
--Outputs
signal value : std_logic_vector(3 downto 0);
signal valid : std_logic;

begin

  -- Instantiate the Unit Under Test (UUT)
   uut: repetitions PORT MAP (textfile=>textfile,reset=>reset,clk=>clk,value=>value,valid=>valid);

   -- Clock process definitions
   Clk_process :process
   begin
        clk <= '0';
        wait for Clk_period/2;
        clk <= '1';
        wait for Clk_period/2;

        if (NOW > 150 ns) then
          wait;
        end if;
   end process;


   -- Stimulus process
  process
    variable err_flag : boolean := false;
    File INFILE: text open read_mode is "/home/cs254/Desktop/repetitions/TRACEFILE.txt";
    --FILE OUTFILE: text  open write_mode is "/home/cs254/Desktop/words/OUTPUT.txt";

    -- bit-vectors are read from the file.
    variable input_vector_var: bit_vector (number_of_inputs-1 downto 0);
    --variable output_vector_var: bit_vector (number_of_outputs-1 downto 0);
    --variable output_mask_var: bit_vector (number_of_outputs-1 downto 0);

    -- for comparison of output with expected-output
    --variable output_comp_var: std_logic_vector (number_of_outputs-1 downto 0);
    --constant ZZZZ : std_logic_vector(number_of_outputs-1 downto 0) := (others => '0');

    -- for read/write.
    variable INPUT_LINE: Line;
    variable OUTPUT_LINE: Line;
    variable LINE_COUNT: integer := 0;

    
  begin
    wait until rising_edge(clk);
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
    while not endfile(INFILE) loop 
	  -- will read a new line every 5ns, apply input,
	  -- wait for 1 ns for circuit to settle.
	  -- read output.


          LINE_COUNT := LINE_COUNT + 1;


	  -- read input at current time.
	  readLine (INFILE, INPUT_LINE);
          read (INPUT_LINE, input_vector_var);
          --read (INPUT_LINE, output_vector_var);
          --read (INPUT_LINE, output_mask_var);
	
	  -- apply input.
          textfile <= to_std_logic_vector(input_vector_var);
          

	  -- wait for the circuit to settle 
	  wait for 20 ns;

	  -- check output.
          --output_comp_var := (to_std_logic_vector(output_mask_var) and 
					--(output_vector xor to_std_logic_vector(output_vector_var)));
	  --if (output_comp_var  /= ZZZZ) then
             --write(OUTPUT_LINE,to_string("ERROR: line "));
             --write(OUTPUT_LINE, LINE_COUNT);
             --writeline(OUTFILE, OUTPUT_LINE);
             --err_flag := true;
          --end if;

          --write(OUTPUT_LINE, to_bit_vector(input_vector));
          --write(OUTPUT_LINE, to_string(" "));
          --write(OUTPUT_LINE, to_bit_vector(value));
          --writeline(OUTFILE, OUTPUT_LINE);

	  -- advance time by 4 ns.
	  wait for 4 ns;
    end loop;

    --assert (err_flag) report "SUCCESS, all tests passed." severity note;
    --assert (not err_flag) report "FAILURE, some tests failed." severity error;

    wait;
  end process;

  --dut_instance: upcounter 
     	--port map(input_vector(1), input_vector(0) ,output_vector(4), output_vector(3 downto 0));

end Behave;
