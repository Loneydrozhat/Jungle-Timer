# Jungle Timer

This AutoHotkey macro is made for [League Of Legends](http://www.leagueoflegends.com/)
and provides ingame timers for the six most important neutral monsters which may
be useful for jungling. This is a draft and a work in progress and naturally does
not cater to everybody's needs.

## Installation and startup

1. Have [AutoHotkey](http://www.autohotkey.com/) installed, which can be found at http://www.autohotkey.com/

2. Download the [Jungle Timer files](https://github.com/klovadis/Jungle-Timer/archive/master.zip) and extract those files anywhere.

3. In that folder, double-click on **Jungle_Timer.ahk** which will make AutoHotkey run the script.

4. To exit the script, either 
  - Press Numpad divide (/) hotkey
  - Type !exit in any text input
  - Close the script via the task bar.

## How to use

1. Run the script as mentioned above.

2. Optional: Synchronize game timer:

   When the game has begun, type in the chat "!start ##" where ## has
   to be replaced by the amount of seconds that have elapsed since the
   start of the game. I.e. "!start 20" when the game timer is at 00:20
   or "!start 120" when the game timer is at 02:00.

   To avoid glitches with ingame key bindings, you may sometimes need
   to press the enter button a few times. This should rarely occur anymore 
   though.

   If you do not use this option, all times will be relative and the
   generated chat messages are of limited use.

3. Type "!time" in the chat bar to see if the time is in sync with the
game time.

4. Press the numpad keys 1-6 to mark the time of a neutral monsters death
or to retrieve the next spawn time as seen in the *hotkeys* section.

5. Open the chat bar and press the *numpad zero (0)* key to display the latest
generated message with exact timings.
  - Numpad 0: Paste message into chat bar.

6. Press the numpad dot key to erase the previously created or selected
timer. For example if you press numpad 1 (red), then numpad 2 (blue)
followed by numpad dot will remove the blue buff timer.
    - Numpad dot (.): Erase previously selected timer. 

7. Press the minus numpad key (-) to stop the game timer and subsequently
any further notifications. Alternatively you can type "!stop" in the chat.
You may restart the timer by using the !start command or by pressing any
timer buttons.
    - Numpad minus (-): Halt the script.

## Commands

Commands can be entered into the games chat bar and may be ended by either
pressing *ENTER* (not recommended, it will clutter your allies screen) or **SPACE**.

 - !start NN: Set the game timer to NN seconds.
 - !stop: Stop all timers and notifications.
 - !exit: Shutdown the script alltogether.
 - !time: Retrieve current time.


## Hotkeys overview

![Alt text](https://github.com/klovadis/Jungle-Timer/blob/master/hotkeys/hotkeys.png?raw=true)

Buff timers:
 - Numpad 1: Own red buff (5 minutes).
 - Numpad 2: Own blue buff (5 minutes).
 - Numpad 3: Dragon (6 minutes).
 - Numpad 4: Enemy red buff (5 minutes).
 - Numpad 5: Enemy blue buff (5 minutes).
 - Numpad 6: Baron (7 minutes).

Control keys:
 - Numpad 0: Paste message into chat bar.
 - Numpad dot (.): Erase previously selected timer. 
 - Numpad minus (-): Stop all timers and notifications.
 - Numpad divide (/): Shutdown the script alltogether.

## Credits

1. Audio files in /audio

	All audio files have been obtained using Amit Agarwal's
	text-to-speech tool found at http://ctrlq.org/listen/
	which in turn makes use of Google's text-to-speech API.
	Exact audio license is unclear at this point so don't
	use those audio files commercially.

2. hotkeys.png and hotkeys.svg

	Derived from http://commons.wikimedia.org/wiki/File:Numpad.svg
	which was released to public domain by Oona R�is�nen
	http://en.wikipedia.org/wiki/User:Mysid


## License (MIT)

Copyright (C) 2013 Geerten van Meel (http://blog.gvm-it.eu/)

Permission is hereby granted, free of charge, to any person obtaining a copy of this
software and associated documentation files (the "Software"), to deal in the Software 
without restriction, including without limitation the rights to use, copy, modify, 
merge, publish, distribute, sublicense, and/or sell copies of the Software, and to 
permit persons to whom the Software is furnished to do so, subject to the following 
conditions:

The above copyright notice and this permission notice shall be included in all copies
or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE 
OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
