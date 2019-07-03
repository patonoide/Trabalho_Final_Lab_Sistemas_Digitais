library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rom_refri is
    Port (
    address  : in std_logic_Vector(7 downto 0);
    data : out std_logic_Vector(19 downto 0)
    );
end rom_refri;

architecture  rom_refri of rom_refri is

  type mem is array ( 0 to 2**4 - 1) of std_logic_vector(19 downto 0);
     constant my_Rom : mem := (
       0  => "00000000000000100000",
       1  => "00011000000000010000",
       2  => "10000100000000000000",
       3  => "10101000000110000000",
       4  => "00010000000000000001",
       5  => "01100000000000001000",
       6  => "00010100000000000100",
       7  => "01000000000000000010",
       8  => "11001100000110000000",
       9  => "01100000000000000000",
       10 => "01100000000000000000",
       11 => "01100000000000000000",
       12 => "01100000000000000000",
       13 => "01100000000000000000",
       14 => "01100000000000000000",
       15 => "01100000000000000000"
       );



begin
  process (address)
  begin
    case address is
      when "00000000" => data <= my_rom(0);
      when "00000001" => data <= my_rom(1);
      when "00000010" => data <= my_rom(2);
      when "00000011" => data <= my_rom(3);
      when "00000100" => data <= my_rom(4);
      when "00000101" => data <= my_rom(5);
      when "00000110" => data <= my_rom(6);
      when "00000111" => data <= my_rom(7);
      when "00001000" => data <= my_rom(8);
      when "00001001" => data <= my_rom(9);
      when "00001010" => data <= my_rom(10);
      when "00001011" => data <= my_rom(11);
      when "00001100" => data <= my_rom(12);
      when "00001101" => data <= my_rom(13);
      when "00001110" => data <= my_rom(14);
      when "00001111" => data <= my_rom(15);
      when others => data <= "01100000000000000000";
  end case;
 end process;

end architecture;
