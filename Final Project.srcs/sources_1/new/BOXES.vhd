library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity BOXES is
    port (
     Xcur: in INTEGER range 0 to 800; 
     Ycur: in INTEGER range 0 to 525;
     Xpos1: in INTEGER range 0 to 800; 
     Ypos1: in INTEGER range 0 to 525;     
     Xpos2: in INTEGER range 0 to 800; 
     Ypos2: in INTEGER range 0 to 525;     
     Xpos3: in INTEGER range 0 to 800; 
     Ypos3: in INTEGER range 0 to 525;    
     Xpos4: in INTEGER range 0 to 800; 
     Ypos4: in INTEGER range 0 to 525;     
     Xpos5: in INTEGER range 0 to 800; 
     Ypos5: in INTEGER range 0 to 525;     
     Xpos6: in INTEGER range 0 to 800; 
     Ypos6: in INTEGER range 0 to 525;     
     Xpos7: in INTEGER range 0 to 800; 
     Ypos7: in INTEGER range 0 to 525; 
     Xpos8: in INTEGER range 0 to 800; 
     Ypos8: in INTEGER range 0 to 525;
     DRAW: OUT STD_LOGIC);
end BOXES;

architecture Behavioral of BOXES is

begin
process(xcur, ycur)
begin
IF((Xcur>Xpos1 AND Xcur<(Xpos1+100) AND Ycur>Ypos1 AND Ycur<(Ypos1+200)) OR 
    (Xcur>Xpos2 AND Xcur<(Xpos2+100) AND Ycur>Ypos2 AND Ycur<(Ypos2+250)) OR 
    (Xcur>Xpos3 AND Xcur<(Xpos3+100) AND Ycur>Ypos3 AND Ycur<(Ypos3+150)) OR 
    (Xcur>Xpos4 AND Xcur<(Xpos4+100) AND Ycur>Ypos4 AND Ycur<(Ypos4+260)) OR 
    (Xcur>Xpos5 AND Xcur<(Xpos5+100) AND Ycur>Ypos5 AND Ycur<(Ypos5+150)) OR 
    (Xcur>Xpos6 AND Xcur<(Xpos6+100) AND Ycur>Ypos6 AND Ycur<(Ypos6+100)) OR 
    (Xcur>Xpos7 AND Xcur<(Xpos7+100) AND Ycur>Ypos7 AND Ycur<(Ypos7+200)) OR 
    (Xcur>Xpos8 AND Xcur<(Xpos8+100) AND Ycur>Ypos8 AND Ycur<(Ypos8+150))) THEN
    DRAW<='1';
ELSE
    DRAW<='0';
END IF;

end process;
END Behavioral;

--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
--entity BOXES is
--    port (
--     Xcur: in INTEGER range 0 to 800; 
--     Ycur: in INTEGER range 0 to 525;
--     Speed: in integer;
--     Xpos1: out INTEGER range 0 to 800; 
--     Ypos1: out INTEGER range 0 to 525;     
--     Xpos2: out INTEGER range 0 to 800; 
--     Ypos2: out INTEGER range 0 to 525;     
--     Xpos3: out INTEGER range 0 to 800; 
--     Ypos3: out INTEGER range 0 to 525;    
--     Xpos4: out INTEGER range 0 to 800; 
--     Ypos4: out INTEGER range 0 to 525;     
--     Xpos5: out INTEGER range 0 to 800; 
--     Ypos5: out INTEGER range 0 to 525;     
--     Xpos6: out INTEGER range 0 to 800; 
--     Ypos6: out INTEGER range 0 to 525;     
--     Xpos7: out INTEGER range 0 to 800; 
--     Ypos7: out INTEGER range 0 to 525; 
--     Xpos8: out INTEGER range 0 to 800; 
--     Ypos8: out INTEGER range 0 to 525;
--     DRAW: OUT STD_LOGIC);
--end BOXES;

--architecture Behavioral of BOXES is
--SIGNAL xXpos1: INTEGER range 0 to 800:=200; 
--SIGNAL xYpos1: INTEGER range 0 to 525:=0;     
--SIGNAL xXpos2: INTEGER range 0 to 800:=350; 
--SIGNAL xYpos2: INTEGER range 0 to 525:=0;     
--SIGNAL xXpos3: INTEGER range 0 to 800:=500; 
--SIGNAL xYpos3: INTEGER range 0 to 525:=0;    
--SIGNAL xXpos4: INTEGER range 0 to 800:=650; 
--SIGNAL xYpos4: INTEGER range 0 to 525:=0;     
--SIGNAL xXpos5: INTEGER range 0 to 800:=200; 
--SIGNAL xYpos5: INTEGER range 0 to 525:=375;     
--SIGNAL xXpos6: INTEGER range 0 to 800:=350; 
--SIGNAL xYpos6: INTEGER range 0 to 525:=425;     
--SIGNAL xXpos7: INTEGER range 0 to 800:=500; 
--SIGNAL xYpos7: INTEGER range 0 to 525:=325; 
--SIGNAL xXpos8: INTEGER range 0 to 800:=650; 
--SIGNAL xYpos8: INTEGER range 0 to 525:=375;
--SIGNAL RGBBOX: STD_LOGIC_VECTOR(3 DOWNTO 0); 
--SIGNAL DRAWBOX: STD_LOGIC;

--begin
--process(xcur, ycur)
--begin
--IF((Xcur>xXpos1 AND Xcur<(xXpos1+50) AND Ycur>xYpos1 AND Ycur<(xYpos1+200)) OR 
--    (Xcur>xXpos2 AND Xcur<(xXpos2+50) AND Ycur>xYpos2 AND Ycur<(xYpos2+250)) OR 
--    (Xcur>xXpos3 AND Xcur<(xXpos3+50) AND Ycur>xYpos3 AND Ycur<(xYpos3+150)) OR 
--    (Xcur>xXpos4 AND Xcur<(xXpos4+50) AND Ycur>xYpos4 AND Ycur<(xYpos4+260)) OR 
--    (Xcur>xXpos5 AND Xcur<(xXpos5+50) AND Ycur>xYpos5 AND Ycur<(xYpos5+150)) OR 
--    (Xcur>xXpos6 AND Xcur<(xXpos6+50) AND Ycur>xYpos6 AND Ycur<(xYpos6+100)) OR 
--    (Xcur>xXpos7 AND Xcur<(xXpos7+50) AND Ycur>xYpos7 AND Ycur<(xYpos7+200)) OR 
--    (Xcur>xXpos8 AND Xcur<(xXpos8+50) AND Ycur>xYpos8 AND Ycur<(xYpos8+150))) THEN
--    DRAW<='1';
--ELSE
--    DRAW<='0';
--END IF;
--Xpos1 <= xXpos1-speed;
--Xpos2 <= xXpos2-speed;
--Xpos3 <= xXpos3-speed;
--Xpos4 <= xXpos4-speed;
--Xpos5 <= xXpos5-speed;
--Xpos6 <= xXpos6-speed;
--Xpos7 <= xXpos7-speed;
--Xpos8 <= xXpos8-speed;

--end process;
--END Behavioral;