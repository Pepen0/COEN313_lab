library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Code is

    port(
        clk: in std_logic;
        reset: in std_logic;
        in1: in std_logic;
        in2: in std_logic;
        out1: out std_logic
    );

end Code;

architecture true_outputs of Code is

    component Ajuster is

        port(
            clk: in std_logic;
            reset: in std_logic;
            in1: in std_logic;
            in2: in std_logic;
            curent_register: in std_logic_vector(7 downto 0);
            Next_register: out std_logic_vector(7 downto 0)
        );
    end component;

    component Comparater is

        port(
            clk: in std_logic;
            in1: in std_logic_vector(7 downto 0);
            in2: in std_logic_vector(7 downto 0);
            out1: out std_logic
        );
    end component;

    component registers is
        port(
            clk: in std_logic;
            reset: in std_logic;
            din: in std_logic_vector(7 downto 0);
            dout: out std_logic_vector(7 downto 0)
        );
    end component;

    signal curent_register: std_logic_vector(7 downto 0):= "00000000";
    signal Next_register: std_logic_vector(7 downto 0):= "00000000";
    signal max_occupancy: std_logic_vector(7 downto 0) := "00111111";
    signal max_register_out: std_logic_vector(7 downto 0) := "00000000";


    for all: registers use entity work.registers(true_outputs);
    for Ajuster1 : Ajuster use entity work.Ajuster(true_outputs);
    for Comparater1 : Comparater use entity work.Comparater(true_outputs);

begin

    register_current_occupancy : registers port map(
        clk => clk,
        reset => reset,
        din => Next_register,
        dout => curent_register
    );

    register_max_occupancy : registers port map(
        clk => clk,
        reset => reset,
        din => max_occupancy,
        dout => max_register_out
    );

    Ajuster1 : Ajuster port map(
        clk => clk,
        reset => reset,
        in1 => in1,
        in2 => in2,
        curent_register => curent_register,
        Next_register => Next_register
    );

    Comparater1 : Comparater port map(
        clk => clk,
        in1 => curent_register,
        in2 => max_register_out,
        out1 => out1
    );

end true_outputs;
