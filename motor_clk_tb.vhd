LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY motor_clk_tb IS
END motor_clk_tb;
 
ARCHITECTURE behavior OF motor_clk_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT motor_clk
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         clk_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal clk_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 50 ns;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: motor_clk PORT MAP (
          clk => clk,
          reset => reset,
          clk_out => clk_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      -- insert stimulus here 
		reset <= '1';
		wait for 100 ns;
		reset <= '0';
      wait;
   end process;

END;
