library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
  port (
  clk : in std_logic,
  clr : in std_logic

  );
end entity;

architecture top_module of top_module is

  component myca2 is
      Port ( clk : in STD_LOGIC;
             clr : in STD_LOGIC;
             flag : in STD_LOGIC;
             braddr : in STD_LOGIC_VECTOR (7 downto 0);
             opcode : in STD_LOGIC_VECTOR (3 downto 0);
             jaddr : in STD_LOGIC_VECTOR (7 downto 0);
             Q : out STD_LOGIC_VECTOR (7 downto 0));
  end component;

  component rom_refri is
      Port (
      address in : std_logic_Vector(7 downto 0);
      data out: std_logic_Vector(19 downto 0)
      );
  end component;

  signal datatoflag : std_logic;
  signal datatobaddress : std_logic_vector(7 downto 0);
  signal datatoopcode : std_logic_vector(3 downto 0);
  signal QtoAddress : std_logic_vector(7 downto 0);
  signal datatoca : std_logic;
  signal datatorn : std_logic;
  signal datatoda : std_logic;
  signal datatodp : std_logic;
  signal datatojaddr : std_logic_vector(7 downto 0);
  signal saidarom : std_logic_vector(19 downto 0);
  signal datatomuxadrress : std_logic_vector(2 downto 0);
begin

  myca2 : myca2 port map (
  clk => clk,
  clr => clr,
  flag => datatoflag,
  braddr => datatobaddress,
  jaddr => datatojaddr,
  opcode => datatoopcode
  );

  rom : rom_refri port map(
  address => QtoAddress,
  data => saidarom
  );

  datatoopcode <= saidarom(19 downto 17);
  datatomuxadrress <= saidarom(16 downto 14);
  datatobaddress <= saidarom (13 downto 7);
  datatosaida <= saidarom(6 downto 0);
  


end architecture;
