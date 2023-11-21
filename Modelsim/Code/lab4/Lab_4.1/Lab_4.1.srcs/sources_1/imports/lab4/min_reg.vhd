library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity min_reg is
port( din   : in std_logic_vector(3 downto 0);
      clk   : in std_logic;
      minout : out std_logic_vector(3 downto 0)
      );
end min_reg;

architecture true_outputs of min_reg is
	signal minout_reg : std_logic_vector(3 downto 0):="1000";
begin
    process(clk)
        begin
            if rising_edge(clk) then
                if unsigned(din) < unsigned(minout_reg) then
                    minout_reg <= din;
                end if;
            end if;
    end process;
	minout <=minout_reg;
end true_outputs;
