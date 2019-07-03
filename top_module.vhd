library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
  port (
  clk : in std_logic;
  clr : in std_logic;
  coin_present : in std_logic;
  smenor30 : in std_logic;
  smaior30 : in std_logic;
  sigual30 : in std_logic;
  pop_drop_ready : in std_logic;
  changer_ready : in std_logic;
  soma : out std_logic;
  load_count : out std_logic;
  clr_cont : out std_logic;
  dec_troco : out std_logic;
  moeda_em_bandeja : out std_logic;
  refri_em_bandeja : out std_logic
  );
end entity;

architecture top_module of top_module is

  component myca2 is
       Port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           flag : in STD_LOGIC;
           braddr : in STD_LOGIC_VECTOR (7 downto 0);
           opcode : in STD_LOGIC_VECTOR (2 downto 0);
           jaddr : in STD_LOGIC_VECTOR (7 downto 0);
           Q : out STD_LOGIC_VECTOR (7 downto 0));
  end component;

  component rom_refri is
      Port (
      address : in std_logic_Vector(7 downto 0);
      data :  out std_logic_Vector(19 downto 0)
      );
  end component;

  component mux8 is

      port (
      S : in  STD_LOGIC_VECTOR (2 downto 0);
      D : in STD_LOGIC_VECTOR (7 downto 0);


      Y : out std_logic

      );
  end component;

  signal data_to_flag : std_logic;
  signal data_to_baddress : std_logic_vector(7 downto 0);
  signal data_to_opcode : std_logic_vector(2 downto 0);
  signal Q_to_Address : std_logic_vector(7 downto 0);
  signal data_to_jaddr : std_logic_vector(7 downto 0);
  signal saida_rom : std_logic_vector(19 downto 0);
  signal data_to_mux_adrress_selector : std_logic_vector(2 downto 0);
  signal mux_to_myca2 : std_logic_vector(7 downto 0);
  signal entrada_mux : std_logic_vector(7 downto 0);
  signal saida_mux : std_logic;
  signal data_to_saida : std_logic_vector(5 downto 0);



begin

  myca2_use : myca2 port map (
  clk => clk,
  clr => clr,
  flag => saida_mux,
  braddr => data_to_baddress,
  jaddr => data_to_jaddr,
  opcode => data_to_opcode
  );

  rom : rom_refri port map(
  address => Q_to_Address,
  data => saida_rom
  );

  muxbranch : mux8 port map(
  S => data_to_mux_adrress_selector,
  D => entrada_mux,
  Y => saida_mux
  );

  data_to_opcode <= saida_rom(19 downto 17);
  data_to_mux_adrress_selector <= saida_rom(16 downto 14);
  data_to_baddress <= saida_rom(13 downto 6);
  data_to_saida <= saida_rom(5 downto 0);

  entrada_mux <= coin_present & smenor30 & smaior30 & sigual30 & pop_drop_ready & changer_ready & not coin_present & '0';

  soma <= data_to_saida(5);
  load_count <= data_to_saida(4);
  clr_cont <= data_to_saida(3);
  moeda_em_bandeja <= data_to_saida(2);
  dec_troco <= data_to_saida(1);
  refri_em_bandeja <= data_to_saida(0);



end architecture;
