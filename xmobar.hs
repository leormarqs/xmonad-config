-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

-- This is setup for single 1366x768 monitor

Config {
    font = "xft:Fira Code Retina:size=8",
    bgColor = "#000000",
    fgColor = "#ffffff",
    position = Static { xpos = 0, ypos = 0, width = 1175 , height = 16 --3650 
},
    lowerOnStart = True,
    overrideRedirect=False,
    commands = [
          Run Weather "SBPA" ["-t","<tempC>C","-L","64","-H","77","-n",
			      "#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 600
            
        , Run MultiCpu ["-t","<fc=#96CBFF>CPU:</fc> <total0> <total1> <total2> <total3>",
			"-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10
          
        , Run Memory ["-t","<fc=#96CBFF>M:</fc> <usedratio>","-H","8192",
		      "-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10
          
        , Run Swap ["-t","<fc=#96CBFF>(</fc><usedratio><fc=#96CBFF>)</fc>",
		    "-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10

        , Run Network "wlp3s0" ["-t","<fc=#96CBFF>W:</fc> <rx>, <tx>",
				"-H","200","-L","10","-h","#FFB6B0",
				"-l","#CEFFAC","-n","#FFFFCC"] 10
          
        , Run Network "enp2s0" ["-t","<fc=#96CBFF>L:</fc> <rx>, <tx>",
				"-H","200","-L","10","-h","#FFB6B0",
				"-l","#CEFFAC","-n","#FFFFCC"] 10

        , Run BatteryP ["BAT1"] ["-t", "<fc=#96CBFF>B:</fc> <fc=#96CBFF>(</fc><left><fc=#96CBFF>)</fc> <acstatus>",
                                 "-L", "15", "-H", "85", "-n", "#FFFFCC", "-l", "#FFB6B0", "-h", "#CEFFAC",
                                 "--", "-O", "<fc=#CEFFAC>CHG</fc>", "-i", "<fc=#96CBFF>IDL</fc>", "-o", "<fc=#FFB6B0>DCHG</fc>" ] 10
        
        , Run Date "%_d %b %H:%M" "date" 10
        , Run Com ".xmonad/bin/volume" [] "volume" 10
	, Run Locks 
	, Run StdinReader

    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ %multicpu% | %memory% %swap% | %enp2s0% %wlp3s0% | %volume% | %locks% | %battery% | <fc=#FFFFCC>%date%</fc> %SBPA%"
}
