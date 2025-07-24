library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity LIFO is
    generic (width : integer :=8;
             length : integer :=256;
             Write : std_logic :='1');
             
    port (  Di : in std_logic_vector(width-1 downto 0);
            Addr : in integer range 0 to length-1 ;
            Reset : in std_logic;
            Do : out std_logic_vector(width-1 downto 0);
            Rd_Wr : in std_logic;
            CLK : in std_logic;
            SP : buffer integer range 0 to Length-1;
            Full : buffer  std_logic:='0';
            Empty : buffer std_logic:='1');
end entity LIFO;

architecture behavorial of LIFO is
--signal SP : integer range 0 to Length-1 :=0;

subtype Byte is std_logic_vector(width-1 downto 0);
type LIFO_type is array (0 to length-1) of Byte; 
signal memory : LIFO_type;

begin   
    process(CLK,reset)
    begin
    if (Reset='1') then SP <= Addr;
    elsif (CLK'event and CLK='1') then 
        if (Rd_Wr=Write and Full/='1') then memory(SP)<=Di; SP<=SP+1;
        elsif (Rd_Wr/=Write and Empty/='1') then Do<=memory(SP-1); SP<=SP-1;   
        end if;   
    end if;
    end process;
Full <= '1' when SP=Length else '0';
Empty <= '1' when SP=Addr else '0';
end architecture behavorial;
