library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_tb is
end reg_tb;

architecture behavior of reg_tb is 
    -- Component Declaration for the Unit Under Test (UUT)
    component reg
    generic(SR_width : integer := 8);
    port(
         CLK : in  STD_LOGIC;
         Reset : in  STD_LOGIC;
         Enable : in  STD_LOGIC;
         Din : in  STD_LOGIC_VECTOR (SR_width-1 downto 0);
         Dout : out  STD_LOGIC_VECTOR (SR_width-1 downto 0)
        );
    end component;

   --Inputs
   constant SR_width : integer := 8;
   signal CLK : STD_LOGIC := '0';
   signal Reset : STD_LOGIC := '0';
   signal Enable : STD_LOGIC := '0';
   signal Din : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');

    --Outputs
   signal Dout : STD_LOGIC_VECTOR (7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 50 ns;

begin

	-- Instantiate the Unit Under Test (UUT)
   uut: reg generic map (SR_width => SR_width)
        port map (
           CLK => CLK,
           Reset => Reset,
           Enable => Enable,
           Din => Din,
           Dout => Dout
          );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 500 ns.	
		Reset <= '1'; 
      -- insert stimulus here 
      wait for CLK_period*6.5;
      Enable <= '1'; Din <= "10011011"; 
      wait for CLK_period*4;
      Din <= "10000000"; 
      wait for CLK_period*8;
      Din <= "10000010"; 
      wait for CLK_period*7;
       Enable <= '0'; 
      wait for CLK_period*10;
      Din <= "00000000";
      wait for CLK_period*5;
      Din <= "00000001";
      wait;
   end process;

end;
