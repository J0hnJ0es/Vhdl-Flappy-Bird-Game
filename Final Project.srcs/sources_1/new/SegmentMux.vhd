library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity SegmentMux is
Port ( clock: in std_logic;
        output: out std_logic_vector(3 downto 0);
    c: in integer range 0 to 99;
    o: out integer range 0 to 9);
end SegmentMux;
architecture Behavioral of SegmentMux is
signal temp: std_logic_vector(1 downto 0) := "00";
signal out_mux: std_logic_vector(3 downto 0) := "1111";
signal zero: integer range 0 to 9:= 0;
begin
process(clock)
begin
if(rising_edge(clock)) then
if temp="11" then
temp <= "00";
out_mux<="1111";
else
if(temp="00") then
out_mux<="1101";
o<=c/10;
elsif(temp="01") then
out_mux<="1110";
o<=c rem 10;
end if;
temp <= temp + "1";
end if;
end if;
end process;
output <= out_mux;
end Behavioral;