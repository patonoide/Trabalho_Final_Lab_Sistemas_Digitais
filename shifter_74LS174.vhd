library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity shifter_74LS174 is 
generic( n : integer := 8);
port (
    clk, clr: in STD_LOGIC;
    S : in std_logic_vector(1 downto 0);
    L : in std_logic;
    D : in std_logic_vector(n-1 downto 0);
    R : in std_logic;
    P : out std_logic_vector(n-1 downto 0)
);
end shifter_74LS174;

architecture Behavioral of shifter_74LS174 is

begin
    process(clk)
    variable Q_var : std_logic_vector(n-1 downto 0);
    begin
        if (rising_edge(clk)) then 
            if (clr = '1') then
                Q_var := (others => '0');
            else
                case S is
                    when "00" => Q_var := Q_var;
                    when "01" => Q_var := R & Q_var(n-1 downto 1);
                    when "10" => Q_var := Q_var(n-2 downto 0) & L;
                    when "11" => Q_var := D;
                    when others => Q_var := Q_var;
                end case;
            end if;

            P <= Q_var;
        end if;
    end process;
end Behavioral;