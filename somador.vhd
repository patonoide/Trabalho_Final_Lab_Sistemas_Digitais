----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 06/01/2019 10:52:45 AM
-- Design Name:
-- Module Name: adder_reg - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity somador_reg is
    Generic( n : integer := 4
    );
    Port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           en : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           S : out STD_LOGIC_VECTOR (n-1 downto 0));
end somador_reg;

architecture Behavioral of somador_reg is

begin

process(clk)
variable a_var, b_var: unsigned(n-1 downto 0);
variable s_var : unsigned(n-1 downto 0) := (others=>'0');
begin
    if (rising_edge(clk)) then
        a_var :=  unsigned(A);
        b_var :=  unsigned(B);
        if (clr = '1') then
            s_var := (others=>'0');
        elsif (en = '1') then
            s_var := a_var + b_var;
        end if;
        S <= std_logic_vector(s_var);
    end if;
end process;

end Behavioral;
