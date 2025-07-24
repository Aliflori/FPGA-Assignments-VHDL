library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier_TB is
--  Port ( );
end multiplier_TB;

architecture Behavioral of multiplier_TB is

    constant mult_width : integer :=8;
    signal A : STD_LOGIC_VECTOR (mult_width-1 downto 0);
    signal B : STD_LOGIC_VECTOR (mult_width-1 downto 0);
    signal Product : STD_LOGIC_VECTOR (2*mult_width-1 downto 0);

component multiplier is
    generic(mult_width : integer :=8);
    Port ( A : in STD_LOGIC_VECTOR (mult_width-1 downto 0);
           B : in STD_LOGIC_VECTOR (mult_width-1 downto 0);
           Product : out STD_LOGIC_VECTOR (2*mult_width-1 downto 0));
end component;

begin

DUT1: multiplier generic map(mult_width=>mult_width) port map(A=>A,B=>B,Product=>Product);

A <= b"0000_1011",b"0000_1111" after 10ns,b"0001_1101" after 20ns;
B <= b"0000_1011",b"0000_1001" after 5ns,b"0000_0001" after 18ns,b"0000_0001" after 25ns;


end Behavioral;
