library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity test is
    port (
        in1 : in std_logic_vector(2 downto 0);
        in2 : in std_logic_vector(2 downto 0);
        sel : in std_logic;
        out1 : out std_logic_vector(2 downto 0)
    );
end entity;

architecture true_outputs of test is
begin
    process(in1, in2, sel)
    begin
        if sel = '0' then
            out1(2 downto 0) <= in1(2 downto 0);
        else
            out1(2 downto 0) <= in2(2 downto 0);
        end if;
    end process;
end architecture;