library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity convolution_TB is
end convolution_TB;

architecture behavior of convolution_TB is 
   constant conv_width : integer := 8;
   signal CLK : STD_LOGIC := '0';
   signal input_a : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
   signal input_x : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
   signal Y : STD_LOGIC_VECTOR (19 downto 0);
   
    component convolution
    generic(conv_width : integer := 8);
    port(
         CLK : in  STD_LOGIC;
         input_a : in  STD_LOGIC_VECTOR (conv_width-1 downto 0);
         input_x : in  STD_LOGIC_VECTOR (conv_width-1 downto 0);
         Y : out  STD_LOGIC_VECTOR (19 downto 0)
        );
    end component;

   -- Clock period definitions
   constant CLK_period : time := 90ns;

begin

   uut: convolution generic map(conv_width) port map (
          CLK => CLK,
          input_a => input_a,
          input_x => input_x,
          Y => Y
        );

CLK <= not CLK after CLK_period/2;

   -- Stimulus process
   stim_proc: process
   begin		
   
      input_a <= b"0000_1011"; input_x <= b"0001_1011"; 
      wait for CLK_period*2.25;
      input_a <= b"0001_1011"; input_x <= b"1001_1111"; 
      wait for CLK_period*3.66;
      input_a <= b"1001_1000"; input_x <= b"1001_1001"; 
      wait for CLK_period*4.25;
      input_a <= b"0000_0000"; input_x <= b"1001_0010"; 
      wait for CLK_period*2.25;
      input_a <= b"1001_1011"; input_x <= b"1001_1100"; 
      wait for CLK_period*5.25;
      input_a <= b"1001_1000"; input_x <= b"1000_1001"; 
      wait;
   end process;

end;
