; SharpKeys Bindings: Left Alt    => Right Control
;                     Left Win    => Right Alt
;                     PrintScreen => Right Win (optional)

; SublimeText Bindings:
; [
;   { "keys": ["home"], "command": "move_to", "args": {"to": "hardbol", "extend": false} }, 
;   { "keys": ["end"], "command": "move_to", "args": {"to": "hardeol", "extend": false} },
;   { "keys": ["ctrl+k"], "command": "run_macro_file", "args": {"file": "res://Packages/Default/Delete to Hard EOL.sublime-macro"} },
;   { "keys": ["ctrl+tab"], "command": "next_view" },
;   { "keys": ["ctrl+shift+tab"], "command": "prev_view" },
; ]

; VSCode Bindings:
; [
;   {
;     "key": "ctrl+k",
;     "command": "deleteAllRight"
;   },
;   {
;     "key": "ctrl+tab",
;     "command": "workbench.action.nextEditor"
;   },
;   {
;     "key": "ctrl+shift+tab",
;     "command": "workbench.action.previousEditor"
;   }
; ]

; Windows Terminal Bindings:
;  { "command": "closePane", "keys": "ctrl+w" },
;  { "command": { "action": "newTab", "index": 2 }, "keys": "ctrl+t" },
;  { "command": { "action": "newTab", "index": 2 }, "keys": "ctrl+n" },

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

; ctrl-a = Home, ctrl-e = End
Lctrl & a::Send {Home}
Lctrl & e::Send {End}

; ⌘-g = Find next, shift-⌘-g = Reverse find next
>^g::Send {F3}
+>^g::Send +{F3}

; ⌘-m = Minimize window
>^m::Send #{Down}

; ctrl-Left/Right = jump between words
!Left::Send ^{Left}
!Right::Send ^{Right}

; ⌘-q to exit.
>^q::Send !{F4}

; ⌘-space for spotlight
>^Space::Send {lalt up}{ctrl up}{lwin}

; Disable ctrl-mousewheel for zooming.
^WheelDown::Send ^{0}
^WheelUp::Send ^{0}

; ctrl-⌘-q = lock screen
>^<^q::DllCall("LockWorkStation")

; Enabled key-bindings for right-alt. 
; 0, -, = for page zooming
>!0::Send ^{0}
>!-::Send ^{-}
>!=::Send ^{=}
; ctrl-p to print, ctrl-n for new window
>!p::Send ^{p}
>!n::Send ^{n}
+>!i::Send +^{i}

; Excluded hotkeys for Windows Terminal:
#IfWinNotActive ahk_exe WindowsTerminal.exe
  ; ⌘-backspace to kill word backwards.
  >!BS::Send ^{BS}
  ; ctrl-D to delete.
  <^d::Send {Del}
  ; Disable Alt triggering the menu
  Lalt::return
  Ralt::return
return

>^Tab::Send, {LAlt Down}{Tab}
#IfWinActive ahk_class MultitaskingViewFrame
  Ctrl Up::Send, {LAlt Up}
return
