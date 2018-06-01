 library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SYNC is
   Port (
       CLK: IN STD_LOGIC;
       HSYNC, VSYNC: OUT STD_LOGIC;
       R, G, B : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
       HPOS1: OUT INTEGER RANGE 0 TO 800;
       VPOS1: OUT INTEGER RANGE 0 TO 525;
       DRAW1: IN STD_LOGIC;
       DRAWBOX: IN STD_LOGIC;
       SPEED: IN INTEGER;
       --BOXES
       Xpos1: OUT INTEGER range 0 to 800; 
        Ypos1: OUT INTEGER range 0 to 525;     
        Xpos2: OUT INTEGER range 0 to 800; 
        Ypos2: OUT INTEGER range 0 to 525;     
        Xpos3: OUT INTEGER range 0 to 800; 
        Ypos3: OUT INTEGER range 0 to 525;    
        Xpos4: OUT INTEGER range 0 to 800; 
        Ypos4: OUT INTEGER range 0 to 525;     
        Xpos5: OUT INTEGER range 0 to 800; 
        Ypos5: OUT INTEGER range 0 to 525;     
        Xpos6: OUT INTEGER range 0 to 800; 
        Ypos6: OUT INTEGER range 0 to 525;     
        Xpos7: OUT INTEGER range 0 to 800; 
        Ypos7: OUT INTEGER range 0 to 525; 
        Xpos8: OUT INTEGER range 0 to 800; 
        Ypos8: OUT INTEGER range 0 to 525;
        SQ_X1: OUT INTEGER RANGE 0 TO 800;
        SQ_Y1: OUT INTEGER RANGE 0 TO 525;
        PAUSE: In std_logic;
        FLY: IN STD_LOGIC;
        SCORE: OUT INTEGER RANGE 0 TO 99;
        RESTART: IN STD_LOGIC;
        KOX: OUT INTEGER range 0 to 800;
        KOY: OUT INTEGER range 0 to 525;
        DRAWKO: IN STD_LOGIC
                
       );
       
end SYNC;

architecture Behavioral of SYNC is


--KO
SIGNAL KOXX:INTEGER RANGE 0 TO 800:=400;
SIGNAL KOYY:INTEGER RANGE 0 TO 525:=250;
SIGNAL KOPER: STD_LOGIC:='0';

--FINISH
SIGNAL RED: STD_LOGIC:='1';

--SCORE
SIGNAL POINT: INTEGER RANGE 0 TO 99;

SIGNAL HPOS: INTEGER RANGE 0 TO 800:=0;
SIGNAL VPOS: INTEGER RANGE 0 TO 525:=0;

--BIRD
SIGNAL X1: INTEGER RANGE 0 TO 800:=400;
SIGNAL Y1: INTEGER RANGE 0 TO 800:=300;

--BOXES
SIGNAL xXpos1: INTEGER range 0 to 800:=200; 
SIGNAL xYpos1: INTEGER range 0 to 525:=0;     
SIGNAL xXpos2: INTEGER range 0 to 800:=450; 
SIGNAL xYpos2: INTEGER range 0 to 525:=0;     
SIGNAL xXpos3: INTEGER range 0 to 800:=700; 
SIGNAL xYpos3: INTEGER range 0 to 525:=0;    
SIGNAL xXpos4: INTEGER range 0 to 800:=950; 
SIGNAL xYpos4: INTEGER range 0 to 525:=0;     
SIGNAL xXpos5: INTEGER range 0 to 800:=200; 
SIGNAL xYpos5: INTEGER range 0 to 525:=375;     
SIGNAL xXpos6: INTEGER range 0 to 800:=450; 
SIGNAL xYpos6: INTEGER range 0 to 525:=425;     
SIGNAL xXpos7: INTEGER range 0 to 800:=700; 
SIGNAL xYpos7: INTEGER range 0 to 525:=325; 
SIGNAL xXpos8: INTEGER range 0 to 800:=950; 
SIGNAL xYpos8: INTEGER range 0 to 525:=375;

SIGNAL RGBBOX: STD_LOGIC_VECTOR(3 DOWNTO 0); 


BEGIN

PROCESS(CLK, PAUSE)
BEGIN

