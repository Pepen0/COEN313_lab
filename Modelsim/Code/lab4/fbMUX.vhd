library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity fbMUX is
port( reg3   : in std_logic_vector(3 downto 0);
      reg2   : in std_logic_vector(3 downto 0);
      reg1   : in std_logic_vector(3 downto 0);
      reg0   : in std_logic_vector(3 downto 0);
      sel   : in std_logic_vector(1 downto 0);
      muxout : out std_logic_vector(3 downto 0)
      );
end fbMUX;

architecture true_outputs of fbMUX is
      begin 
      process (reg3, reg2, reg1, reg0, sel)
            begin
                  case sel is
                  when "00" => muxout <= reg0;
                  when "01" => muxout <= reg1;
                  when "10" => muxout <= reg2;
                  when "11" => muxout <= reg3;
                  when others => muxout <= "0000";
                  end case;
      end process;
end true_outputs;