/**
 * SnapActiveWindow resizes and moves (snaps) the active window to a given position.
 * @param {string} winPlaceVertical   The vertical placement of the active window.
 *                                    Expecting "bottom" or "middle", otherwise assumes
 *                                    "top" placement.
 * @param {string} winPlaceHorizontal The horizontal placement of the active window.
 *                                    Expecting "left", "right", "middle", otherwise assumes
 *                                    window should span the "full" width of the monitor.
 * @param {string} winSizeHeight      The height of the active window in relation to
 *                                    the active monitor's height. Expecting "half" size,
 *                                    otherwise will resize window to a "third".
 */
SnapActiveWindow(winPlaceVertical, winPlaceHorizontal, winSizeHeight) {
    WinGet activeWin, ID, A
    activeMon := GetMonitorIndexFromWindow(activeWin)

    SysGet, MonitorWorkArea, MonitorWorkArea, %activeMon%

    if (winSizeHeight == "half") {
        height := (MonitorWorkAreaBottom - MonitorWorkAreaTop)/2
    } else if (winSizeHeight == "full") {
        height := MonitorWorkAreaBottom
    } else {
        height := (MonitorWorkAreaBottom - MonitorWorkAreaTop)/3
    }

    if (winPlaceHorizontal == "left") {
        posX  := MonitorWorkAreaLeft
        width := (MonitorWorkAreaRight - MonitorWorkAreaLeft)/3
    } else if (winPlaceHorizontal == "right") {
        posX  := MonitorWorkAreaLeft + 2*(MonitorWorkAreaRight - MonitorWorkAreaLeft)/3
        width := (MonitorWorkAreaRight - MonitorWorkAreaLeft)/3
    } else if (winPlaceHorizontal == "middle") {
        posX  := MonitorWorkAreaLeft + (MonitorWorkAreaRight - MonitorWorkAreaLeft)/3
        width := (MonitorWorkAreaRight - MonitorWorkAreaLeft)/3
    } else {
        posX  := MonitorWorkAreaLeft
        width := MonitorWorkAreaRight - MonitorWorkAreaLeft
    }

    if (winPlaceVertical == "bottom") {
        posY := MonitorWorkAreaBottom - height
    } else if (winPlaceVertical == "middle") {
        posY := MonitorWorkAreaTop + height
    } else {
        posY := MonitorWorkAreaTop
    }

    WinMove,A,,%posX%,%posY%,%width%,%height%
}

/**
 * ResizeActiveWindow resizes the active window to the full height on the monitor.
 * @param {string} stretchDirection   The direction in which to stretch the active window.
 *                                    Expects "vertical". No other function is supported yet.
 */
ResizeActiveWindow(stretchDirection) {
    WinGet activeWin, ID, A
    WinGetPos, posX, posY, Width, Height, A
    activeMon := GetMonitorIndexFromWindow(activeWin)

    SysGet, MonitorWorkArea, MonitorWorkArea, %activeMon%

    if (stretchDirection == "vertical") {
        height := MonitorWorkAreaBottom - MonitorWorkAreaTop
        width := Width
        posY := MonitorWorkAreaTop
    } else if (stretchDirection == "shrinkWidth") {
        width := Width - (MonitorWorkAreaRight-MonitorWorkAreaLeft)/3
        height := Height
    } else if (stretchDirection == "expandWidth") {
        width := Width + (MonitorWorkAreaRight-MonitorWorkAreaLeft)/3
        height := Height
    } else if (stretchDirection == "shrinkHeight") {
        height := Height - (MonitorWorkAreaRight-MonitorWorkAreaLeft)/3
        width := Width
    } else if (stretchDirection == "expandHeight") {
        height := Height + (MonitorWorkAreaRight-MonitorWorkAreaLeft)/3
        width := Width
    }

    WinMove,A,,%posX%,%posY%,%width%,%height%
}

/**
 * GetMonitorIndexFromWindow retrieves the HWND (unique ID) of a given window.
 * @param {Uint} windowHandle
 * @author shinywong
 * @link http://www.autohotkey.com/board/topic/69464-how-to-determine-a-window-is-in-which-monitor/?p=440355
 */
GetMonitorIndexFromWindow(windowHandle) {
    ; Starts with 1.
    monitorIndex := 1

    VarSetCapacity(monitorInfo, 40)
    NumPut(40, monitorInfo)

    if (monitorHandle := DllCall("MonitorFromWindow", "uint", windowHandle, "uint", 0x2))
        && DllCall("GetMonitorInfo", "uint", monitorHandle, "uint", &monitorInfo) {
        monitorLeft   := NumGet(monitorInfo,  4, "Int")
        monitorTop    := NumGet(monitorInfo,  8, "Int")
        monitorRight  := NumGet(monitorInfo, 12, "Int")
        monitorBottom := NumGet(monitorInfo, 16, "Int")
        workLeft      := NumGet(monitorInfo, 20, "Int")
        workTop       := NumGet(monitorInfo, 24, "Int")
        workRight     := NumGet(monitorInfo, 28, "Int")
        workBottom    := NumGet(monitorInfo, 32, "Int")
        isPrimary     := NumGet(monitorInfo, 36, "Int") & 1

        SysGet, monitorCount, MonitorCount

        Loop, %monitorCount% {
            SysGet, tempMon, Monitor, %A_Index%

            ; Compare location to determine the monitor index.
            if ((monitorLeft = tempMonLeft) and (monitorTop = tempMonTop)
                and (monitorRight = tempMonRight) and (monitorBottom = tempMonBottom)) {
                monitorIndex := A_Index
                break
            }
        }
    }

    return %monitorIndex%
}

; NineGrid

#!Numpad9::SnapActiveWindow("top","right","third")
#!Numpad8::SnapActiveWindow("top","middle","third")
#!Numpad7::SnapActiveWindow("top","left","third")

#!Numpad6::SnapActiveWindow("middle","right","third")
#!Numpad5::SnapActiveWindow("middle","middle","third")
#!Numpad4::SnapActiveWindow("middle","left","third")

#!Numpad3::SnapActiveWindow("bottom","right","third")
#!Numpad2::SnapActiveWindow("bottom","middle","third")
#!Numpad1::SnapActiveWindow("bottom","left","third")

#!Numpad0::ResizeActiveWindow("vertical")
#!NumpadDiv::ResizeActiveWindow("shrinkWidth")
#!NumpadMult::ResizeActiveWindow("expandWidth")
#!NumpadSub::ResizeActiveWindow("shrinkHeight")
#!NumpadAdd::ResizeActiveWindow("expandHeight")

; Directional Arrow Hotkeys
#!Up::SnapActiveWindow("top","full","half")
#!Down::SnapActiveWindow("bottom","full","half")
^#!Up::SnapActiveWindow("top","full","third")
^#!Down::SnapActiveWindow("bottom","full","third")

^#!Numpad0::SnapActiveWindow("middle","full","third")