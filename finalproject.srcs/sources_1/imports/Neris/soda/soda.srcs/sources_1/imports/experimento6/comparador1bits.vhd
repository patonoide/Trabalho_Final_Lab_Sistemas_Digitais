-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity comp1bit is port(
	a, b : in std_logic;
    agtbin, aeqbin, altbin : in std_logic;
    agtbout, aeqbout, altbout : out std_logic);
end comp1bit;

architecture rtl of comp1bit is
signal eq : std_logic;
begin

    eq <= not (a xor b);
    agtbout <= (a and not (b)) or (eq and agtbin);
    aeqbout <= eq and aeqbin;
    altbout <= (not (a) and b) or (eq and altbin);
end rtl;
