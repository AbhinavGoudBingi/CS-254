library ieee;
use ieee.std_logic_1164.all;
entity upcounter is
	port(reset, clk: in std_logic; done: out std_logic; value: out std_logic_vector(3 downto 0));
end entity;

architecture arc of upcounter is
	Type statetype is (state0, state1, state2, state3, state4, state5, state6, state7, state8, state9, state10, state11, state12, state13, state14, state15);
	signal state, next_state: statetype;
	signal temp: std_logic_vector(3 downto 0);
	
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
	p1: process (clk,reset)
	begin
		if (reset = '1') then
			state <= state0;
		elsif (clk'event and clk = '1') then
			state <= next_state;
		end if;
	end process;	

	--Next state logic
	p2: process(state)
	begin
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
				next_state <= state0;
		end case;
	end process;
		
	--Output logic
	value <= statedecode(state);
	temp <= statedecode(state);
        p3: process(temp)
        begin
        	if (temp = "1111") then
                	done <= '1';
        	else
                	done <= '0';
        	end if;
        end process;
end architecture;
