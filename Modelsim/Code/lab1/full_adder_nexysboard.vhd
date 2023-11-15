library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
  port(carry_in, input1, input2 : in std_logic;
       sum_out, carry_out : out std_logic);
end full_adder;

architecture structural of full_adder is

-- declare a half-adder component

component half_adder
  port ( in1, in2 :   in std_logic;
         carry, sum : out std_logic);
end component;

-- declare internal signals used to "hook up" components
-- and to communicate to the display decoder process

signal carry1, carry2     : std_logic;
signal sum_int            : std_logic;

-- declare configuration specification
-- NOTE: we want to use the half adder with true outputs
-- not the inverted ones we synthesized earlier!!

for ha1, ha2 : half_adder use entity WORK.half_adder(true_outputs);

begin

-- component instantiation

ha1: half_adder port map(in1 => input1, in2 => input2,
                         carry => carry1, sum => sum_int);

ha2: half_adder port map(in1 => sum_int, in2 => carry_in,
                         carry => carry2, sum => sum_out);

carry_out <= carry1 or carry2;


-- Nexys boards has active high LED outputs
-- so no need to negate top level output ports




end structural;
  


