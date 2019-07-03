-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity comp4bit is port(
	a, b : in std_logic_vector(3 downto 0);
    agtbin, aeqbin, altbtin : in std_logic;
    agtbout, aeqbout, altbtout : out std_logic);
end comp4bit;

architecture rtl of comp4bit is
signal agtbin_vec, aeqbin_vec, altbtin_vec : std_logic_vector(3 downto 0);
signal agtbout_vec, aeqbout_vec, altbtout_vec : std_logic_vector(3 downto 0);
begin

    agtbin_vec <= agtbin & agtbout_vec(3 downto 1);
    aeqbin_vec <= aeqbin & aeqbout_vec(3 downto 1);
    altbtin_vec <= altbtin & altbtout_vec(3 downto 1);

    GEN_COMP:for I in 3 downto 0 generate
        compx : entity work.comp1bit port map
            (a(3-I), b(3-I),
            agtbin_vec(I), aeqbin_vec(I), altbtin_vec(I),
            agtbout_vec(I), aeqbout_vec(I), altbtout_vec(I));
    end generate GEN_COMP;

    agtbout <= agtbout_vec(0);
    aeqbout <= aeqbout_vec(0);
    altbtout <= altbtout_vec(0);
end rtl;
