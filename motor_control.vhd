library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity motor_control is
   Port ( 
		duty 		: in  STD_LOGIC_VECTOR (6 downto 0);
      reset 	: in  STD_LOGIC;
      sensor 	: in  STD_LOGIC;
      clk 		: in  STD_LOGIC;
      motor 	: out  STD_LOGIC
	);
end motor_control;

architecture Behavioral of motor_control is
	component motor_clk
		Port (
			clk 		: in  STD_LOGIC;
         reset 	: in  STD_LOGIC;
         clk_out 	: out  STD_LOGIC
		);
	end component;
	
	component motor_pwm
		Port ( 
			duty 	: in  STD_LOGIC_VECTOR (6 downto 0);
         reset : in  STD_LOGIC;
         clk 	: in  STD_LOGIC;
         motor : out  STD_LOGIC
		);
	end component;
	
	signal clk_out : STD_LOGIC := '0';
	signal motor_enabled_clk : STD_LOGIC := '0';
	
begin
	motor_clk_map: motor_clk 
		Port map(clk, reset, clk_out);
	
	motor_enabled_clk <= clk_out and not(sensor);

	motor_pwm_map: motor_pwm 
		Port map(duty, reset, motor_enabled_clk, motor);
end Behavioral;

