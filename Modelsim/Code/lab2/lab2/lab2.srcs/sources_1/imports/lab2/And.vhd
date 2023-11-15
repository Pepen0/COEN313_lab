library ieee;
use ieee.std_logic_1164.all;


entity AND_GATE is
    port ( in1, in2, in3 :   in std_logic;
           output : out std_logic);
end AND_GATE;

architecture true_outputs of AND_GATE is
begin
  output <=  (in1 and in2 and in3);

end true_outputs;

  
