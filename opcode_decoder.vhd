library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity opcode_decoder is
    Port ( deco_in : in STD_LOGIC_VECTOR (3 downto 0);
           deco_out : out STD_LOGIC_VECTOR (6 downto 0));
end opcode_decoder;

architecture Behavioral of opcode_decoder is

begin
    with deco_in select 
        deco_out <= "0000000" when "0000",
                    "1000000" when "0001",
                    "0000000" when "0010",
                    "0100000" when "0011",
                    "1000000" when "0100",
                    "1000000" when "0101",
                    "0100000" when "0110",
                    "0100000" when "0111",
                    "1000000" when "1000",
                    "0100000" when "1001",
                    "1000000" when "1010",
                    "0100011" when "1011",
                    "0100000" when "1100",
                    "0110100" when "1101",
                    "1000000" when "1110",
                    "0101011" when "1111",
                    "0000000" when others;
end Behavioral;
