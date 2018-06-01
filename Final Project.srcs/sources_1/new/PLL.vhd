library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--This drops to frequency from 50MHz  to 1Hz
entity PLL is
Port ( clk_in_clk: in std_logic;
    reset_reset : in std_logic;
    clk_out_clk: out std_logic );
end PLL;
--CLOCK
architecture Behavioral of PLL is
signal divider: std_logic_vector(24 downto 0) := "0000000000000000000000001"; --25,175,000 in binary
signal counter: std_logic_vector(24 downto 0) := "0000000000000000000000000";
signal hertzClock : std_logic := '0';
begin
    output: process(clk_in_clk, reset_reset)
begin
if (rising_edge(clk_in_clk)) then
if counter = divider then
counter <= "0000000000000000000000000";
hertzClock <= not hertzClock;
elsif (reset_reset = '1') then 
        hertzClock <= not hertzClock;
        counter <= "0000000000000000000000000";
else
counter <= counter + "1";
end if;
end if;
end process output;
clk_out_clk <= hertzClock;
end Behavioral;
