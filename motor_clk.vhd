library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity motor_clk is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end motor_clk;

architecture Behavioral of motor_clk is
	signal temporal: STD_LOGIC;
	signal counter: integer range 0 to 156 := 0;
	
begin
	freq_divider: process (reset, clk) begin
		if (reset = '1') then
			temporal <= '0';
			counter <= 0;
		elsif rising_edge(clk) then
			if (counter = 156) then
				temporal <= not(temporal);
				counter <= 0;
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;
	
	clk_out <= temporal;
end Behavioral;

