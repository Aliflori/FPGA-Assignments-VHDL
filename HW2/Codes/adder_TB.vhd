library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_TB is
--  Port ( );
end adder_TB;

architecture Behavioral of adder_TB is
    constant adder_width1 : integer :=16;
    constant adder_width2 : integer :=20;
    signal A :  STD_LOGIC_VECTOR (adder_width1-1 downto 0);
    signal B :  STD_LOGIC_VECTOR (adder_width2-1 downto 0);
    signal Sum :  STD_LOGIC_VECTOR (adder_width2-1 downto 0);
    
    component adder is
    generic(adder_width1 : integer :=16;
            adder_width2 : integer :=20);
    Port ( A : in STD_LOGIC_VECTOR (adder_width1-1 downto 0);
           B : in STD_LOGIC_VECTOR (adder_width2-1 downto 0);
           Sum : out STD_LOGIC_VECTOR (adder_width2-1 downto 0));
    end component;
    
begin

DUT1: adder generic map(adder_width1,adder_width2) port map(A=>A,B=>B,Sum=>sum);

A <= b"0000_1011",b"1001_1111" after 10ns,b"0001_1101" after 20ns;
B <= b"0010_1011",b"0001_1001" after 5ns,b"0001_0001" after 18ns,b"1001_1101" after 25ns;

end Behavioral;
