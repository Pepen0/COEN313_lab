library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity 3bpadder is
    port (
        in1 : in std_logic_vector(2 downto 0);
        out1 : out std_logic_vector(2 downto 0)
    );
end entity;

architecture behavioral of 3bpadder is
    signal temp_out : std_logic_vector(2 downto 0); -- Convert variable to signal
begin
    process(in1)
        variable carry : std_logic := '0';
    begin
        for i in 0 to 2 loop
            carry := (in1(i) and temp_out(i)) or (in1(i) and carry) or (temp_out(i) and carry);
            temp_out(i) := in1(i) xor temp_out(i) xor carry;
        end loop;
    end process;
    
    out1 <= temp_out; -- Assign signal to out1
end architecture;