IF(CLK'EVENT AND CLK='1') THEN

    IF(DRAWKO = '1') THEN 
        --IF KOPER = '1' THEN
            R <= "0110";
            G <= "1111";
            B <= "0110";
        --END IF;
    END IF;
    IF(DRAW1='1') THEN
--        IF(S(0)='1')THEN
            R <= (OTHERS => '1');
            G <= (OTHERS => '1');
            B <= (OTHERS => '0');
    END IF;
    IF(DRAWBOX = '1') THEN
        R <= "0000";
        G <= "1111";
        B <= "0000";
    END IF;        
    IF(DRAW1='0' AND DRAWBOX='0') THEN
    IF(RED = '1') THEN
        R <= "1000";
        G <= "0100";
        B <= "1001";
    ELSE
     R <= "1111";
     G <= "0000";
     B <= "0000";
   END IF;
   END IF;
   
   IF(HPOS<800) THEN
       HPOS <= HPOS+1;
   ELSE
       HPOS <= 0;
           IF(VPOS < 525) THEN
               VPOS<=VPOS+1;
           ELSE
           --RULES
           if(RESTART = '1')THEN
           X1<=400;
           Y1<=300;
           xXpos1<=200; 
           xYpos1<=0;     
           xXpos2<=450; 
           xYpos2<=0;     
           xXpos3<=700; 
           xYpos3<=0;    
           xXpos4<=950; 
           xYpos4<=0;     
           xXpos5<=200; 
           xYpos5<=375;     
           xXpos6<=450; 
           xYpos6<=425;     
           xXpos7<=700; 
           xYpos7<=325; 
           xXpos8<=950; 
           xYpos8<=375;
           POINT <= 0;
           RED <= '1';
           KOPER <= '0';
           
           END IF;
           if(PAUSE = '0') then
           else
            if((Y1 < xYpos1+200 and X1+25 > xXpos1 AND X1<xXpos1+100) or (Y1 < xYpos2+250 and X1+25 > xXpos2 AND X1<xXpos2+100) or 
               (Y1 < xYpos3+150 and X1+25 > xXpos3 AND X1<xXpos3+100) or (Y1 < xYpos4+260 and X1+25 > xXpos4 AND X1<xXpos4+100) or 
                   (Y1 > xYpos5-25 and X1+25 > xXpos5 AND X1<xXpos5+100) or (Y1 > xYpos6-25 and X1+25 > xXpos6 AND X1<xXpos6+100) or 
                   (Y1 > xYpos7-25 and X1+25 > xXpos7 AND X1<xXpos7+100) or (Y1 > xYpos8-25 and X1+25 > xXpos8 AND X1<xXpos8+100)) then
                   RED <= '0';
                   KOPER <= '1';
            else
                xXpos1 <= xXpos1 - 2;
                xXpos2 <= xXpos2 - 2;
                xXpos3 <= xXpos3 - 2;
                xXpos4 <= xXpos4 - 2;
                xXpos5 <= xXpos5 - 2;
                xXpos6 <= xXpos6 - 2;
                xXpos7 <= xXpos7 - 2;
                xXpos8 <= xXpos8 - 2;
                Y1<=Y1+3;
                
                IF(X1> xXpos1 and X1< xXpos1+3) or (X1> xXpos2 and X1< xXpos2+3) or (X1> xXpos3 and X1< xXpos3+3) or (X1> xXpos4 and X1< xXpos4+3) then
                    POINT <= POINT +1;
                END IF;
                
                IF(FLY='1')THEN
                    Y1<=Y1-6;
                END IF;  
--                    END IF; 
--                end if;
--                end if;
                end if;
                end if;
               VPOS<=0;
            END IF;
    END IF;
   IF(HPOS>16 AND HPOS<112) THEN
       HSYNC<='0';
   ELSE
       HSYNC<='1';
   END IF;
   IF(VPOS>10 AND VPOS <12) THEN
       VSYNC <='0';
   ELSE
       VSYNC <='1';
   END IF;
  
   IF ((HPOS > 0 AND HPOS < 160) OR (VPOS>10 AND VPOS<45)) THEN
   R<="1111";
   G<="0000";
   B<="0000";
   END IF;
END IF;

HPOS1 <= HPOS;
VPOS1 <= VPOS;
SCORE <= POINT;
    SQ_X1 <= X1;
    SQ_Y1 <= Y1;
    Xpos1 <= xXpos1;  
    Xpos2 <= xXpos2;  
    Xpos3 <= xXpos3;  
    Xpos4 <= xXpos4;  
    Xpos5 <= xXpos5;  
    Xpos6 <= xXpos6;  
    Xpos7 <= xXpos7;  
    Xpos8 <= xXpos8;  
    Ypos1 <= xYpos1;     
    Ypos2 <= xYpos2;     
    Ypos3 <= xYpos3;    
    Ypos4 <= xYpos4;     
    Ypos5 <= xYpos5;     
    Ypos6 <= xYpos6;     
    Ypos7 <= xYpos7; 
    Ypos8 <= xYpos8;
    KOX<=KOXX;
    KOY<=KOYY;
  
END PROCESS;
end Behavioral;
