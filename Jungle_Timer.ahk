;   ___                   _        _   _      _                 
;  |_  |                 | |      | | | |    | |         v1.0.0       
;    | |_   _ _ __   __ _| | ___  | |_| | ___| |_ __   ___ _ __ 
;    | | | | | '_ \ / _` | |/ _ \ |  _  |/ _ \ | '_ \ / _ \ '__|
;/\__/ / |_| | | | | (_| | |  __/ | | | |  __/ | |_) |  __/ |   
;\____/ \__,_|_| |_|\__, |_|\___| \_| |_/\___|_| .__/ \___|_|   
;                    __/ |                     | |              
;                   |___/                      |_|
;
; ABOUT
;
; This AutoHotkey macro is made for League Of Legends (http://www.leagueoflegends.com/)
; and provides ingame timers for the six most importend neutral monsters which may
; be useful for jungling. This is a draft and a work in progress and naturally does
; not cater to everybody's needs.
;
;
; LICENSE (MIT License)
;
; Copyright (C) 2013 Geerten van Meel (http://blog.gvm-it.eu/)
;
; Permission is hereby granted, free of charge, to any person obtaining a copy of this
; software and associated documentation files (the "Software"), to deal in the Software 
; without restriction, including without limitation the rights to use, copy, modify, 
; merge, publish, distribute, sublicense, and/or sell copies of the Software, and to 
; permit persons to whom the Software is furnished to do so, subject to the following 
; conditions:
;
; The above copyright notice and this permission notice shall be included in all copies
; or substantial portions of the Software.
;
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
; INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
; PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
; HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
; CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE 
; OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


; Buff settings
Names := Array("our RED", "our BLUE", "enemy RED", "enemy BLUE", "DRAKE", "BARON")
Audio := Array("our_red", "our_blue", "enemy_red", "enemy_blue", "drake", "baron")
FirstSpawn := Array(115, 115, 115, 115, 150, 900)
Respawn := Array(300, 300, 300, 300, 360, 420)
Notify := Array(60, 60, 60, 60, 60, 120)

; Sound settings
AudioVolume := 100
AudioSpawnSoon := "_will_spawn_soon.mp3"
AudioHasSpawned := "_has_spawned.mp3"
AudioTimerSet := "_timer_set.mp3"
AudioTimerRemoved := "timer_removed.mp3"
AudioTimerExists := "timer_exists.mp3"
AudioGameTimerSet := "timer_set.mp3"
AudioError := "error.mp3"
AudioTimerStopped := "timer_stopped.mp3"
AudioGoodBye := "goodbye.mp3"
AudioFolder := "audio/"

; don't touch this
MessageMode := 0 ; 0 -> use game time, 1 -> dont use game time
NextSpawn := Array(0, 0, 0, 0, 0, 0) ; LEAVE THIS ALONE
MessageText := ""
SelectedTimer := 0
GameTimerSeconds := 0
SoundSetWaveVolume, AudioVolume
LastTick := A_TickCount

; == use Numpad 0 to retrieve the last messages text
*Numpad0::
	If MessageText
		SendInput %MessageText%
	Else
		SendInput No pending notification.
return

; == use Numpad 1-6 to mark or retrieve buff times
*Numpad1::TimerButtonAction(1) ; own red
*Numpad2::TimerButtonAction(2) ; own blue
*Numpad3::TimerButtonAction(5) ; drake
*Numpad4::TimerButtonAction(3) ; enemy red
*Numpad5::TimerButtonAction(4) ; enemy blue
*Numpad6::TimerButtonAction(6) ; baron

; == remove the latest timer
*NumpadDot::
	If SelectedTimer = 0
	{
		SoundPlay, %AudioFolder%%AudioError%
		MessageText := "Press the button of the timer that you want to delete first."		
		return
	}

	NextSpawn[SelectedTimer] := 0
	MessageText := "Timer for " . Names[SelectedTimer] . " has been removed."
	SelectedTimer := 0
	SoundPlay, %AudioFolder%%AudioTimerRemoved%
return

; == start the game timer
:b0:!start::
	; capture command parameters
	Input, UserInput, V *, {enter}{esc}{space}

	; command was cancelled by pressing escape
	IfInString, ErrorLevel, EndKey:Escape
	{
		SendInput {Escape}
		return
	}

	; check input
	ReMatchPosition := RegExMatch(UserInput, "^\d+$")
	If ReMatchPosition = 0
	{
		MessageText := "Unknown input " . UserInput
		SoundPlay, %AudioFolder%%AudioError%
		return
	}
	MessageMode := 1
	NextSpawn := Array(0, 0, 0, 0, 0, FirstSpawn[6])
	LastTick := A_TickCount
	GameTimerSeconds := UserInput, GameTimerSeconds += 0
	MessageText := "Game timer set to " . GameTimerSeconds
	SetTimer, GameTimerLoop, 1000
	SoundPlay, %AudioFolder%%AudioGameTimerSet%
return



; == stop the game timer
StopCommandChat := 0
::!stop::
*NumpadSub::
	GameTimerSeconds = 0
	SetTimer, GameTimerLoop, Off
	SoundPlay, %AudioFolder%%AudioTimerStopped%
	MessageText := "Game timer has been stopped."
	MessageMode := 0
	NextSpawn := Array(0, 0, 0, 0, 0, 0)
return


; == show the game timer
:b0:!time::
	If GameTimerSeconds = 0
	{
		MessageText := "Game timer has not been set."
	}
	If GameTimerSeconds > 0
	{
		If MessageMode = 1
		{
			MessageText := "Current game time is " . FormatSeconds(GameTimerSeconds)
			SendInput % "is " . FormatSeconds(GameTimerSeconds)
		}
		Else
		{
			MessageText := "Timer runs independantly from game."
			SendInput % "n/a"
		}
	}
return


; == exit the script
*NumpadDiv::
:b0:!exit::
	SoundPlay % AudioFolder . AudioGoodBye
	Sleep 1000
	ExitApp
return

; == Loop that is run every second along with the game timer
GameTimerLoop:
	TickDifference := A_TickCount - LastTick
	While (TickDifference > 1000)
	{
		TickDifference := TickDifference - 1000
		GameTimerSeconds++

		i = 0
		Loop, 6
		{
			i := i + 1
			; has spawned notification
			If (GameTimerSeconds = NextSpawn[i])
			{
				SoundPlay, % AudioFolder . Audio[i] . AudioHasSpawned
				MessageText := Names[i] . " has spawned."
			}

			; spawn soon notification
			If (GameTimerSeconds = NextSpawn[i] - Notify[i]) {
				SoundPlay, % AudioFolder . Audio[i] . AudioSpawnSoon
				If MessageMode = 1
					MessageText := Names[i] . " will spawn at " . FormatSeconds(NextSpawn[i])
				Else
					MessageText := Names[i] . " will spawn in " . FormatSeconds(NextSpawn[i] - GameTimerSeconds)
			}
		}

	}

	; for precision, keep excess milliseconds
	LastTick := A_TickCount - TickDifference

return




; == Helper function for mapped hotkeys
TimerButtonAction(i)
{
	global Names, FirstSpawn, Respawn, NextSpawn
	global Audio, AudioError, AudioSpawnSoon, AudioTimerSet, AudioTimerExists, AudioFolder
	global MessageText, GameTimerSeconds, SelectedTimer, MessageMode
	SelectedTimer := 0

	If (GameTimerSeconds < 1)
	{
		MessageMode := 0
		GameTimerSeconds := 1200
		NextSpawn := Array(0, 0, 0, 0, 0, 0)
		LastTick := A_TickCount
		SetTimer, GameTimerLoop, 1000
	}

	If (NextSpawn[i] = 0 and GameTimerSeconds < FirstSpawn[i])
	{
		SoundPlay, % AudioFolder . Audio[i] . AudioSpawnSoon
		MessageText := Names[i] . " will spawn at " . FormatSeconds(FirstSpawn[i])
		return MessageText
	}

	If (NextSpawn[i] = 0 and GameTimerSeconds > FirstSpawn[i])
	{
		SoundPlay, % AudioFolder . Audio[i] . AudioTimerSet
		NextSpawn[i] := GameTimerSeconds + Respawn[i]
		If MessageMode = 1
			MessageText := Names[i] . " will respawn at " . FormatSeconds(NextSpawn[i])
		Else
			MessageText := Names[i] . " will respawn in " . FormatSeconds(Respawn[i])
		SelectedTimer := i
		return MessageText
	}

	If (NextSpawn[i] > 0 and GameTimerSeconds < NextSpawn[i])
	{
		SoundPlay, %AudioFolder%%AudioTimerExists%
		If MessageMode = 1
			MessageText := Names[i] . " will respawn at " . FormatSeconds(NextSpawn[i])
		Else
			MessageText := Names[i] . " will respawn in " . FormatSeconds(NextSpawn[i] - GameTimerSeconds)
		SelectedTimer := i
		return MessageText
	}

	If (NextSpawn[i] > 0 and GameTimerSeconds > NextSpawn[i])
	{
		SoundPlay, % AudioFolder . Audio[i] . AudioTimerSet
		NextSpawn[i] := GameTimerSeconds + Respawn[i]
		If MessageMode = 1
			MessageText := Names[i] . " will respawn at " . FormatSeconds(NextSpawn[i])
		Else
			MessageText := Names[i] . " will respawn in " . FormatSeconds(Respawn[i])
		SelectedTimer := i
		return MessageText
	}

	SoundPlay, %AudioFolder%%AudioError%
	MessageText := "An error occurred inside TimerButtonAction"
	return MessageText
}


; == helper function to format the game time
FormatSeconds(NumberOfSeconds)  ; Convert the specified number of seconds to hh:mm:ss format.
{
    time = 19990101  ; *Midnight* of an arbitrary date.
    time += %NumberOfSeconds%, seconds
    FormatTime, mmss, %time%, mm:ss
	If NumberOfSeconds//3600 > 0
	{
		return NumberOfSeconds//3600 ":" mmss
	}
	return mmss
}




