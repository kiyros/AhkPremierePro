from ahk import AHK

# autoHotkey wrapper for python
ahk = AHK()
win = ahk.active_window

#hotkeys modifiers---------
# # windows key
# ! alt key
# ^ ctrl
# + shift



def scale():
    ahk.mouse_move(200, 500, speed=15)

def my_ex_handler(hotkey: str, exception: Exception):
    print('exception with callback for hotkey', hotkey, 'Here was the error:', exception)

def go_boom():
    raise Exception('boom!')



ahk.add_hotkey('+n', callback=go_boom, ex_handler=my_ex_handler)
ahk.start_hotkeys()
ahk.block_forever()