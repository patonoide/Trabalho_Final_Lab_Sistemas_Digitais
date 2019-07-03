----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 06/01/2019 10:52:45 AM
-- Design Name:
-- Module Name: decoMoeda - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoMoeda is
    Port ( COIN_IN : in STD_LOGIC_VECTOR (1 downto 0);
           DECOIN_OUT : out STD_LOGIC_VECTOR (3 downto 0));
end decoMoeda;

architecture Behavioral of decoMoeda is

begin

with COIN_IN select DECOIN_OUT <=
    "0001" when "00",
    "0010" when "01",
    "0101" when "10",
    "1010" when "11";

end Behavioral;
