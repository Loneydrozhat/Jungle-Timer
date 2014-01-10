# Jungle Timer


## Installation and startup

1. Have AutoHotkey installed, which can be found at http://www.autohotkey.com/

2. Download the Jungle Timer files *here* and extract those files anywhere.

3. In that folder, double-click on Jungle_Timer.ahk which will make AutoHotkey
run the script.

4. To exit the script, either 
  - Press Numpad divide (/) hotkey
  - Type !exit in any text input
  - Close the script via the task bar.

## How to use

1. Either run the script Jungle_Timer.ahk via AutoHotkey 
   which can be found at http://www.autohotkey.com/ and
   must then be installed first or launch the provided executable
   Jungle_Timer.exe

2. Run this script with AutoHotkey (normally, you can just double-click
   on the script file to start it.

3. Optional:

   When the game has begun, type in the chat "!start ##" where ## has
   to be replaced by the amount of seconds that have elapsed since the
   start of the game. I.e. "!start 20" when the game timer is at 00:20
   or "!start 120" when the game timer is at 02:00.

   To avoid glitches with ingame key bindings, you may sometimes need
   to press the enter button a few times. This should rarely occur anymore 
   though.

   If you do not use this option, all times will be relative and the
   generated chat messages are of limited use.

4. Type "!time" in the chat bar to see if the time is in sync with the
   game time.

5. Press the numpad keys 1-6 to mark the time of a neutral monsters death
   or to retrieve the next spawn time.*
   
       Numpad 1: Own red buff
       Numpad 2: Own blue buff

       Numpad 4: Enemy red buff
       Numpad 5: Enemy blue buff

       Numpad 3: Dragon
       Numpad 6: Baron

6. Open the chat bar and press the numpad zero key to display the latest
   generated message with exact timings.

       Numpad 0: Paste message into chat bar.


7. Press the numpad dot key to erase the previously created or selected
   timer. For example if you press numpad 1 (red), then numpad 2 (blue)
   followed by numpad dot will remove the blue buff timer.

       Numpad dot (.): Erase previously selected timer. 

8. Press the minus numpad key (-) to stop the game timer and subsequently
   any further notifications. Alternatively you can type "!stop" in the chat.
   You may restart the timer by using the !start command or by pressing any
   timer buttons.

       Numpad minus (-): Halt the script.

9. Stop the script execution by closing the AutoHotkey application in your 
   task bar, by typing !exit or by pressing numpad division key.

       Numpad divide (/): Exit the script.

## Commands

!start NN: Set the game timer to NN seconds.
!stop: Stop all timers and notifications.
!exit: Shutdown the script alltogether.

## Hotkeys overview

Numpad 1: Own red buff
Numpad 2: Own blue buff

Numpad 4: Enemy red buff
Numpad 5: Enemy blue buff

Numpad 3: Dragon
Numpad 6: Baron

Numpad 0: Paste message into chat bar.
Numpad dot (.): Erase previously selected timer. 
Numpad minus (-): Stop all timers and notifications.
Numpad divide (/): Shutdown the script alltogether.

## Credits

1. Audio files in /audio

All audio files have been obtained using Amit Agarwal's
text-to-speech tool found at http://ctrlq.org/listen/
which in turn makes use of Google's text-to-speech API.
Exact audio license is unclear at this point so don't
use those audio files commercially.

2. hotkeys.png and hotkeys.svg

Derived from http://commons.wikimedia.org/wiki/File:Numpad.svg
which was released to public domain by Oona Räisänen
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