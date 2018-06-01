library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity SegmentDecoder is
Port (
    input: in integer range 0 to 9;
    segment_output: out std_logic_vector(6 downto 0));
end SegmentDecoder;
architecture Behavioral of SegmentDecoder is
signal temp: std_logic_vector(6 downto 0):="0000000";
begin
process(input)
begin
if(input = 0) then
temp <= "0000001";
elsif(input = 1) then
temp <= "1001111";
--end if;
elsif(input = 2) then
temp <= "0010010";
--end if;
elsif(input = 3) then
temp <= "0000110";
--end if;
elsif(input = 4) then
temp <= "1001100";
--end if;
elsif(input = 5) then
temp <= "0100100";
--end if;
elsif(input = 6) then
temp <= "0100000";
--end if;
elsif(input = 7) then
temp <= "0001111";
--end if;
elsif(input = 8) then
temp <= "0000000";
--end if;
elsif(input = 9) then
temp <= "0000100";
else
end if;
end process;
segment_output <= temp;
end Behavioral;