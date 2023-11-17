library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity registers_min_max is
port( din   : in std_logic_vector(3 downto 0);
      reset : in std_logic;
      clk   : in std_logic;
      sel   : in std_logic_vector(1 downto 0);
      max_out : out std_logic_vector(3 downto 0);
      min_out : out std_logic_vector(3 downto 0);
      reg_out : out std_logic_vector(3 downto 0)
      );
end registers_min_max ;

architecture true_outputs of registers_min_max is

component registers is
port( din   : in std_logic_vector(3 downto 0);
      reset : in std_logic;
      clk   : in std_logic;
      reg_out : out std_logic_vector(3 downto 0)
      );
end component;

component fbMUX is
port( reg3   : in std_logic_vector(3 downto 0);
      reg2   : in std_logic_vector(3 downto 0);
      reg1   : in std_logic_vector(3 downto 0);
      reg0   : in std_logic_vector(3 downto 0);
      sel   : in std_logic_vector(1 downto 0);
      muxout : out std_logic_vector(3 downto 0)
      );
end component;

component minMaxComb is
port( reg3   : in std_logic_vector(3 downto 0);
      reg2   : in std_logic_vector(3 downto 0);
      reg1   : in std_logic_vector(3 downto 0);
      reg0   : in std_logic_vector(3 downto 0);
      minout : out std_logic_vector(3 downto 0);
      maxout : out std_logic_vector(3 downto 0)
      );
end component;

component max_reg is
port( din   : in std_logic_vector(3 downto 0);
      clk   : in std_logic;
      reset  : in  std_logic;
      maxout : out std_logic_vector(3 downto 0)
      );
end component;

component min_reg is
port( din   : in std_logic_vector(3 downto 0);
      clk   : in std_logic;
      reset  : in  std_logic;
      minout : out std_logic_vector(3 downto 0)
      );
end component;

signal r0, r1, r2, r3, min_comb, max_comb : std_logic_vector(3 downto 0);

for all : registers use entity work.registers(true_outputs);
for mux : fbMUX use entity work.fbMUX(true_outputs);
for Max_led : max_reg use entity work.max_reg(true_outputs);
for Min_led : min_reg use entity work.min_reg(true_outputs);
for Max_Min_comb_logic : minMaxComb use entity work.minMaxComb(true_outputs);

begin

register0 : registers port map(din => din, reset => reset , clk => clk ,reg_out => r0);
register1 : registers port map(din => r0, reset => reset , clk => clk ,reg_out => r1);
register2 : registers port map(din => r1, reset => reset , clk => clk ,reg_out => r2);
register3 : registers port map(din => r2, reset => reset , clk => clk ,reg_out => r3);

mux : fbMUX port map(reg3 => r3, reg2 => r2, reg1 => r1, reg0 => r0, sel => sel, muxout => reg_out);

Max_Min_comb_logic : minMaxComb port map(reg3 => r3, reg2 => r2, reg1 => r1, reg0 => r0, minout => min_comb, maxout => max_comb);

Max_led : max_reg port map(din => max_comb, clk => clk, reset => reset, maxout => max_out);                 
Min_led : min_reg port map(din => min_comb, clk => clk, reset => reset, minout => min_out);


end architecture;
