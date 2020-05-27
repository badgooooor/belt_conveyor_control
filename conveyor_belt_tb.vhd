LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY conveyor_belt_tb IS
END conveyor_belt_tb;
 
ARCHITECTURE behavior OF conveyor_belt_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT conveyor_belt
    PORT(
         sel : IN  std_logic_vector(1 downto 0);
         reset : IN  std_logic;
         sensor : IN  std_logic;
         clk : IN  std_logic;
         motor : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic_vector(1 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal sensor : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal motor : std_logic;

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: conveyor_belt PORT MAP (
          sel => sel,
          reset => reset,
          sensor => sensor,
          clk => clk,
          motor => motor
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
		reset <= '1';
		wait for 100 ns;
		reset <= '0';
		
      -- insert stimulus here
		sensor <= '0';
		sel <= "00";
		wait for 20 ms;
		
		sel <= "01";
		wait for 20 ms;
		
		sel <= "10";
		wait for 20 ms;
		
		sel <= "11";
		wait for 20 ms;
		sensor <= '1';					-- trigger sensor
		wait for 20 ms;
		
		sensor <= '0';
		wait for 20 ms;
		-- set back to default value;
		wait for 20 ms;
		sel <= "01";
      wait;
   end process;

END;
