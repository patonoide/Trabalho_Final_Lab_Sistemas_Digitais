library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
  port (
  clk :in std_logic;
  clr : in std_logic;
  COIN_IN : in std_logic_vector(1 downto 0);
  REFRI_RET : in std_logic;
  MOEDA_ACK : in std_logic;
  MOEDA_RET : in std_logic;
  return_nickel : out std_logic;
  drop_pop : out std_logic
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

  component decoMoeda is
      Port ( COIN_IN : in STD_LOGIC_VECTOR (1 downto 0);
             DECOIN_OUT : out STD_LOGIC_VECTOR (3 downto 0));
  end component;

  component deco7seg is
      Generic (clk_freq : integer := 100000000; -- 100MHz
               refresh_freq : integer := 30 -- 30Hz
      );
      Port ( clk_7seg : in STD_LOGIC;
             rst : in std_logic;
             input_1 : in STD_LOGIC_VECTOR (3 downto 0);
             input_2 : in STD_LOGIC_VECTOR (3 downto 0);
             input_3 : in STD_LOGIC_VECTOR (3 downto 0);
             input_4 : in STD_LOGIC_VECTOR (3 downto 0);
             output_7seg : out STD_LOGIC_VECTOR (6 downto 0);
             output_an : out STD_LOGIC_VECTOR (3 downto 0));
  end component;

  component comp4bit is port(
  	a, b : in std_logic_vector(3 downto 0);
      agtbin, aeqbin, altbtin : in std_logic;
      agtbout, aeqbout, altbtout : out std_logic);
  end component;

  component somador_reg is
      Generic( n : integer := 4
      );
      Port ( clk : in STD_LOGIC;
             clr : in STD_LOGIC;
             en : in STD_LOGIC;
             A : in STD_LOGIC_VECTOR (n-1 downto 0);
             B : in STD_LOGIC_VECTOR (n-1 downto 0);
             S : out STD_LOGIC_VECTOR (n-1 downto 0));
  end component;

  component contador_74LS169 is
      Port ( clk : in STD_LOGIC;
             clr : in STD_LOGIC;
             ld : in STD_LOGIC;
             en : in STD_LOGIC;
             up_down : in STD_LOGIC;
             D : in STD_LOGIC_VECTOR (3 downto 0);
             o_f : out STD_LOGIC;
             Q : out STD_LOGIC_VECTOR (3 downto 0));
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

  signal saida_moeda : std_logic_vector (3 downto 0);
  signal saida_contador : std_logic_vector(3 downto 0);
  signal saida_somador : std_logic_vector(3 downto 0);
  signal dec_troco_ou_load_cont : std_logic;
  signal clr_ou_clr_count : std_logic;
  signal s_igual_30 : std_logic;
  signal s_maior_30 : std_logic;
  signal s_menor_30 : std_logic;
  signal SAIDA_CLR_CONT : std_logic;
  signal SAIDA_DEC_TROCO : std_logic;
  signal SAIDA_LOAD_CNT : std_logic;
  signal SAIDA_SOMAR : std_logic;
  signal SAIDA_MOEDA_BANDEJA : std_logic;
  signal SAIDA_REFRI_BANDEJA : std_logic;
  signal input2 : std_logic_vector(3 downto 0);
  signal input3 : std_logic_vector(3 downto 0);
begin

  moeda : decoMoeda port map (COIN_IN => COIN_IN,
                              DECOIN_OUT => saida_moeda
                              );

  somador : somador_reg port map (clk => clk,
                                  en => SAIDA_SOMAR,
                                  clr => clr,
                                  A => saida_moeda,
                                  B => saida_contador,
                                  S => saida_somador
                                  );

  contador: contador_74LS169 port map (clk => clk,
                                       D => saida_somador,
                                       ld => SAIDA_LOAD_CNT,
                                       en => dec_troco_ou_load_cont,
                                       clr => clr_ou_clr_count,
                                       Q => saida_contador,
                                       up_down => '0'
                                                   );

       comparador : comp4bit port map (aeqbin => '1',
                                       altbtin => '0',
                                       agtbin => '0',
                                       A => saida_contador,
                                       B => "0110",
                                       aeqbout => s_igual_30,
                                       agtbout => s_maior_30,
                                       altbtout => s_menor_30
                                         );

    display7seg : deco7seg port map (input_1 => "0110",
                                     input_2 => input2,
                                     input_3 => input3,
                                     input_4 => saida_contador,
                                     clk_7seg => clk,
                                     rst => clr
                                         );


  myca2_use : myca2 port map (
  clk => clk,
  clr => clr,
  flag => saida_mux,
  braddr => data_to_baddress,
  jaddr => data_to_jaddr,
  opcode => data_to_opcode,
  Q =>Q_to_Address
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

  entrada_mux <= MOEDA_ACK & s_menor_30 & s_maior_30 & s_igual_30 & REFRI_RET & MOEDA_RET & not MOEDA_ACK & '0';

  SAIDA_SOMAR <= data_to_saida(5);
  SAIDA_LOAD_CNT <= data_to_saida(4);
  SAIDA_CLR_CONT <= data_to_saida(3);
  SAIDA_MOEDA_BANDEJA <= data_to_saida(2);
  SAIDA_DEC_TROCO <= data_to_saida(1);
  SAIDA_REFRI_BANDEJA <= data_to_saida(0);

  dec_troco_ou_load_cont <= SAIDA_LOAD_CNT or SAIDA_DEC_TROCO;
  clr_ou_clr_count <= clr or SAIDA_CLR_CONT;

  drop_pop <= SAIDA_REFRI_BANDEJA;
  return_nickel <= SAIDA_MOEDA_BANDEJA;

  input2 <= Q_to_Address(3 downto 0);
  input3 <= '0' & data_to_opcode;

end architecture;
