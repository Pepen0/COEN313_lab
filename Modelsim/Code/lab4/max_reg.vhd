library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity max_reg is
port( din   : in std_logic_vector(3 downto 0);
      clk   : in std_logic;
      reset  : in  std_logic;
      maxout : out std_logic_vector(3 downto 0)
      );
end max_reg;

architecture true_outputs of max_reg is

begin
    process(clk, reset)
        begin
            if reset = '1' then
                maxout <= (others => '0');
            elsif rising_edge(clk) then
                if din > maxout then
                    maxout <= din;
                end if;
            end if;
    end process;
end true_outputs;