library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stopwatch is
    Port ( CLK : in STD_LOGIC;
           Async_Reset : in STD_LOGIC;
           Start : in STD_LOGIC;
           CS : BUFFER INTEGER RANGE 0 TO 100;
           S : BUFFER INTEGER RANGE 0 TO 60;
           M : BUFFER INTEGER RANGE 0 TO 60);
end entity;

architecture Behavioral of stopwatch is
begin

process(CLK,Async_Reset)
variable count_internal : integer range 0 to 2 :=0;
begin

if (Async_reset = '1') then

    CS <= 0;
    S  <= 0;
    M  <= 0;

elsif (clk'event and clk = '1') then

    if (start = '1') then
        count_internal := count_internal+1;
        if(count_internal=2) then
            count_internal := 1;
            CS <= CS+1;
            if(CS = 99) then
                CS <= 0;
                S <= S+1;
                if(S = 59) then
                    S <= 0;
                    M <= M+1;
                    if(M = 59) then
                        M <= 0;
                        report("1 hour !")
                        severity(Failure);
                    end if;                 
                end if;
            end if; 
        end if;
    end if;

end if;
end process;
end architecture;


----------------- TB -------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stopwatch_TB is
--  Port ( );
end stopwatch_TB;

architecture Behavioral of stopwatch_TB is
signal CLK :  STD_LOGIC:='0';
signal Async_Reset :  STD_LOGIC;
signal Start :  STD_LOGIC;
signal CS :  INTEGER RANGE 0 TO 100;
signal S :  INTEGER RANGE 0 TO 60;
signal M :  INTEGER RANGE 0 TO 60;
component stopwatch
    Port ( CLK : in STD_LOGIC;
           Async_Reset : in STD_LOGIC;
           Start : in STD_LOGIC;
           CS : BUFFER INTEGER RANGE 0 TO 100;
           S : BUFFER INTEGER RANGE 0 TO 60;
           M : BUFFER INTEGER RANGE 0 TO 60);
end component;
constant period : time :=10 ms;
begin
DUT: stopwatch port map(CLK,Async_Reset,Start,CS,S,M);
CLK <= not CLK after (period/2);
Async_Reset <= '1','0' after (2*period);
stimulus: process
begin
Start<= '1';
wait for (2*period);
Start<= '0';
wait for (2.25*period);
Start<= '1';
wait;
end process;
end Behavioral;

