library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity VGA is
    Port (
        CLOCK_24 :IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        VGA_HS, VGA_VS: OUT STD_LOGIC;
        VGA_R, VGA_G, VGA_B : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        PAUSE: IN STD_LOGIC;
        FLY: IN STD_LOGIC;
        OUTPUTS: out std_logic_vector(6 downto 0);
        MUX: out std_logic_vector(3 downto 0);
        RESTART: IN STD_LOGIC
         );
end VGA;

ARCHITECTURE Behavior OF VGA IS


--GAME OVER
SIGNAL KOX: INTEGER range 0 to 800; 
SIGNAL KOY: INTEGER range 0 to 525;
SIGNAL DRAWKO: STD_LOGIC;
--segment
SIGNAL LOWFREQ: STD_LOGIC;
SIGNAL OUTSUM: INTEGER RANGE 0 TO 9;
SIGNAL SUM: INTEGER range 0 to 99;
SIGNAL muxOutput: STD_LOGIC_VECTOR(3 downto 0);
signal segments: std_logic_vector(6 downto 0);

--Speeds
Signal speed: integer:= 3;

--BOXES
SIGNAL Xpos1: INTEGER range 0 to 800; 
SIGNAL Ypos1: INTEGER range 0 to 525;     
SIGNAL Xpos2: INTEGER range 0 to 800; 
SIGNAL Ypos2: INTEGER range 0 to 525;     
SIGNAL Xpos3: INTEGER range 0 to 800; 
SIGNAL Ypos3: INTEGER range 0 to 525;    
SIGNAL Xpos4: INTEGER range 0 to 800; 
SIGNAL Ypos4: INTEGER range 0 to 525;     
SIGNAL Xpos5: INTEGER range 0 to 800; 
SIGNAL Ypos5: INTEGER range 0 to 525;     
SIGNAL Xpos6: INTEGER range 0 to 800; 
SIGNAL Ypos6: INTEGER range 0 to 525;     
SIGNAL Xpos7: INTEGER range 0 to 800; 
SIGNAL Ypos7: INTEGER range 0 to 525; 
SIGNAL Xpos8: INTEGER range 0 to 800; 
SIGNAL Ypos8: INTEGER range 0 to 525; 
SIGNAL DRAWBOX: STD_LOGIC;

--DRAWS
SIGNAL DRAW1: STD_LOGIC;

--BIRD
SIGNAL SQ_X1: INTEGER RANGE 0 TO 800;
SIGNAL SQ_Y1: INTEGER RANGE 0 TO 800;

--SYNC
SIGNAL HPOS: INTEGER RANGE 0 TO 800;
SIGNAL VPOS: INTEGER RANGE 0 TO 525;

SIGNAL VGACLK: STD_LOGIC;
SIGNAL RESET: STD_LOGIC:='0';


----------------------------------------
COMPONENT GameOver is
    port (
     Xcur: in INTEGER range 0 to 800; 
     Ycur: in INTEGER range 0 to 525;
     Xpos1: in INTEGER range 0 to 800; 
     Ypos1: in INTEGER range 0 to 525;
     DRAW: OUT STD_LOGIC);
end COMPONENT;
-----------------------------------------
COMPONENT SegmentDecoder is
Port (
    input: in integer range 0 to 9;
    segment_output: out std_logic_vector(6 downto 0));
end COMPONENT;
---------------------------------------------
COMPONENT SegmentMux is
Port ( clock: in std_logic;
        output: out std_logic_vector(3 downto 0);
    c: in integer range 0 to 99;
    o: out integer range 0 to 9);
end COMPONENT;
-------------------------------------
COMPONENT segmentClk is
Port ( internalClock: in std_logic;
        lowFreqClock: out std_logic );
end COMPONENT;
---------------------------------------
COMPONENT BOXES is
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
end COMPONENT;
-----------------------------------------
COMPONENT SQ is
    port (
     Xcur: IN INTEGER range 0 to 800; 
     Ycur: IN INTEGER range 0 to 525; 
     Xpos: IN INTEGER range 0 to 800; 
     Ypos: IN INTEGER range 0 to 525; 
     DRAW: OUT STD_LOGIC);
end COMPONENT;
------------------------------------------
COMPONENT PLL IS
        PORT(
            clk_in_clk: in std_logic;--:= 'X';
            reset_reset : in std_logic;--:= 'X';
            clk_out_clk: out std_logic
        );
END COMPONENT;
------------------------------------------
COMPONENT SYNC IS
    Port (
        CLK: IN STD_LOGIC;
        HSYNC, VSYNC: OUT STD_LOGIC;
        R, G, B : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        HPOS1: OUT INTEGER RANGE 0 TO 800;
        VPOS1: OUT INTEGER RANGE 0 TO 525;
        DRAW1: IN STD_LOGIC;
        DRAWBOX: IN STD_LOGIC;
        speed: in integer;
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
        --ko
        KOX: OUT INTEGER range 0 to 800;
        KOY: OUT INTEGER range 0 to 525;
        DRAWKO: IN STD_LOGIC
        
                 
--         RGB: out STD_LOGIC_VECTOR(3 DOWNTO 0)
         
        );
END COMPONENT SYNC;

BEGIN

VgaClock: PLL PORT MAP(CLOCK_24(0), RESET, VGACLK);
Game: SYNC PORT MAP(VGACLK, VGA_HS, VGA_VS, VGA_R, VGA_G, VGA_B, HPOS, VPOS, DRAW1, DRAWBOX,speed,
 Xpos1,Ypos1,Xpos2,Ypos2,Xpos3,Ypos3,Xpos4,Ypos4,Xpos5,Ypos5,Xpos6,Ypos6,Xpos7,Ypos7,Xpos8,Ypos8,
 SQ_X1,SQ_Y1, PAUSE, FLY, SUM, RESTART,KOX,KOY,DRAWKO);
Bird: SQ PORT MAP(HPOS,VPOS,SQ_X1,SQ_Y1,DRAW1);
BOX: BOXES PORT MAP(HPOS,VPOS,Xpos1,Ypos1,Xpos2,Ypos2,Xpos3,Ypos3,Xpos4,
 Ypos4, Xpos5,Ypos5,Xpos6,Ypos6,Xpos7,Ypos7,Xpos8,Ypos8,DRAWBOX);
segClk: SegmentClk PORT MAP(VGACLK, LOWFREQ);
segMux: SegmentMux PORT MAP(LOWFREQ, muxOutput, SUM, OUTSUM);
segDec: SegmentDecoder PORT MAP(OUTSUM,segments);
KO: GameOver PORT MAP(HPOS,VPOS,KOX,KOY,DRAWKO);

MUX <= muxOutput;
OUTPUTS <= segments;
END Behavior;