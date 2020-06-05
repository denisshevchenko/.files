Config { font    = "xft:FiraCode Nerd Font Mono:pixelsize=16:antialias=true:hinting=true"
       , additionalFonts = [ "xft:FontAwesome:pixelsize=17" ]
       , bgColor = "#282A36"
       , fgColor = "#B45BCF"
       , position = Top
       , lowerOnStart = True
       , hideOnStart = False
       , allDesktops = True
       , persistent = True
       , commands = [
                      -- Time and date
                      Run Date "\xf133 %b %d %Y (%H:%M)" "date" 50
                      -- Cpu usage in percent
                    , Run Cpu ["-t", "\xf2db <total>%","-H","50","--high","red"] 20
                      -- Ram used number and percent
                    , Run Memory ["-t", "\xf233 <used>M (<usedratio>%)"] 20
                      -- Active keyboard layout.
                    , Run Kbd [("us", "\xf0ac EN"), ("ru", "\xf0ac RU")]
                      -- Battery status.
                    , Run BatteryP ["BAT0"]
                                   [ "-t", "<acstatus>"
                                   , "-L", "10", "-H", "70"
                                   , "-l", "red", "-h", "#19BA41"
                                   , "--", "-O", "\xf241 charging <left>%", "-o", "\xf241 <left>%"
                                   ] 10
                      -- Prints out the left side items such as workspaces, layout, etc.
                    , Run UnsafeStdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " %UnsafeStdinReader% }{ <fc=#fefefe>%kbd%</fc> <fc=#666666></fc> <fc=#b3afc2>%battery%</fc> <fc=#666666></fc> <fc=#FFB86C>%cpu%</fc> <fc=#666666></fc> <fc=#FF5555>%memory%</fc> <fc=#666666></fc> <fc=#8BE9FD>%date%</fc> "
       }
