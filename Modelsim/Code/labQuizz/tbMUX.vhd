--penoelo Thibeaud 40212017 FK-X

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity tbMUX is
port( din_reg   : in std_logic_vector(2 downto 0);
      post_mod_reg   : in std_logic_vector(2 downto 0);
      normaliser   : in std_logic;
      muxout : out std_logic_vector(2 downto 0)
      );
end tbMUX;

architecture true_outputs of tbMUX is
      begin 
      process (normaliser)
            begin
                  case normaliser is
                  when '0' => muxout <= din_reg;
                  when '1' => muxout <= post_mod_reg;
                  when others => muxout <= "000";
                  end case;
      end process;
end true_outputs;
