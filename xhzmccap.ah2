; © 2021 XHZMC.
; 使用 CapsLock 键切换中英文的 AHK 小脚本。
; 要求：需要支持 Ctrl+Space 操作的输入法，例如微软拼音输入法。

CapsLock::
{
    if (GetKeyState("CapsLock", "T")) {
        if (KeyWait("CapsLock", "T0.5")) {
            SetCapsLockState(false)
        }
    } else {
        if (KeyWait("CapsLock", "T0.5")) {
            Send("^ ")
            ; 短按 CapsLock 键，发送 Ctrl+Space 以切换中英文。
        } else {
            KeyWait("CapsLock")
            SetCapsLockState(true)
            ; 长按 CapsLock 键 0.5 秒，仍可开启大写锁定。
        }
    }
}
