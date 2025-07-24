library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.ALL;

entity adder is
    generic(adder_width1 : integer :=16;
            adder_width2 : integer :=20);
    Port ( A : in STD_LOGIC_VECTOR (adder_width1-1 downto 0);
           B : in STD_LOGIC_VECTOR (adder_width2-1 downto 0);
           Sum : out STD_LOGIC_VECTOR (adder_width2-1 downto 0));
end adder;

architecture Behavioral of adder is

begin

Sum <= A + B;

end Behavioral;
