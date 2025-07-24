library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity SPI is
    Port ( Parallel_in : in STD_LOGIC_VECTOR (7 downto 0);
           Data_ready_in : in STD_LOGIC;
           MISO_in : in STD_LOGIC;
           CLK : in STD_LOGIC;
           MISO : in STD_LOGIC;
           SPI_CLK : in STD_LOGIC;
           -------------------- in <=> out --------------------------
           CS : out STD_LOGIC; 
           SCK : out STD_LOGIC; 
           MOSI : out STD_LOGIC;
           Parallel_out : out STD_LOGIC_VECTOR (7 downto 0);
           Data_ready_out : out STD_LOGIC);
end SPI;

architecture Behavioral of SPI is
type state_type is (Idle, Send, Recieve);
signal present_st, next_st : state_type :=Idle;
signal bit_counter : integer range 0 to 7 :=7;
begin
---------------------------------------------------------
demo_p: process(CLK)
begin
if(CLK'event and CLK='1') then
present_st <= next_st;
end if;
end process;
---------------------------------------------------------
state_changer_p: process(Data_ready_in, MISO_in, present_st)
begin
--case present_st is 
--when Idle    => if(Data_ready_in='0')then next_st<=Idle; elsif(MISO_in='0')then next_st<=Send; else next_st<=Recieve;end if;
--when Send    => if(Data_ready_in='0')then next_st<=Idle; elsif(MISO_in='0')then next_st<=Send; else next_st<=Recieve;end if;
--when Recieve => if(Data_ready_in='0')then next_st<=Idle; elsif(MISO_in='0')then next_st<=Send; else next_st<=Recieve;end if;
--when others  => Idle; 
--end case;
if(Data_ready_in='0')then next_st<=Idle; elsif(MISO_in='0')then next_st<=Send; else next_st<=Recieve;end if; -- equall to the upper code!
end process;
---------------------------------------------------------
ALL_output_p: process(SPI_CLK)
begin
if(SPI_CLK'event and SPI_CLK='1') then
case present_st is 
when Idle    => CS<='0'; SCK<='0'; MOSI<='0'; Parallel_out<=(others=>'0'); Data_ready_out<='0'; 
when Send    => CS<='1'; SCK<=SPI_CLK; 
                bit_counter <= bit_counter - 1;
                MOSI<=Parallel_in(bit_counter); Parallel_out<=Parallel_in;
when Recieve => CS<='1'; SCK<=SPI_CLK; 
                bit_counter <= bit_counter - 1;
                MOSI<='0'; Parallel_out(bit_counter)<= MISO;
end case;

if(bit_counter=0)then bit_counter<=7; Data_ready_out<='1'; end if;

end if;
end process;
end Behavioral;
