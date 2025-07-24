library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity DPRAM is 
    GENERIC(WIDTH : INTEGER := 8;
            LENGTH : INTEGER := 256;
            Read : std_logic := '0');
    Port ( DiA,DiB : in STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
           AddrA,AddrB : in integer range 0 TO LENGTH-1;
           DoA,DoB : out STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
           CLKA,CLKB : in STD_LOGIC;
           R_WA,R_WB: in STD_LOGIC;
           EnA,EnB : in STD_LOGIC);
end DPRAM;

architecture Behavioral of DPRAM is

subtype Byte is STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
type RAM_type is array (0 to Length-1) of Byte;
shared variable RAM : RAM_type;

begin

A: process(CLKA)
begin
if (CLKA'event and CLKA='1') then
    if (ENA='1') then 
        if (R_WA = Read) then DoA <= RAM(AddrA); --Reading
        else RAM(AddrA) := DiA; --Writing                     
        end if;
    end if;
end if;
end process;

B: process(CLKB)
begin
if (CLKB'event and CLKB='1') then
    if (ENB='1') then 
        if (R_WB = Read) then DoB <= RAM(AddrB); --Reading
        else RAM(AddrB) := DiB; --Writing                     
        end if;
    end if;
end if;
end process;
end Behavioral;
