library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux8 is

    port (
    S : in  STD_LOGIC_VECTOR (2 downto 0);
    D : in STD_LOGIC_VECTOR (7 downto 0);


    Y : out std_logic

    );
end entity;


architecture mux8 of mux8 is
    begin
    Y <= '1' when (D(0) = '1' and S(0) = '0' and S(1) = '0' and S(2) = '0') else
         '1' when (D(1) = '1' and S(0) = '1' and S(1) = '0' and S(2) = '0') else
         '1' when (D(2) = '1' and S(0) = '0' and S(1) = '1' and S(2) = '0') else
         '1' when (D(3) = '1' and S(0) = '1' and S(1) = '1' and S(2) = '0') else
         '1' when (D(4) = '1' and S(0) = '0' and S(1) = '0' and S(2) = '1') else
         '1' when (D(5) = '1' and S(0) = '1' and S(1) = '0' and S(2) = '1') else
         '1' when (D(6) = '1' and S(0) = '1' and S(1) = '1' and S(2) = '0') else
         '1' when (D(7) = '1' and S(0) = '1' and S(1) = '1' and S(2) = '1') else
         '0';



end architecture;
