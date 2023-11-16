library ieee;
use ieee.std_logic_1164.all;

entity 3binverter is
    port (
        in1 : in std_logic_vector(2 downto 0);
        out1 : out std_logic_vector(2 downto 0)
    );
end entity;

architecture true_outputs of 3binverter is
begin
    out1(2 downto 0) <= not in1(2 downto 0);
end architecture;
