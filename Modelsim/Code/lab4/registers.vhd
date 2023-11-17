library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity registers is
port( din   : in std_logic_vector(3 downto 0);
      reset : in std_logic;
      clk   : in std_logic;
      reg_out : out std_logic_vector(3 downto 0)
      );
end registers ;

architecture true_outputs of registers is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            reg_out <= "1000";
        elsif rising_edge(clk) then
            reg_out <= din;
        end if;
    end process;
end true_outputs;