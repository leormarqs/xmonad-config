Config {
      font = "xft:Fira Code Retina:size=8"
    , bgColor = "#000000"
    , fgColor = "#ffffff"
    , position = Static { xpos = 0, ypos = 0, width = 1175, height = 16 }
    , lowerOnStart = True
    , overrideRedirect=False
    , commands = [
          Run MultiCpu [ "--template" , "<fc=#96CBFF>CPU:</fc> <total0> <total1> <total2> <total3>"
                       , "--Low"      , "30"
                       , "--High"     , "60"
                       , "--high"     , "#FFB6B0"
                       , "--low"      , "#CEFFAC"
                       , "--normal"    , "#FFFFCC"
                       , "--width"    , "3"
                       ] 10
          
        , Run Memory [ "--template" , "<fc=#96CBFF>M:</fc> <usedratio>"
                     , "--High"     , "8192"
                     , "--Low"      , "4096"
                     , "--high"     , "#FFB6B0"
                     , "--low"      , "#CEFFAC"
                     , "--normal"    , "#FFFFCC"
                     ] 10
          
        , Run Swap [ "--template" , "<fc=#96CBFF>(</fc><usedratio><fc=#96CBFF>)</fc>"
                   , "--High"     , "4096"
                   , "--Low"      , "2048"
                   , "--high"     , "#FFB6B0"
                   , "--low"      , "#CEFFAC"
                   , "--normal"   , "#FFFFCC"
                   ] 10

          -- network activity monitor (dynamic interface resolution)
        , Run DynNetwork [ "--template" , "<fc=#96CBFF><dev>:</fc> <rx>, <tx>"
                         , "--Low"      , "1000"       -- units: B/s
                         , "--High"     , "5000"       -- units: B/s
                         , "--low"      , "#CEFFAC"
                         , "--normal"   , "#FFFFCC"
                         , "--high"     , "#FFB6B0"
                         ] 10

        , Run BatteryP ["BAT1"] [ "--template" , "<fc=#96CBFF>B:</fc> <fc=#96CBFF>(</fc><left><fc=#96CBFF>)</fc> <acstatus>"
                                , "--Low"      , "15"
                                , "--High"     , "85"
                                , "--normal"   , "#FFFFCC"
                                , "--low"      , "#FFB6B0"
                                , "--high"     , "#CEFFAC"
                                , "--"
                                , "-O", "<fc=#CEFFAC>CHG</fc>"
                                , "-i", "<fc=#96CBFF>IDL</fc>"
                                , "-o", "<fc=#FFB6B0>DCHG</fc>"
                                ] 10
        
        , Run Date "%_d %b %H:%M" "date" 10
        , Run Com ".xmonad/bin/volume" [] "volume" 10
        , Run Locks 
        , Run StdinReader

    ]
    , sepChar = "%"
    , alignSep = "}{"
    , template = "%StdinReader% }{ %multicpu% | %memory% %swap% | %dynnetwork% | %volume% | %locks% | %battery% | <fc=#FFFFCC>%date%</fc>"
}
