library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity D74LS194 is
    port (
    clk       : in  std_logic;
    clr      : in  std_logic ;
    S       : in std_logic_vector (1 downto 0);
    R       : in std_logic;
    D       : in std_logic_vector (7 downto 0);
    L       : in std_logic;
    Q       : out std_logic_vector (7 downto 0)
    );

end entity;

architecture  deslocador of D74LS194 is

    signal flip : std_logic_vector (7 downto 0);
begin
    process(clr,S,R,D,L, clk, flip)
    begin
        if rising_edge(clk) then
            if clr = '0' then
                flip <= "00000000";
            end if;
            if clr = '1' and S = "00" then
                flip <= flip;
            end if;
            if clr = '1' and S = "01" and R = '0' then
                flip <= '0' & flip(7) & flip(6) & flip(5) & flip(4) & flip(3) & flip(2) & flip(1);
            end if;
            if clr = '1' and S = "01" and R = '1' then
                flip <= '1' & flip(7) & flip(6) & flip(5) & flip(4) & flip(3) & flip(2) & flip(1);
            end if;
            if clr = '1' and S = "10" and L = '0' then
                flip <= flip(6) & flip(5) & flip(4) & flip(3) & flip(2) & flip(1) & flip(0) & '0' ;
            end if;
            if clr = '1' and S = "10" and L = '1' then
                flip <= flip(6) & flip(5) & flip(4) & flip(3) & flip(2) & flip(1) & flip(0) & '1' ;
            end if;
            if clr = '1' and S = "11" then
                flip <= D;
            end if;

        end if;

        Q <= flip;

    end process;



end architecture;
