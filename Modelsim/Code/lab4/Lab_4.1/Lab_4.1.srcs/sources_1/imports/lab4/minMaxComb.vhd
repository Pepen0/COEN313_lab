library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity minMaxComb is
port( reg3   : in std_logic_vector(3 downto 0);
      reg2   : in std_logic_vector(3 downto 0);
      reg1   : in std_logic_vector(3 downto 0);
      reg0   : in std_logic_vector(3 downto 0);
      minout : out std_logic_vector(3 downto 0);
      maxout : out std_logic_vector(3 downto 0)
      );
end minMaxComb;

architecture true_outputs of minMaxComb is
    begin
        minout <= reg0 when reg0 < reg1 and reg0 < reg2 and reg0 < reg3 else
                reg1 when reg1 < reg0 and reg1 < reg2 and reg1 < reg3 else
                reg2 when reg2 < reg0 and reg2 < reg1 and reg2 < reg3 else
                reg3;

        maxout <= reg0 when reg0 > reg1 and reg0 > reg2 and reg0 > reg3 else
                reg1 when reg1 > reg0 and reg1 > reg2 and reg1 > reg3 else
                reg2 when reg2 > reg0 and reg2 > reg1 and reg2 > reg3 else
                reg3;
end true_outputs;
