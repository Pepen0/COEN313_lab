--penoelo Thibeaud 40212017 FK-X

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity reg_normalizer is
port( din   : in std_logic_vector(2 downto 0);
      clk   : in std_logic;
      normal   : in std_logic;
      regout   : out std_logic_vector(2 downto 0)
      );
end reg_normalizer ;


architecture true_outputs of reg_normalizer is

component registers is
port( din   : in std_logic_vector(2 downto 0);
      clk   : in std_logic;
      reg_out : out std_logic_vector(2 downto 0)
      );
end component;

component tbMUX is
port( din_reg   : in std_logic_vector(2 downto 0);
      post_mod_reg   : in std_logic_vector(2 downto 0);
      normaliser   : in std_logic;
      muxout : out std_logic_vector(2 downto 0)
      );
end component;

component remove_zero  is
port( in_reg   : in std_logic_vector(2 downto 0);
      clk   : in std_logic;
      Z_reg : out std_logic_vector(2 downto 0)
      );
end component;



signal Mux_reg_out, No_leading_zero : std_logic_vector(2 downto 0);

for register0 : registers use entity work.registers(true_outputs);
for mux : tbMUX use entity work.tbMUX(true_outputs);
for remove_leading_zero : remove_zero use entity work.remove_zero(true_outputs);

begin

register0 : registers port map(din => Mux_reg_out, clk => clk ,reg_out => regout);

mux : tbMUX port map(din_reg => din, post_mod_reg => No_leading_zero, normaliser => normal, muxout => Mux_reg_out);

remove_leading_zero : remove_zero port map(in_reg => Mux_reg_out, clk => clk , Z_reg => No_leading_zero );



end architecture;
