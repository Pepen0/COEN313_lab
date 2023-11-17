entity 3bpadder is
    port (
        in1 : in std_logic_vector(2 downto 0);
        out1 : out std_logic_vector(2 downto 0)
    );
end entity;

architecture behavioral of 3bpadder is
begin
    process(in1)
        variable carry : std_logic := '0';
    begin
        for i in 0 to 2 loop
            carry := (in1(i) and out1(i)) or (in1(i) and carry) or (out1(i) and carry);
            out1(i) <= in1(i) xor out1(i) xor carry;
        end loop;
    end process;
end architecture;
