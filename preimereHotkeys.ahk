CoordMode, Pixel ,Screen
CoordMode, Mouse,Screen
#ifwinactive ahk_exe adobe premiere pro.exe

#NoEnv ;
; #Warn ;
sendMode Input ;

; Premeiere hotkeys






^h:: ;  drags the selected effect to selected AUDIO in the timeline
	PixelSearch px, py, 17, 727, 341, 967, 0x4A4A4A, 0, RGB Fast;  Find the color
	PixelSearch pTimeline, pTimelineY, 651, 852, 1335, 852, 0x2D8CEB, 0, RGB Fast; Find the color
	MouseMove, %px%, %py% ; move to selected effect
	MouseMove, %pTimeline%, %pTimelineY% ; move to selected effect
	Sleep, 10
	SendEvent {Click,%px%,%py%, Down} {click,%pTimeline%,%pTimelineY%,up}

F2:: ;  Broadcast Compressor to regulate audio
	Effectfindbox("Broadcast Compressor")	
	return

!l:: ;  increase scale by 200%
	Effectfindbox("200 zoom")
	return

!i:: ;  Bass boost
	Effectfindbox("BassBoost")
	return

!y:: ;  wavy alien voice
	Effectfindbox("Flanger Preset (wavy standard)")
	return

!o:: ;  Tint and posterize	
	Effectfindbox("Tint posterize Regular")
	return

!u:: ;  Turbulent displacement
	Effectfindbox("Turbulent Displace Preset")
	return

!k:: ;  Triggered gentle shake
	Effectfindbox("Triggered gentle shake")
	return

!0:: ;  BottomLeftZoom 500
	Effectfindbox("BottomLeftZoom 500")
	return

!1:: ;  TopLeftZoom 400
	Effectfindbox("TopLeftZoom 400")
	return

F5:: ;  transitional adjustment layer (TRANSITION ADJUSTMENT) Layer
	Mediafindbox("Transition Adjustment layer" , 29 , 790)
	return
	
F6:: ;  we'll brb (TRANSITION) screen
	Mediafindbox("We'll Brb Transtition screen" , 24 , 791)
	return

F7:: ;  no signal (TRANSITION) screen
	Mediafindbox("no signal" , 29 , 816)
	return

F8:: ;  RANDOM BIN TRANSITIONS!!!!
	Random, randomTransition, 1, 3
	
	if (randomTransition == 1){
		Mediafindbox("no signal" , 29 , 816)
		Random, randomTransition, 1, 3
		return
	}
	else if (randomTransition == 2){
		Mediafindbox("We'll Brb Transtition screen" , 24 , 791)
		return
	}
	else if (randomTransition == 3){
		Mediafindbox("SmokeTransition" , 25 , 794)
		return
	}
	return

F9:: ; random inline transitions
	send, ^d ; apply default push transition
	Sleep, 10	
	MediafindboxAudio("Audio Transition" , 29 , 818)
	Sleep, 10
	Mediafindbox("Transition Adjustment layer" , 26 , 792)
	Sleep, 10	
	PixelSearch pTimeline, pTimelineY, 646, 900, A_ScreenWidth, A_ScreenHeight, 0xE2E264, 0, RGB Fast; Find Adjustment Layer yellow color
	MouseMove, %pTimeline%, %pTimelineY%
	Sleep, 60
	sendinput, {shift}+7
	sendinput, {shift}+f
	sendinput, ^a
	sendinput, {Delete}
	return




Effectfindbox(theText){
sendinput, {shift}+7
sendinput, {shift}+f
sendinput, ^a
sendinput, {Delete}
Sleep, 50
sendinput,%theText%
Sleep, 50
MouseMove, 278, 667
PixelSearch pTimeline, pTimelineY, 646, 738, A_ScreenWidth, A_ScreenHeight, 0xDDDDDD, 0, RGB Fast; Find the color
Sleep, 10
MouseMove, 450, 705 ; move to presset
Sleep, 10
PixelSearch px, py, 282, 658, A_ScreenWidth, A_ScreenHeight, 0x454545, 0, RGB Fast; Find the color
SendEvent {Click, Down} {click,%pTimeline%,%pTimelineY%,up} ;drag preset to selected clip(s)
return
}


Mediafindbox(theText, px, py){ ;video
sendinput, {shift}+1
sendinput, {shift}+f
sendinput, ^a
sendinput, {Delete}
Sleep, 50
sendinput,%theText%
Sleep, 100
MouseMove, 695, 810 ; turn off video targeting for track 1
Click, Left
Sleep, 50




PixelSearch pTimeline, pTimelineY, 646, 738, A_ScreenWidth, A_ScreenHeight, 0x2D8CEB, 0, RGB Fast; Find the color of playhead

Sleep, 10
MouseMove, %px%, %py% ; move to presset
Sleep, 10

SendEvent {Click, Down} {click,%pTimeline%,%pTimelineY%,up} ;drag preset to blue marker/playhead

;MouseMove, %px%, %py%
;Click, Left
;Send, ,

Sleep, 50
MouseMove, 695, 810 ; turn off video targeting for track 1
Click, Left


return
}





MediafindboxAudio(theText, px, py){ ;audio
sendinput, {shift}+1
sendinput, {shift}+f
sendinput, ^a
sendinput, {Delete}
Sleep, 50
sendinput,%theText%
Sleep, 100

MouseMove, 667, 850 ; turn off audio targeting for track 1
Click, Left
Sleep, 50




PixelSearch pTimeline, pTimelineY, 646, 881, A_ScreenWidth, A_ScreenHeight, 0x2D8CEB, 0, RGB Fast; Find the color of playhead

Sleep, 10
MouseMove, %px%, %py% ; move to presset
Sleep, 10

SendEvent {Click, Down} {click,%pTimeline%,%pTimelineY%,up} ;drag preset to blue marker/playhead

;MouseMove, %px%, %py%
;Click, Left
;Send, ,

Sleep, 50


MouseMove, 667, 850 ; turn off audio targeting for track 1
Click, Left
Sleep, 50



return
}