library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity SPI_TB is
--  Port ( );
end SPI_TB;

architecture Behavioral of SPI_TB is
    signal Parallel_in : STD_LOGIC_VECTOR (7 downto 0) :=(others=>'0');
    signal Data_ready_in : STD_LOGIC :='0';
    signal MISO_in : STD_LOGIC :='0';
    signal CLK : STD_LOGIC :='0';
    signal MISO : STD_LOGIC :='0';
    signal SPI_CLK : STD_LOGIC :='0';
    -------------------- in <=> out --------------------------
    signal CS : STD_LOGIC; 
    signal SCK : STD_LOGIC; 
    signal MOSI : STD_LOGIC;
    signal Parallel_out : STD_LOGIC_VECTOR (7 downto 0);
    signal Data_ready_out : STD_LOGIC;
    
    constant period : time := 20 ns;
begin

DUT: entity work.SPI port map(Parallel_in,
                                          Data_ready_in,
                                          MISO_in,
                                          CLK,
                                          MISO,
                                          SPI_CLK,
                                         ---------
                                          CS,
                                          SCK,
                                          MOSI,
                                          Parallel_out,
                                          Data_ready_out);

CLK <= not CLK after (period/2);
SPI_CLK <= not SPI_CLK after (period/2)*1.5;
MISO <= not MISO after (period/2)*2;

Data_ready_in <= '1' after 92 ns, '0' after 352 ns, '1' after 402 ns, '0' after 702 ns, '1' after 752 ns;
MISO_in <= '1' after 407.5 ns, '0' after 956.8 ns, '1' after 1111.85 ns;

Parallel_in <= b"1100_0010" after ((period/2)*1.5)*3;

end Behavioral;
