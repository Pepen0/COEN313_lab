library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tbpadder is
    port (
        in1 : in std_logic_vector(2 downto 0);
        out1 : out std_logic_vector(2 downto 0)
    );
end entity;

architecture true_outputs of tbpadder is
    signal out0 : std_logic_vector(2 downto 0) := "001";
begin
    
	out1 <= in1 +out0;
      
end architecture;
