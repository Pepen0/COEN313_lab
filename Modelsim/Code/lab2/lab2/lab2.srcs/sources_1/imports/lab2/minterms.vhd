library ieee;
use ieee.std_logic_1164.all;

entity minterms is
    Port (A, B, C : in std_logic; 
    outputer : out std_logic);     
end minterms;

architecture lab2Code of minterms is 
   

    component AND_GATE
        Port (ina, inb, inc : in std_logic; 
        output : out std_logic);
    end component;

    component OR_GATE
        Port (ina, inb, inc : in std_logic; 
        output : out std_logic);
    end component;

signal notA, notB, notC, andGateOut1, andGateOut2, andGateOut3 : std_logic;

for Step_a, Step_b, Step_c : AND_GATE use entity WORK.AND_GATE(true_outputs);
for Step_d : OR_GATE use entity WORK.OR_GATE(true_outputs);


begin

    notA <= not A;
    notB <= not B; 


  
    Step_a: AND_GATE port map (ina => notA, inb => notB, inc => C , output => andGateOut1);
    Step_b: AND_GATE port map (ina => notA, inb => B, inc => C , output => andGateOut2);
    Step_c: AND_GATE port map (ina => A, inb => B, inc => C , output => andGateOut3);
    Step_d: OR_GATE  port map (ina => andGateOut1, inb => andGateOut2,inc => andGateOut3 , output => outputer);

end lab2Code;

