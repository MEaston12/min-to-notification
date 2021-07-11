#SingleInstance Force
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.
SetTitleMatchMode(2)

;Loading config variables
launchPath := IniRead("conf.ini", "config", "launchPath")

processId := ""
;Run Script
Run(launchPath, A_ScriptDir , , &processId)

windowName := "ahk_pid " . processId

;Function Definitions
class ShowApp {
    Call(ItemName, ItemPos, MyMenu){
        WinShow(windowName)
        AddMenuItems("Hide")
    }
}

class HideApp {
    Call(ItemName, ItemPos, MyMenu){
        WinHide(windowName)
        AddMenuItems("Show")
    }
}

class BailOut {
    Call(ItemName, ItemPos, MyMenu) {
        ProcessClose(processId)
        ExitApp()
    }
}

;Tray Configurations
AddMenuItems(ShowOrHide) {
    A_TrayMenu.Delete()
    if(ShowOrHide == "Show") {
        A_TrayMenu.Add("&Show", ShowApp())
        A_TrayMenu.Default := "&Show"
    } else {
        A_TrayMenu.Add("&Hide", HideApp())
        A_TrayMenu.Default := "&Hide"
    }
    A_TrayMenu.Add("&Exit", BailOut())
}

AddMenuItems("Show")

WinWait(windowName)
WinHide(windowName)

ProcessWaitClose(processId)