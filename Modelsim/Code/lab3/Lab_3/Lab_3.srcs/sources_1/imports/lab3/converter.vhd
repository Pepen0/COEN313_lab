library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- declare the entity
entity converter is
    port (
       sign_mad : in std_logic_vector(3 downto 0);
       twos_comp : out std_logic_vector(3 downto 0)
    );
end entity; 

-- declare the architecture
architecture rtl of converter is

-- declare the components
component tbinverter
    port (
        in1 : in std_logic_vector(2 downto 0);
        out1 : out std_logic_vector(2 downto 0)
    );
end component;

component tbpadder
    port (
        in1 : in std_logic_vector(2 downto 0);
        out1 : out std_logic_vector(2 downto 0)
    );
end component;

component tbMUX
    port (
        in1 : in std_logic_vector(2 downto 0);
        in2 : in std_logic_vector(2 downto 0);
        sel : in std_logic;
        out1 : out std_logic_vector(2 downto 0)
    );
end component;

-- declare the signals
signal output_inv : std_logic_vector(2 downto 0);
signal output_mux : std_logic_vector(2 downto 0);
signal output_padder : std_logic_vector(2 downto 0);

for invert : tbinverter use entity work.tbinverter(true_outputs);
for padder : tbpadder use entity work.tbpadder(true_outputs);
for mux : tbMUX use entity work.tbMUX(true_outputs);

-- begin the architecture
begin

-- instantiate the components
invert : tbinverter port map (in1 => sign_mad(2 downto 0), out1 => output_inv(2 downto 0));
padder : tbpadder port map (in1 => output_inv(2 downto 0), out1 => output_padder(2 downto 0));
mux : tbMUX port map (in1 => sign_mad(2 downto 0), in2 => output_padder(2 downto 0), sel => sign_mad(3), out1 => output_mux(2 downto 0));

-- assign the output
twos_comp <= sign_mad(3) & output_mux(2 downto 0);

end architecture;
