; © 2021 XHZMC.
; 使用 CapsLock 键切换中英文的 AHK 小脚本。
; 要求：需要支持 Ctrl+Space 操作的输入法，例如微软拼音输入法。

CapsLock::
if GetKeyState("CapsLock", "T")
{
    KeyWait,CapsLock,T0.5
    if not(ErrorLevel)
    {
    SetCapsLockState, Off
    }
}
; 大写锁定开启时，按下 CapsLock 键即可关闭大写锁定。
else
{
    KeyWait,CapsLock,T0.5
    if not(ErrorLevel)
    {
        Send, ^{Space}
        ; 短按 CapsLock 键，发送 Ctrl+Space 以切换中英文。
    }
    else
    {
        KeyWait,CapsLock
        SetCapsLockState, On
        ; 长按 CapsLock 键 0.5 秒，仍可开启大写锁定。
    }

}
Return
