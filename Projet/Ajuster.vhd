library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Ajuster is
    port(
        clk: in std_logic;
        reset: in std_logic;
        in1: in std_logic;
        in2: in std_logic;
        curent_register: in std_logic_vector(7 downto 0);
        Next_register: out std_logic_vector(7 downto 0);
    );
end Ajuster;

architecture true_outputs of Ajuster is
    
begin
    process(clk, reset)
        begin
            if reset = '1' then
                Next_register <= (others => '0');
            elsif rising_edge(clk) then
                if in1 = '1' then
                    Next_register <= curent_register + 1;
                elsif in2 = '1' then
                    Next_register <= curent_register - 1;
                else
                    Next_register <= curent_register;
                end if;
            end if;
    end process;
end true_outputs;
```