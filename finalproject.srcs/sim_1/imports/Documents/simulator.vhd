----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/03/2019 10:38:34 PM
-- Design Name: 
-- Module Name: simulator - Behavioral
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

entity simulator is
--  Port ( );
end simulator;

architecture Behavioral of simulator is

signal clr, clk, refri_retirado, moeda_retirada, MOEDA_ACK : std_logic;
signal drop_pop, return_nickel: std_logic;
signal coin : std_logic_vector (1 downto 0);

constant T : time := 10ns; -- 10ns

begin

dut: entity work.top_module port map(
clr             => clr, 
clk             => clk, 
REFRI_RET  => refri_retirado, 
MOEDA_RET  =>  moeda_retirada, 
MOEDA_ACK       => moeda_ack,
drop_pop        => drop_pop, 
return_nickel   => return_nickel,
COIN_IN            => coin,
output_7seg     => open, 
output_an       => open 
);

clock: process 
begin
    clk <= '0';
    wait for T/2;
    clk <= '1';
    wait for T/2;
end process;

stimuli: process
begin
    
    refri_retirado <= '0';
    moeda_retirada <= '0';
    MOEDA_ACK      <= '0';
    coin <= "00";
    
    clr <= '1'; 
    wait for T*3;
    clr <= '0';
    
    wait for T/2;
    
    coin <= "01";
    MOEDA_ACK <= '1'; 
    wait for T*10;
    MOEDA_ACK <= '0'; 
    wait for T*10;
    MOEDA_ACK <= '1'; 
    wait for T*10;
    MOEDA_ACK <= '0'; 
    wait for T*10;
    MOEDA_ACK <= '1'; 
    wait for T*10;
    MOEDA_ACK <= '0'; 
    
    
    wait; 
end process;

end Behavioral;
