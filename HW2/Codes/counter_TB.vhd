library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_TB is
--  Port ( );
end counter_TB;

architecture Behavioral of counter_TB is
signal CLK : STD_LOGIC :='0';
signal RCO : STD_LOGIC;
component counter is
    generic(interval : integer);
    Port ( CLK : in STD_LOGIC;
           RCO : out STD_LOGIC);
end component;
constant period : time := 90ns;
begin

clk <= not clk after (period/2);
DUT1: counter generic map(10) port map(CLK=>CLK,RCO=>RCO); 

end Behavioral;
