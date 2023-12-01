--penoelo Thibeaud 40212017 FK-X


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity registers is
port( din   : in std_logic_vector(2 downto 0);
      clk   : in std_logic;
      reg_out : out std_logic_vector(2 downto 0)
      );
end registers;

architecture true_outputs of registers is
    signal reg: std_logic_vector(2 downto 0):="000";
begin
    process(clk)
    begin
        if rising_edge(clk) then
            reg <= din;
        end if;
    end process;
    reg_out <= reg;
end true_outputs;
