library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity parity_checker is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           even_parity : buffer STD_LOGIC;
           output : out STD_LOGIC_VECTOR (8 downto 0));
end parity_checker;

architecture DataFlow of parity_checker is
--------------------------------------------------------------
    function even_parity_maker (a1 : in std_logic_vector)
    return std_logic
    is
    
        variable b1 : STD_LOGIC := '0';
   
        begin
 loop1: for i in a1'range loop
        b1 := a1(i) xor b1;
        end loop;
        
        return b1;
    end function;
--------------------------------------------------------------
signal preout1 : std_logic_vector(8 downto 0);
signal preout2 : std_logic_vector(8 downto 0);

begin
preout1 <= ('0'&input + 47);
preout2 <= ('0'&input - 37);

even_parity <= even_parity_maker(input);
with even_parity select
        output    <=  ('0' & preout1(8 downto 1))  when '0',
                      (preout2(7 downto 0) & '0')  when others;
                                                               
end DataFlow;



------------------------------- TB -----------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Parity_checker_TB is
--  Port ( );
end Parity_checker_TB;

architecture DataFlow of Parity_checker_TB is
signal input : STD_LOGIC_VECTOR (7 downto 0);
signal even_parity : STD_LOGIC;
signal output : STD_LOGIC_VECTOR (8 downto 0);
component Parity_checker 
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           even_parity : buffer STD_LOGIC;
           output : out STD_LOGIC_VECTOR (8 downto 0));
end component;
begin
UUT1: Parity_checker port map(input,even_parity,output);

input <= b"1100_1010",
         b"1100_1011" after 200 ns,
         b"1010_1010" after 400 ns,
         b"1110_1010" after 600 ns;
end DataFlow;
