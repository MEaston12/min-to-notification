#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent
#SingleInstance Force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2

Menu, Tray, NoStandard
Menu, Tray, Add, &ShowServerWindow, ShowServerWindow
Menu, Tray, Icon, MineCraft.ico


Sleep, 10000
WinHide, cmd.exe
WinHide, java.exe
WinHide, Minecraft server
Return

ShowServerWindow:
WinShow, cmd.exe
WinShow, java.exe
WinShow, Minecraft server
Menu, Tray, DeleteAll
Menu, Tray, Add, &HideServerWindow, HideServerWindow
Return

HideServerWindow:
WinHide, cmd.exe
WinHide, java.exe
WinHide, Minecraft server
Menu, Tray, DeleteAll
Menu, Tray, Add, &ShowServerWindow, ShowServerWindow
Return