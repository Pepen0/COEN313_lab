library ieee;
use ieee.std_logic_1164.all;


entity OR_GATE is
    port ( in1, in2, in3 :   in std_logic;
           output : out std_logic);
end OR_GATE;

architecture true_outputs of OR_GATE is
begin
  output <=  (in1 or in2 or in3);

end true_outputs;

  
