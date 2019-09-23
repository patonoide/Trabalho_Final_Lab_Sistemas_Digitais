----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 04/23/2019 10:54:43 AM
-- Design Name:
-- Module Name: 1bit_Adder - Behavioral
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



entity Adder_1bit is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c_in : in STD_LOGIC;
           s : out STD_LOGIC;
           c_out : out STD_LOGIC);
end Adder_1bit;

architecture Behavioral of Adder_1bit is

begin

s <= a xor b xor c_in;
c_out <= ((a xor b) and c_in) or (a and b) ;

end Behavioral;
