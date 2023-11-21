library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity max_reg is
port( din   : in std_logic_vector(3 downto 0);
      clk   : in std_logic;
      maxout : out std_logic_vector(3 downto 0)
      );
end max_reg;

architecture true_outputs of max_reg is
	signal maxout_reg : std_logic_vector(3 downto 0):="1000";
begin
    process(clk)
        begin
            if rising_edge(clk) then
                if unsigned(din) > unsigned(maxout_reg) then
                    maxout_reg <= din;
                end if;
            end if;
    end process;
	maxout <= maxout_reg;
end true_outputs;
