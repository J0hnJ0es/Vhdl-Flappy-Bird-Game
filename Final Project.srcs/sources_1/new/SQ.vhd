library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity SQ is
    port (
     Xcur: IN INTEGER range 0 to 800; 
     Ycur: IN INTEGER range 0 to 525; 
     Xpos: IN INTEGER range 0 to 800; 
     Ypos: IN INTEGER range 0 to 525;
     DRAW: OUT STD_LOGIC);
end SQ;

architecture Behavioral of SQ is
begin
process(xpos)
begin
IF((Xcur>Xpos AND Xcur<(Xpos+25) AND Ycur>Ypos AND Ycur<(Ypos+25))) THEN
    DRAW<='1';
ELSE
    DRAW<='0';
END IF;
end process;
END Behavioral;