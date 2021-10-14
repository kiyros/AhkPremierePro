from ahk import AHK, Hotkey

# autoHotkey wrapper for python
ahk = AHK()
win = ahk.active_window


def hotkeys():
    scale_hotkey = Hotkey(ahk, '!^s', 'preimereHotkeys.ahk')
    scale_hotkey.start()


def scale():
    ahk.mouse_move(200, 500, speed=15)


while True:
    if ahk.key_state('s') and ahk.key_state('Control'):
        print("success")
