LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Code_tb IS

BEGIN

END Code_tb;

ARCHITECTURE true_outputs OF Code_tb IS

    CONSTANT max_simulation_time : TIME := 1500 ns;
    CONSTANT clk_period          : TIME := 10 ns;

    COMPONENT Code IS
        PORT(
            clk: IN std_logic;
            reset: IN std_logic;
            in1: IN std_logic;
            in2: IN std_logic;
            out1: OUT std_logic
        );
    END COMPONENT;

    SIGNAL my_clk, my_reset, in1, in2: STD_LOGIC;
    SIGNAL out1: STD_LOGIC;

    -- Component specification
    FOR Code_inst: Code USE ENTITY WORK.Code(true_outputs);

BEGIN

    clk_gen: PROCESS
        VARIABLE sim_time: TIME;
        BEGIN
            sim_time := 0 ns;
            WHILE sim_time <= max_simulation_time LOOP
                my_clk <= '0';
                WAIT FOR clk_period / 2;
                my_clk <= '1';
                WAIT FOR clk_period / 2;
                sim_time := sim_time + clk_period;
            END LOOP;
        WAIT;
    END PROCESS;

    Code_inst: Code PORT MAP (
        clk => my_clk, 
        reset => my_reset, 
        in1 => in1, 
        in2 => in2, 
        out1 => out1
    );

    gen_stimuli: PROCESS
    BEGIN
        -- Reset to make sure everythin is assigned teh 0 value
        WAIT UNTIL my_clk'event AND my_clk = '0';
        my_reset <= '1';
        WAIT UNTIL my_clk'event AND my_clk = '0';
        my_reset <= '0';

        -- Simulate entry ( X signal)
        WAIT UNTIL my_clk'event AND my_clk = '0';
        in1 <= '1'; -- Person enters for the first time
        WAIT UNTIL my_clk'event AND my_clk = '0';
        in1 <= '0';

        -- Simulate exit ( Y signal)
        WAIT UNTIL my_clk'event AND my_clk = '0';
        in2 <= '1'; -- Person exits for the first time 
        WAIT UNTIL my_clk'event AND my_clk = '0';
        in2 <= '0';

        -- Simulate multiple 70 entries to test occupancy limit
        FOR i IN 1 TO 70 LOOP
            WAIT UNTIL my_clk'event AND my_clk = '0';
            in1 <= '1';
            WAIT UNTIL my_clk'event AND my_clk = '0';
            in1 <= '0';
        END LOOP;

        -- Reset after reaching occupancy limit
        WAIT UNTIL my_clk'event AND my_clk = '0';
        my_reset <= '1';
        WAIT UNTIL my_clk'event AND my_clk = '0';
        my_reset <= '0';

        WAIT; -- End of simulation
    END PROCESS;

END true_outputs;
