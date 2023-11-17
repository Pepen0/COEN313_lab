library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tbinverter is
    port (
        in1 : in std_logic_vector(2 downto 0);
        out1 : out std_logic_vector(2 downto 0)
    );
end entity;

architecture true_outputs of tbinverter is
begin
    out1(2 downto 0) <= not in1(2 downto 0);
end architecture;
