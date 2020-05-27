library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity conveyor_belt is
   Port ( 
		sel 		: in STD_LOGIC_VECTOR (1 downto 0);
      reset 	: in STD_LOGIC;
      sensor 	: in STD_LOGIC;
      clk 		: in STD_LOGIC;
      motor 	: out STD_LOGIC
	);
end conveyor_belt;

architecture Behavioral of conveyor_belt is
	component motor_control
		Port ( 
			duty 		: in STD_LOGIC_VECTOR (6 downto 0);
			reset 	: in STD_LOGIC;
			sensor 	: in STD_LOGIC;
			clk 		: in STD_LOGIC;
			motor 	: out  STD_LOGIC
		);
	end component;
	
	component speed_selector
		Port (
			sel 	: in STD_LOGIC_VECTOR (1 downto 0);
         duty 	: out STD_LOGIC_VECTOR (6 downto 0));
	end component;
	
	signal selected_speed : STD_LOGIC_VECTOR (6 downto 0);
begin
	speed_selector_map: speed_selector
		Port map(sel, selected_speed);
		
	motor_control_map: motor_control
		Port map(selected_speed, reset, sensor, clk, motor);

end Behavioral;

