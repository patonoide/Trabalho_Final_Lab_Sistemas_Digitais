library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myca2 is
    Port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           flag : in STD_LOGIC;
           braddr : in STD_LOGIC_VECTOR (7 downto 0);
           opcode : in STD_LOGIC_VECTOR (2 downto 0);
           jaddr : in STD_LOGIC_VECTOR (7 downto 0);
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end myca2;

architecture Behavioral of myca2 is

signal ld, en, s0, s1 : std_logic;
signal deco_out: STD_LOGIC_VECTOR (6 downto 0);
signal P, f, C :  std_logic_Vector (7 downto 0);
signal D0, D1, D2, D3: STD_LOGIC_VECTOR (7 downto 0);
signal Smux: STD_LOGIC_VECTOR (1 downto 0);
signal Ymux: STD_LOGIC_VECTOR (7 downto 0);

begin
ld <= deco_out(5);
en <= deco_out(6);
contador: entity work.C74LS169 port map(
    clk => clk,
    clr => clr,
    ld => ld,
    en => en,
    ud => '1',
    D => Ymux,
    oof => open,
    C => C
);

s0 <= deco_out(1);
s1 <= deco_out(2);

pilha: entity work.stack_nbit port map(
    clk => clk,
    clr => clr,
    S(0) => s0,
    S(1) => s1,
    A => f,
    P => D2
);

fulladder: entity work.nbit_adder port map(
    a => "00000000",
    b => C,
    cin => deco_out(0),
    f => f
);

opdecode: entity work.opcode_decoder port map(
    deco_in(0) => flag,
    deco_in(1) => opcode(0),
    deco_in(2) => opcode(1),
    deco_in(3) => opcode(2),
    deco_out => deco_out
);
Smux <= deco_out(4) & deco_out(3); 

mux: process(Smux, braddr, jaddr, P, D2)
begin
    case Smux is
    when "00" => Ymux <= braddr;
    when "01" => Ymux <= jaddr;
    when "10" => Ymux <= D2;
    when "11" => Ymux <= "00000000";
    when others =>  Ymux <= "00000000";
    end case;
end process;

Q <= C;

end Behavioral;