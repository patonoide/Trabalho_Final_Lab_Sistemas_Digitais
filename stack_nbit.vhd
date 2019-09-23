library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity stack_nbit is 
generic( n : integer := 8);
port (
    clk, clr: in STD_LOGIC;
    S : in std_logic_vector(1 downto 0);
    A : in std_logic_vector(n-1 downto 0);
    P : out std_logic_vector(n-1 downto 0)
);
end stack_nbit;

architecture Behavioral of stack_nbit is

subtype Q_word is std_logic_vector(n-1 downto 0);
type Q_type is array (n-1 downto 0) of Q_word;
signal my_P, my_D : Q_type;

-- 
function return_vector (a : std_logic;q_int : std_logic_vector(n-1 downto 0)) 
    return Q_word is
begin
    return a & q_int(n-2 downto 0);
end function;

begin
    
    for_shifter : for I in 0 to n-1 generate
        
        my_D(I) <= return_vector(A(I), my_P(I));
        
        shifter : entity work.shifter_74LS174
        Port map (
            clk => clk,
            clr => clr,
            S => S,
            R => A(I),
            D => my_D(I),
            L => my_P(I)(0),
            P => my_P(I)
        );

        P(I) <= my_P(I)(n-1);
    end generate;

    

end Behavioral;