library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity pilha is
    port (clk: in  std_logic;
          clr: in  std_logic ;
          S: in std_logic_vector (1 downto 0);
          A: in std_logic_vector (7 downto 0);
          P: out std_logic_vector (7 downto 0));

end entity;

architecture Impleme of pilha is
    component D74LS194 is
        port (clk: in  std_logic;
              clr: in  std_logic;
              S: in std_logic_vector (1 downto 0);
              R: in std_logic;
              D: in std_logic_vector (7 downto 0);
              L: in std_logic;
              Q: out std_logic_vector (7 downto 0));
    end component;
    signal saida7 : std_logic_vector (7 downto 0);
    signal saida6 : std_logic_vector (7 downto 0);
    signal saida5 : std_logic_vector (7 downto 0);
    signal saida4 : std_logic_vector (7 downto 0);
    signal saida3 : std_logic_vector (7 downto 0);
    signal saida2 : std_logic_vector (7 downto 0);
    signal saida1 : std_logic_vector (7 downto 0);
    signal saida0 : std_logic_vector (7 downto 0);
    signal entrada7 : std_logic_vector (7 downto 0);
    signal entrada6 : std_logic_vector (7 downto 0);
    signal entrada5 : std_logic_vector (7 downto 0);
    signal entrada4 : std_logic_vector (7 downto 0);
    signal entrada3 : std_logic_vector (7 downto 0);
    signal entrada2 : std_logic_vector (7 downto 0);
    signal entrada1 : std_logic_vector (7 downto 0);
    signal entrada0 : std_logic_vector (7 downto 0);

    begin
        
        D74LS194_7 : D74LS194 port map (clk => clk, 
                                        clr => clr, 
                                        S => S, 
                                        R => A(7), 
                                        Q => saida7,
                                        L => entrada7(0), 
                                        D => entrada7);
                                        
        entrada7  <= A(7) & saida7(6) & saida7(5) & saida7(4) & saida7(3) & saida7(2) & saida7(1) & saida7(0);
        P(7) <= saida7(7);
        
        D74LS194_6 : D74LS194 port map (clk => clk, 
                                        clr => clr, 
                                        S => S, 
                                        R => A(6), 
                                        Q => saida6,
                                        L => entrada6(0), 
                                        D => entrada6);
                                        
        entrada6  <= A(6) & saida6(6) & saida6(5) & saida6(4) & saida6(3) & saida6(2) & saida6(1) & saida6(0);
        P(6) <= saida6(7);
        
        D74LS194_5 : D74LS194 port map (clk => clk, 
                                        clr => clr, 
                                        S => S, 
                                        R => A(5), 
                                        Q => saida5,
                                        L => entrada5(0), 
                                        D => entrada5);
                                        
        entrada5  <= A(5) & saida5(6) & saida5(5) & saida5(4) & saida5(3) & saida5(2) & saida5(1) & saida5(0);
        P(5) <= saida5(7);
        
        D74LS194_4 : D74LS194 port map (clk => clk, 
                                        clr => clr, 
                                        S => S, 
                                        R => A(4), 
                                        Q => saida4,
                                        L => entrada4(0), 
                                        D => entrada4);
                                        
        entrada4  <= A(4) & saida4(6) & saida4(5) & saida4(4) & saida4(3) & saida4(2) & saida4(1) & saida4(0);
        P(4) <= saida4(7);
    
        D74LS194_3 : D74LS194 port map (clk => clk, 
                                        clr => clr, 
                                        S => S, 
                                        R => A(3), 
                                        Q => saida3,
                                        L => entrada3(0), 
                                        D => entrada3);
                                        
        entrada3  <= A(3) & saida3(6) & saida3(5) & saida3(4) & saida3(3) & saida3(2) & saida3(1) & saida3(0);
        P(3) <= saida3(7);
    
        D74LS194_2 : D74LS194 port map (clk => clk, 
                                        clr => clr, 
                                        S => S, 
                                        R => A(2), 
                                        Q => saida2,
                                        L => entrada2(0), 
                                        D => entrada2);
                                        
        entrada2  <= A(2) & saida2(6) & saida2(5) & saida2(4) & saida2(3) & saida2(2) & saida2(1) & saida2(0);
        P(2) <= saida2(7);
    
        D74LS194_1 : D74LS194 port map (clk => clk, 
                                        clr => clr, 
                                        S => S, 
                                        R => A(1), 
                                        Q => saida1,
                                        L => entrada1(0), 
                                        D => entrada1);
                                        
        entrada1  <= A(1) & saida1(6) & saida1(5) & saida1(4) & saida1(3) & saida1(2) & saida1(1) & saida1(0);
        P(1) <= saida1(7);
    
        D74LS194_0 : D74LS194 port map (clk => clk,
                                        clr => clr, 
                                        S => S, 
                                        R => A(0), 
                                        Q => saida0,
                                        L => entrada0(0), 
                                        D => entrada0);
                                        
        entrada0  <= A(0) & saida0(6) & saida0(5) & saida0(4) & saida0(3) & saida0(2) & saida0(1) & saida0(0);
        P(0) <= saida0(7);
    
end architecture;