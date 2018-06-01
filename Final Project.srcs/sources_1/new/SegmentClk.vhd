library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--It drops to frequency from 50MHz to 1Hz
entity segmentClk is
Port ( internalClock: in std_logic;
        lowFreqClock: out std_logic );
end segmentClk;
architecture Behavioral of segmentClk is
signal divider: std_logic_vector(19 downto 0) := "00001011011100110101"; --25,000,000 in binary
signal counter: std_logic_vector(19 downto 0) := "00000000000000000000";
signal hertzClock : std_logic := '0';
begin
process(internalClock)
begin
if (rising_edge(internalClock)) then
if counter = divider then
counter <= "00000000000000000000";
hertzClock <= not hertzClock;
else
counter <= counter + "1";
end if;
end if;
end process output;
lowFreqClock <= hertzClock;
end Behavioral;