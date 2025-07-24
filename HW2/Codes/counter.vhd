library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.ALL;

entity counter is
    generic(interval : integer :=10);
    Port ( CLK : in STD_LOGIC;
           RCO : out STD_LOGIC);
end counter;

architecture Behavioral of counter is
signal count : integer range 0 to interval-1 :=0;
signal temp_RCO :std_logic :='0';
begin
process(clk)
begin

if (clk'event and clk='1') then

    count <= count + 1;
    if (count = interval) then
    count <= 0;
    end if;

end if;
end process;

temp_RCO <= '1' when count=interval else '0';
RCO <= temp_RCO;

end Behavioral;
