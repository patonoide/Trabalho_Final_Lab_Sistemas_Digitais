library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;


entity C74LS169 is
    port (
    clk       : in  std_logic;
    clr      : in  std_logic ;
    ud      : in std_logic;
    en      : in std_logic;
    ld      : in std_logic;
    oof     : out std_logic;
    D       : in std_logic_vector (7 downto 0);
    C       : out std_logic_vector (7 downto 0)
    );

end entity;

architecture  implem of C74LS169 is

    signal flip : std_logic_vector (7 downto 0);
begin
    process(clr, en,ld, clk, ud, D, flip)
    begin
        if rising_edge(clk) then
            if clr = '1'  then
                flip <= "00000000";
                oof <= '0';
                
            elsif en = '0'  then
                flip <= flip;
                oof <= '0';
                
            elsif en = '1' and ld = '1' then
                flip <= D;
                oof <= '0';
                
            elsif en = '1' and ud = '0' and flip = "00000000" then
                oof <= '1';
                flip <= "11111111";
                
            elsif en = '1' and ud = '1' and flip = "11111111" then
                oof <= '1';
                flip <="00000000";
                
            elsif en = '1' and ud = '0' then
                oof <= '0';
                flip <= std_logic_vector(unsigned(flip) - 1);
                
            elsif en = '1' and ud = '1' then
                oof <= '0';
                flip <= std_logic_vector(unsigned(flip) + 1);
                
            end if;

        end if;

			C <= flip;

    end process;


end architecture;
