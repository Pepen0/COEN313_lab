library ieee;
use ieee.std_logic_1164.all;


entity AND_GATE is
    port ( ina, inb, inc :   in std_logic;
           output : out std_logic);
end AND_GATE;

architecture true_outputs of AND_GATE is
begin
  output <=  (ina and inb and inc);

end true_outputs;

  
