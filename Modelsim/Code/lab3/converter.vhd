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
component 3binverter
    port (
        in1 : in std_logic_vector(2 downto 0);
        out1 : out std_logic_vector(2 downto 0)
    );
end component;

component 3bMUX
    port (
        in1 : in std_logic_vector(2 downto 0);
        in2 : in std_logic_vector(2 downto 0);
        sel : in std_logic;
        out1 : out std_logic_vector(2 downto 0)
    );
end component;

component 3bpadder
    port (
        in1 : in std_logic_vector(2 downto 0);
        out1 : out std_logic_vector(2 downto 0)
    );
end component;

-- declare the signals
signal output_inv : std_logic_vector(2 downto 0);
signal output_mux : std_logic_vector(2 downto 0);
signal output_padder : std_logic_vector(2 downto 0);

for invert : 3binverter use entity work.3binverter(true_outputs);
for mux : 3bMUX use entity work.3bMUX(true_outputs);
for padder : 3bpadder use entity work.3bpadder(true_outputs);

-- begin the architecture
begin

-- instantiate the components
invert : 3binverter port map (in1 => sign_mad(2 downto 0), out1 => output_inv(2 downto 0));
padder : 3bpadder port map (in1 => output_inv(2 downto 0), out1 => output_padder(2 downto 0));
mux : 3bMUX port map (in1 => "000", in2 => output_padder(2 downto 0), sel => sign_mad(3), out1 => output_mux(2 downto 0));

-- assign the output
twos_comp <= sign_mad(3) & output_mux(2 downto 0);

end architecture;