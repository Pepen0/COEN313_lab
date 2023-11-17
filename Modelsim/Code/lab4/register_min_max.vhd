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
      maxout : out std_logic_vector(3 downto 0)
      );
end component;

component min_reg is
port( din   : in std_logic_vector(3 downto 0);
      minout : out std_logic_vector(3 downto 0)
      );
end component;

signal r0, r1, r2, r3, min_comb, max_comb : std_logic_vector(3 downto 0);

for all : registers use entity work.registers(true_outputs);
for all : fbMUX use entity work.fbMUX(true_outputs);
for all : max_reg use entity work.max_reg(true_outputs);
for all : min_reg use entity work.min_reg(true_outputs);
for all : minMaxComb use entity work.minMaxComb(true_outputs);

begin

reister0 : registers port map(din => din, reset => reset , clk => clk ,reg_out => r0);

end architecture;
