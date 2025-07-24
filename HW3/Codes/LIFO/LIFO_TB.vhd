library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity LIFO_tb is
end LIFO_tb;

architecture Behavioral of LIFO_tb is
    constant WIDTH : integer := 8;
    constant LENGTH : integer := 256;
    signal Di : STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0):=(others=>'0');
    signal Addr : integer range 0 to LENGTH-1 := 0;
    signal Reset : std_logic :='0';
    signal Do : STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
    signal Rd_Wr : std_logic:='1';
    signal CLK : std_logic:='0';
    signal SP : integer range 0 to Length-1 :=0;
    signal Full : std_logic :='0';
    signal Empty : std_logic :='1';

    constant period : time := 5 ns;
begin
    UUT: Entity work.LIFO generic map(WIDTH, LENGTH, '1')
         port map(Di, Addr, Reset, Do, Rd_Wr, CLK, SP, Full, Empty);

CLK <= not CLK after Period/2;
Reset <= '1' after 1 ns,'0' after 10 ns ;

stimulus1: Process
begin
Addr <= 245;
Rd_Wr <= '1';
Wait for 49 ns;

Addr <= 7;
Rd_Wr <= '0';
wait;
end process;
stimulus2: Process
begin
for i in 0 to 10 loop
Di <= Di + 19;
wait for 4.33 ns;
end loop;
wait;
end process;
end Behavioral;
