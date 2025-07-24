library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity convolution is
    generic(conv_width : integer := 8);
    Port ( CLK : in STD_LOGIC;
           input_a : in STD_LOGIC_VECTOR (conv_width-1 downto 0);
           input_x : in STD_LOGIC_VECTOR (conv_width-1 downto 0);
           Y : out STD_LOGIC_VECTOR (19 downto 0));
end convolution;

architecture Behavioral of convolution is
   signal W1,W2 : STD_LOGIC_VECTOR (conv_width-1 downto 0);
   signal W3 : STD_LOGIC_VECTOR (15 downto 0);
   signal W4,W5 : STD_LOGIC_VECTOR (19 downto 0);
   signal W6 : STD_LOGIC;
begin

inA: entity work.reg generic map(8)port map(CLK,'0','1',input_a,W1);
inX: entity work.reg generic map(8)port map(CLK,'0','1',input_x,W2);
multiplier: entity work.multiplier generic map(8)port map(W1,W2,W3);
adder: entity work.adder generic map(16,20)port map(W3,W4,W5);
adder_reg: entity work.reg generic map(20)port map(CLK,W6,'1',W5,W4);
counter: entity work.counter generic map(9) port map(RCO=>W6,CLK=>clk);
output_reg: entity work.reg generic map(20)port map(CLK,'0',W6,W5,Y);
end Behavioral;
