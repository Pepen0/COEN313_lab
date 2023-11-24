library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity registers is
    port(
        clk: in std_logic;
        reset: in std_logic;
        din: in std_logic_vector(7 downto 0);
        dout: out std_logic_vector(7 downto 0)
    );
end registers;

architecture true_outputs of registers is
    signal reg: std_logic_vector(7 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            reg <= (others => '0');
        elsif rising_edge(clk) then
            reg <= din;
        end if;
    end process;
    dout <= reg;
end true_outputs;
