;Read in config vars
iconPath := IniRead("conf.ini", "config", "iconPath", "")
launchPath := IniRead("conf.ini", "config", "launchPath")

;Read in main script and replace launchPath
script := FileRead("min-to-notification.ah2")
launchReg := "launchPath := .*"
script := RegexReplace(script, launchReg, "launchPath := `"" . launchPath . "`"")

FileAppend(script, "./start.ah2")

compileString := "./Compiler/Ahk2Exe.exe /in ./start.ah2 /out ./out/start.exe /icon " . iconPath . " /ahk ./Compiler/AutoHotkey.exe"
RunWait(compileString)

FileDelete("./start.ah2")