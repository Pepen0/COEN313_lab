library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity min_reg is
port( din   : in std_logic_vector(3 downto 0);
      clk   : in std_logic;
      reset  : in  std_logic;
      minout : out std_logic_vector(3 downto 0)
      );
end min_reg;

architecture true_outputs of min_reg is
begin
    process(clk, reset)
        begin
            if reset = '1' then
                minout <= (others => '1');
            elsif rising_edge(clk) then
                if din < minout then
                    minout <= din;
                end if;
            end if;
    end process;
end true_outputs;
