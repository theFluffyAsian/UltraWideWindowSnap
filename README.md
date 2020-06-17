forked from AWMooreCO/AdvancedWindowSnap.ahk

# UltraWide Window Snap

UltraWide Window Snap is a script for [AutoHotKey] that expands upon Windows built-in window-snapping hotkeys (which are <kbd>Win</kbd> + <kbd>LEFT</kbd> to snap an active window to the left half of a monitor and <kbd>Win</kbd> + <kbd>RIGHT</kbd> to snap a window to the right half of a monitor) by adding 14 additional snap methods and window sizing options.

## Installation Steps

1. Install [AutoHotKey]
2. Copy or Download the **UltraWideAdvancedWindowSnap.ahk** file to your computer and double click it to run it.
3. (Optional) To have the program run when you start up your computer, place the .ahk file into your computer's [startup] folder. 
    * The Windows 7 Startup Folder can be accessed by mousing to **Start** > **All Programs**, then right-clicking on **Startup** and selecting "**Open**".
    * The Windows 8 Startup Folder can be accessed by tapping <kbd>Win</kbd> + <kbd>R</kbd> on your keyboard, then in the Open: field, type `shell:startup` then press <kbd>Enter</kbd>.
    * In windows 10:
      * The All Users Startup folder is found in the following path: 
      `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`
      * The Current User Startup folder is located here:
`C:\Users\[User Name]\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

## Advanced Window Snap Keybindings

### Vertical Monitor Hotkeys:
Hotkey | Behavior
------ | --------
<kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>UP</kbd> | Window will snap to the top **half** of the screen.
<kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>DOWN</kbd> | Window will snap to the bottom **half** of the screen.
<kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>UP</kbd> | Window will snap to the top **third** of the screen.
<kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>DOWN</kbd> | Window will snap to the bottom **third** of the screen.
<kbd>Ctrl</kbd> + <kbd>Win</kbd> + <kbd>Numpad 0</kbd> | Window will snap to the middle **third** of the screen.

### UltraWide  Monitor Hotkeys (Landscape):
These will work only if you have NumLock turned **ON**. These are ideal for Landscape Monitors. They split the screen into 9 regions in the same orientation as the number pad.

Hotkey | Behavior
------ | --------
<kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>Numpad 1</kbd> | Window will snap to the bottom-left **third** of the screen
<kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>Numpad 2</kbd> | Window will snap to the bottom-middle **third** of the screen
<kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>Numpad 3</kbd> | Window will snap to the bottom-right **third** of the screen
<kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>Numpad 4</kbd> | Window will snap to the middle-left **third** of the screen
<kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>Numpad 5</kbd> | Window will snap to the middle-middle **third** of the screen
<kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>Numpad 6</kbd> | Window will snap to the middle-right **third** of the screen
<kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>Numpad 7</kbd> | Window will snap to the top-left **third** of the screen
<kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>Numpad 8</kbd> | Window will snap to the top-middle **third** of the screen
<kbd>Win</kbd> + <kbd>Alt</kbd> + <kbd>Numpad 9</kbd> | Window will snap to the top-right **third** of the screen

### Modifier Hotkeys:
These will work only if you have NumLock turned **ON**. These are ideal for Portrait Monitors.

Hotkey | Behavior
------ | --------
<kbd>Win</kbd> + <kbd>Numpad 0</kbd> | Window will stretch to the **full** length of the screen and place the window at the top of the screen.
<kbd>Alt</kbd> + <kbd>Numpad plus</kbd> | Window increases height by **third** of the screen height.
<kbd>Alt</kbd> + <kbd>Numpad minus</kbd> | Window decreases height by **third** of the screen height. Or to minium.
<kbd>Alt</kbd> + <kbd>Numpad times</kbd> | Window increases width by **third** of the screen width.
<kbd>Alt</kbd> + <kbd>Numpad divide</kbd> | Window decrease to the bottom **third** of the screen. Or to minium.

## Notes
* Some windows do not like the button modifiers. For example, Visual Studio 2017 refuses to move around. 
* Size modifications to the window will not override the programs minimum display width. 

## Changelog

- **v1.00**, *06/2020*
    - Initial version

[AutoHotKey]:http://ahkscript.org/
[startup]:http://www.autohotkey.com/docs/FAQ.htm#Startup]
