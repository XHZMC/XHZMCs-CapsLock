if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%" 
   ExitApp
}
; 以管理员身份运行。

#NoEnv

SetStoreCapslockMode, Off

CapsLock::
if GetKeyState("CapsLock", "T")
{
    SetCapsLockState, Off
}
; 大写锁定开启，按下即可关闭大写锁定。
else
{
    KeyWait,CapsLock,T0.5
    if not(ErrorLevel)
    {
        Send, ^{Space}
        ; 短按CapsLock键，发送Ctrl+空格以切换中英文。
    }
    else
    {
        KeyWait,CapsLock
        SetCapsLockState, On
        ; 长按CapsLock键0.5秒，仍可开启大写锁定。
    }
}
; 大写锁定关闭，短按切换中英文，长按开启大写锁定。
Return