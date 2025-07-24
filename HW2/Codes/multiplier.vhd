library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.ALL;

entity multiplier is
    generic(mult_width : integer :=8);
    Port ( A : in STD_LOGIC_VECTOR (mult_width-1 downto 0);
           B : in STD_LOGIC_VECTOR (mult_width-1 downto 0);
           Product : out STD_LOGIC_VECTOR (2*mult_width-1 downto 0));
end multiplier;

architecture Behavioral of multiplier is
signal extra : std_logic_vector(2*mult_width-1 downto 0);
begin

product <= conv_std_logic_vector(conv_integer(A * B),2*mult_width);

end Behavioral;
