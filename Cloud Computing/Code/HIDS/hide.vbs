const DontWaitUntilFinished = false, ShowWindow = 1, DontShowWindow = 0, WaitUntilFinished = true
set oShell = WScript.CreateObject("WScript.Shell")
command = "C:\Users\abc\Documents\NetBeansProjects\Random\netutil.bat" & args
oShell.Run command, DontShowWindow, WaitUntilFinished