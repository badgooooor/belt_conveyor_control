library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity motor_pwm is
    Port ( duty : in  STD_LOGIC_VECTOR (6 downto 0);
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           motor : out  STD_LOGIC);
end motor_pwm;

architecture Behavioral of motor_pwm is
	signal cnt  : unsigned(10 downto 0);
	signal pwmi : unsigned(10 downto 0);
begin
	pwmi <= resize(unsigned('0' & duty) * 10, 11); -- Scale 6 bit to equivalent size to duty cycle.
	-- Counter process
	counter: process(reset, clk) begin
		if (reset = '1') then
			cnt <= (others => '0');
		elsif rising_edge(clk) then
			if (cnt = 1279) then
				cnt <= (others => '0');
			else
				cnt <= cnt + 1;
			end if;
		end if;
	end process;

	-- Output signal for servomotor.
	motor <= '1' when (cnt < pwmi) else '0';
end Behavioral;

