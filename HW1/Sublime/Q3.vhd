library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity frequency_divider is
    Port ( clk : in STD_LOGIC;
           duty_cycle : in STD_LOGIC_VECTOR (3 downto 0);
           clk_out : out STD_LOGIC);
end entity;

architecture Behavioral of frequency_divider is
signal count : integer range 0 to 99 := 0;
begin
    process(clk)
    begin
        if (clk'event and clk='1') then
            if count = 99 then
                count <= 0;
            else
                count <= count + 1;
            end if;
            if (count < 10*(conv_integer(duty_cycle))) then
                clk_out <= '1';
            else
                clk_out <= '0';
            end if;
        end if;
    end process;
end architecture;

-------------- TB -------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity frequency_divider_TB is
--  Port ( );
end frequency_divider_TB;

architecture Behavioral of frequency_divider_TB is
signal clk : STD_LOGIC := '0';
signal duty_cycle :  STD_LOGIC_VECTOR (3 downto 0);
signal clk_out :  STD_LOGIC;
component frequency_divider 
    Port ( clk : in STD_LOGIC;
           duty_cycle : in STD_LOGIC_VECTOR (3 downto 0);
           clk_out : out STD_LOGIC);
end component;
constant period : time := 125 ns;
begin
DUT: frequency_divider port map(CLK,duty_cycle,clk_out);
CLK <= not CLK after (period/2);

stimulus: process
begin
duty_cycle <= x"1";
wait for (400*period);
duty_cycle <= x"0";
wait for (400*period);
duty_cycle <= x"9";
wait for (400*period);
duty_cycle <= x"5";
wait for (400*period);
duty_cycle <= x"3";
wait;
end process;
end Behavioral;
