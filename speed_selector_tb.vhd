LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY speed_selector_tb IS
END speed_selector_tb;
 
ARCHITECTURE behavior OF speed_selector_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT speed_selector
    PORT(
         sel : IN  std_logic_vector(1 downto 0);
         duty : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal duty : std_logic_vector(6 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: speed_selector PORT MAP (
          sel => sel,
          duty => duty
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      -- insert stimulus here 
		sel <= "00";
		wait for 100 ns;
		
		sel <= "01";
		wait for 100 ns;
		
		sel <= "10";
		wait for 100 ns;
		
		sel <= "11";
		wait for 100 ns;
      wait;
   end process;

END;
