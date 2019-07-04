library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity contador_74LS169 is
    Port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           ld : in STD_LOGIC;
           en : in STD_LOGIC;
           up_down : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           o_f : out STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end contador_74LS169;

architecture Behavioral of contador_74LS169 is

begin

process (clk)
variable Q_var : Unsigned(3 downto 0) := (others=>'0');
begin
    if (rising_edge(clk)) then
        if (clr = '1') then
            Q_var := (others=>'0');
        elsif (ld = '1') then
            Q_var := unsigned(D);
        elsif (en = '1') then
            if (up_down = '0') then
                if (Q_var = "0000") then o_f <= '1';
                else                     o_f <= '0'; end if;
                Q_var := Q_var - 1;
            else
                if (Q_var = "1111") then o_f <= '1';
                else                     o_f <= '0'; end if;
                Q_var := Q_var + 1;
            end if;
        end if;
        Q <= std_logic_vector( Q_var );
    end if;
end process;

end Behavioral;
