library ieee;
use ieee.std_logic_1164.all;


entity OR_GATE is
    port ( ina, inb, inc :   in std_logic;
           output : out std_logic);
end OR_GATE;

architecture true_outputs of OR_GATE is
begin
  output <=  (ina or inb or inc);

end true_outputs;

  
