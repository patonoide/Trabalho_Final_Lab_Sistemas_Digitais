library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity nbit_adder is
    Generic(n : integer := 8);
    Port ( a : in STD_LOGIC_VECTOR (n-1 downto 0);
           b : in STD_LOGIC_VECTOR (n-1 downto 0);
           cin : in STD_LOGIC;
           f : out STD_LOGIC_VECTOR (n downto 0)); -- a soma de dois numeros sem sinal (unsigned) 
                                                   -- de n-1 bits da um numero de n bits
end nbit_adder;

architecture Behavioral of nbit_adder is

-- o sinal deve ser inicializado em 0 para não ter erros
signal c_intermediario : std_logic_Vector (n downto 0) := (others=>'0'); 

begin

c_intermediario(0) <= cin;
f(n) <= c_intermediario(n);

for_label : for i in 0 to n-1 generate
    somador: entity work.Adder_1bit port map(
        a        => a(i),
        b        => b(i),
        c_in     => c_intermediario(i),
        s        => f(i),
        c_out    => c_intermediario(i+1));
end generate;


end Behavioral;
