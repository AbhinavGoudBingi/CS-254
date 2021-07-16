library ieee;
use ieee.std_logic_1164.all;
entity repetitions is
	port(textfile: std_logic_vector(119 downto 0); reset, clk: in std_logic; value: out std_logic_vector(3 downto 0); valid: out std_logic);
end entity;

architecture arc of repetitions is

component comparator is
port(A:IN std_logic_vector;B:IN std_logic_vector;C:OUT std_logic);
end component;

	Type statetype is (state0, state1, state2, state3, state4, state5, state6, state7, state8, state9, state10, state11, state12, state13, state14, state15);
	signal state, next_state: statetype;
	signal temp1: std_logic_vector(7 downto 0);
        signal temp2: std_logic_vector(7 downto 0);
        shared variable i : integer := -1;
		  shared variable j : integer := -1;
        signal equal:std_logic;
	
	function statedecode (s: statetype)
		return std_logic_vector is variable statebit: std_logic_vector(3 downto 0);
	begin
		statebit := "0000";
		if s = state1 then
			statebit := "0001";
                elsif s = state2 then
			statebit := "0010";
                elsif s = state3 then
			statebit := "0011";
                elsif s = state4 then
			statebit := "0100";
                elsif s = state5 then
			statebit := "0101";
                elsif s = state6 then
			statebit := "0110";
                elsif s = state7 then
			statebit := "0111";
                elsif s = state8 then
			statebit := "1000";
                elsif s = state9 then
			statebit := "1001";
                elsif s = state10 then
			statebit := "1010";
                elsif s = state11 then
			statebit := "1011";
                elsif s = state12 then
			statebit := "1100";
                elsif s = state13 then
			statebit := "1101";
                elsif s = state14 then
			statebit := "1110";
                elsif s = state15 then
			statebit := "1111";
		end if;
		return statebit;
	end function;

begin	
	-- Memory logic
	p1: process (textfile,clk,reset)
	begin
		if (reset = '1') then
		                  i := -1;
			state <= state0;
		elsif (clk'event and clk = '1') then
                        --temp <= textfile(8*i+7 downto 8*i);
                        j := i;
                        i := i+1;
			state <= next_state;
                        --temp1 <= textfile(8*i+7 downto 8*i);
                        
		end if;
                if (i = -1) then
                temp1 <= textfile(7 downto 0);
                else
                temp1 <= textfile(8*i+7 downto 8*i);
                end if;
                if (i >= 1) then
                temp2 <= textfile(8*j+7 downto 8*j);
                else
                temp2 <= textfile(7 downto 0);
                end if;
	end process;	
        
        check1: comparator port map(A=>temp1,B=>temp2,C=>equal);
	--Next state logic
	p2: process(state, equal)
	begin
	next_state <= state0;
              if (equal = '1' and i <= 14 and i > 0) then 
		case state is
			when state0 =>
				next_state <= state1;
                        when state1 =>
				next_state <= state2;
                        when state2 =>
				next_state <= state3;
                        when state3 =>
				next_state <= state4;
                        when state4 =>
				next_state <= state5;
                        when state5 =>
				next_state <= state6;
                        when state6 =>
				next_state <= state7;
                        when state7 =>
				next_state <= state8;
                        when state8 =>
				next_state <= state9;
                        when state9 =>
				next_state <= state10;
                        when state10 =>
				next_state <= state11;
                        when state11 =>
				next_state <= state12;
                        when state12 =>
				next_state <= state13;
                        when state13 =>
				next_state <= state14;
                        when state14 =>
				next_state <= state15;
                        when state15 =>
				next_state <= state;
		end case;
             elsif (i = 0) then
                    next_state <= state;
             elsif (i <= 14) then
                next_state <= state1;
             end if;
	end process;
		
	--Output logic
        p3: process(equal, state)
        begin
        if (equal = '1' or i = 0) then
	value <= "0000";
        valid <= '0';
        else
        value <= statedecode(state);
        valid <= '1';
        end if;
        end process;
end architecture;

library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator is
port(
	   A:IN std_logic_vector;
		B:IN std_logic_vector;
		C:OUT std_logic
	  );
end comparator;

architecture structure of comparator is

begin
p:process(A,B)
begin
if (A = B) then
	 C <= '1';
else
         C <= '0';
end if;
end process;
end structure;
