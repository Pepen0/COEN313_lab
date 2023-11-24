library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Comparater is
    port(
        clk: in std_logic;
        in1: in std_logic_vector(7 downto 0);
        in2: in std_logic_vector(7 downto 0);
        out1: out std_logic;
    );
end entity Comparater;

architecture true_outputs of Comparater is
    begin
        process(clk)
            begin
                if rising_edge(clk) then
                    if in1 > in2 then
                        out1 <= '1';
                    else
                        out1 <= '0';
                    end if;
                end if;
        end process;
end architecture true_outputs;
```