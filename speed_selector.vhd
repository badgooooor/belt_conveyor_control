library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity speed_selector is
    Port ( sel : in  STD_LOGIC_VECTOR (1 downto 0);
           duty : out  STD_LOGIC_VECTOR (6 downto 0));
end speed_selector;

architecture Behavioral of speed_selector is

begin
	process (sel) begin
		case sel is
			when "00" => duty <= "0010100";
			when "01" => duty <= "0101000";
			when "10" => duty <= "0111100";
			when "11" => duty <= "1010000";
			when others => duty <= "XXXXXXX";
		end case;
	end process;

end Behavioral;

