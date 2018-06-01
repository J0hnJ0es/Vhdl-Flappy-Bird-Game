library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity GameOver is
    port (
     Xcur: in INTEGER range 0 to 800; 
     Ycur: in INTEGER range 0 to 525;
     Xpos1: in INTEGER range 0 to 800; 
     Ypos1: in INTEGER range 0 to 525;
     DRAW: OUT STD_LOGIC);
end GameOver;

architecture Behavioral of GameOver is

begin
process(xcur, ycur)
begin

IF( 
    (Xcur>Xpos1 AND Xcur<(Xpos1+20) AND Ycur>Ypos1 AND Ycur<(Ypos1+100)) OR 
    (Xcur>Xpos1+60 AND Xcur<(Xpos1+80) AND Ycur>Ypos1 AND Ycur<(Ypos1+20)) OR 
    (Xcur>Xpos1+40 AND Xcur<(Xpos1+60) AND Ycur>Ypos1+20 AND Ycur<(Ypos1+40)) OR 
    (Xcur>Xpos1+20 AND Xcur<(Xpos1+40) AND Ycur>Ypos1+40 AND Ycur<(Ypos1+60)) OR 
    (Xcur>Xpos1+40 AND Xcur<(Xpos1+60) AND Ycur>Ypos1+60 AND Ycur<(Ypos1+80)) OR
    (Xcur>Xpos1+60 AND Xcur<(Xpos1+80) AND Ycur>Ypos1+80 AND Ycur<(Ypos1+100)) OR
    --Dor
    (Xcur>Xpos1+90 AND Xcur<(Xpos1+100) AND Ycur>Ypos1+90 AND Ycur<(Ypos1+100)) OR        
    --O
    (Xcur>Xpos1+110 AND Xcur<(Xpos1+130) AND Ycur>Ypos1 AND Ycur<(Ypos1+100)) OR 
    (Xcur>Xpos1+130 AND Xcur<(Xpos1+150) AND Ycur>Ypos1 AND Ycur<(Ypos1+20)) OR 
    (Xcur>Xpos1+110 AND Xcur<(Xpos1+130) AND Ycur>Ypos1+80 AND Ycur<(Ypos1+100)) OR 
    (Xcur>Xpos1+150 AND Xcur<(Xpos1+170) AND Ycur>Ypos1 AND Ycur<(Ypos1+100))) THEN
    DRAW<='1';
ELSE
    DRAW<='0';
END IF;
end process;
END Behavioral; 