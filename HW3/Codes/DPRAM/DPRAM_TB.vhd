library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity DPRAM_tb is
end DPRAM_tb;

architecture Behavioral of DPRAM_tb is
    constant WIDTH : integer := 8;
    constant LENGTH : integer := 256;
    signal DiA,DiB : STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0):=(others=>'0');
    signal AddrA : integer range 0 TO LENGTH-1 :=0;
    signal AddrB : integer range 0 TO LENGTH-1 :=1;
    signal DoA,DoB : STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0):=(others=>'0');
    signal CLKA,CLKB : STD_LOGIC :='0';
    signal R_WA,R_WB : STD_LOGIC :='1';
    signal EnA,EnB : STD_LOGIC:='1';
    
    constant periodA : time := 9.33 ns;
    constant periodB : time := 9.33 ns;
begin
    UUT: entity work.DPRAM generic map(WIDTH, LENGTH, '0')
         port map(DiA, DiB, AddrA, AddrB, DoA, DoB, CLKA, CLKB, R_WA, R_WB, EnA, EnB);
       
        CLKA <= not CLKA after PeriodA/2;
        CLKB <= not CLKB after PeriodB/2;
       
	 addra <= 1 after 10 ns, 3 after 20 ns, 5 after 30 ns, 7 after 40 ns, 9 after 50 ns,
			  4 after 60 ns, 9 after 70 ns, 10 after 80 ns, 3 after 90 ns, 6 after 100 ns ;
				  
	 addrb <= 2 after 10 ns, 4 after 20 ns, 6 after 30 ns, 8 after 40 ns, 10 after 50 ns,
			  2 after 60 ns, 8 after 70 ns, 1 after 80 ns, 5 after 90 ns, 7 after 100 ns ; 
 
     dia <= X"0F" after 10 ns, X"09" after 20 ns, X"A6" after 30 ns, X"F7" after 40 ns,  X"E9" after 50 ns; 
     dib <= X"0D" after 10 ns, X"04" after 20 ns, X"A6" after 30 ns, X"D7" after 40 ns, X"FD" after 50 ns ;
	 
	 r_wa <= '1' after 4 ns , '0' after 55 ns;
     r_wb <= '1' after 4 ns , '0' after 55 ns;

end Behavioral;
