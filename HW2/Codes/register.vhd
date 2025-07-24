library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg is
    generic(SR_width : integer := 8);
    Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Enable : in STD_LOGIC;
           Din : in STD_LOGIC_VECTOR (SR_width-1 downto 0);
           Dout : out STD_LOGIC_VECTOR (SR_width-1 downto 0));
end reg;

architecture Behavioral of reg is
signal temp_dout : STD_LOGIC_VECTOR (SR_width-1 downto 0) :=(others => '0');
begin

process(CLK)
begin


if (clk'event and clk='1') then

    if (reset='1') then
    temp_dout <= (others => '0');
    elsif (enable='1') then
    temp_dout <= din;
    end if;

end if;
end process;
dout <= temp_dout;
end Behavioral;
