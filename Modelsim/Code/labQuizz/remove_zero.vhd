--penoelo Thibeaud 40212017 FK-X

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity remove_zero  is
port( in_reg   : in std_logic_vector(2 downto 0);
      clk   : in std_logic;
      Z_reg : out std_logic_vector( 2 downto 0)
      );
end remove_zero;

architecture true_outputs of remove_zero is
      begin 
      process (clk,in_reg)
            begin
            if rising_edge(clk) then

		if in_reg = "001" then
                        Z_reg <= "100";

		else if in_reg = "010" then
                        Z_reg <= "100";

		else if in_reg = "011" then
                        Z_reg <= "110";

		else
                        Z_reg <= in_reg;

                end if;
                end if;
		end if;
		end if;
        end process;
end true_outputs;
