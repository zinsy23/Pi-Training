;------------------------------------------------------------------------

; Source code of Pi Training program with commentary.

; Key:
; ^ = Ctrl
; ! = Alt
; # = Win
; + = Shift

;------------------------------------------------------------------------

#SingleInstance force ; Forces the program to only run one instance at a time.

IniRead, dPi, preferences.ini, Shortcuts, dPi, %A_Space% ; Reads the keyboard shortcut from the INI file. Mapped for "Display the digits of Pi."

IniRead, qPi, preferences.ini, Shortcuts, qPi, %A_Space% ; Reads the keyboard shortcut from the INI file. Mapped for "Quiz yourself with specified offset and quantity."

IniRead, fPi, preferences.ini, Shortcuts, fPi, %A_Space% ; Reads the keyboard shortcut from the INI file. Mapped for "Navigate forward x amount of digits."

IniRead, bPi, preferences.ini, Shortcuts, bPi, %A_Space% ; Reads the keyboard shortcut from the INI file. Mapped for "Navigate backward x amount of digits.

IniRead, pPi, preferences.ini, Shortcuts, pPi, %A_Space% ; Reads the keyboard shortcut from the INI file. Mapped for "Type group(s) of specified digits as text."

IniRead, gPi, preferences.ini, Shortcuts, gPi, %A_Space% ; Reads the keyboard shortcut from the INI file. Mapped for "Navigate back to the saved offset and quantity."

IniRead, nPi, preferences.ini, Shortcuts, nPi, %A_Space% ; Reads the keyboard shortcut from the INI file. Mapped for "Navigate back to the saved offset and quantity."

IniRead, cPi, preferences.ini, Shortcuts, cPi, %A_Space% ; Reads the keyboard shortcut from the INI file. Mapped for "Change the saved offset to the current offset."

IniRead, mTimer, preferences.ini, Shortcuts, mTimer, %A_Space% ; Reads the keyboard shortcut from the INI file. Mapped for "Run the minutes based timer."

IniRead, sTimer, preferences.ini, Shortcuts, sTimer, %A_Space% ; Reads the keyboard shortcut from the INI file. Mapped for "Run the seconds based timer."

IniRead, ePi, preferences.ini, Shortcuts, ePi, %A_Space% ; Reads the keyboard shortcut from the INI file. Mapped for "Quit this application."

IniRead, rPi, preferences.ini, Shortcuts, rPi, %A_Space% ; Reads the keyboard shortcut from the INI file. Mapped for "Restart this script and reset the offset and quantity."

IniRead, piOffset, preferences.ini, Data, Offset, %A_Space% ; Reads the saved offset from the INI file.

IniRead, piDigitQty, preferences.ini, Data, Quantity, %A_Space% ; Reads the saved quantity from the INI file.

global piQty ; Makes the variable global. You cannot use this variable in a shortcut consistently without this.

global piOffset ; Makes the variable global. You cannot use this variable in a shortcut consistently without this.

global piDigitQty ; Makes the variable global. You cannot use this variable in a shortcut consistently without this.

global pTitle ; Makes the variable global. You cannot use this variable in a shortcut consistently without this.

piQty := piOffset ; Remember the STARTING offset in this variable. This will not change as the offset variable changes because it's set initially. Important for a function shown later.

Hotkey, %dPi%, dPi, On ; Since I am now letting people modify an INI file where hotkeys are stored, I have to put that hotkey in a variable so it can be used as a function, which is stupid. Corresponding hotkey found in INI file.

Hotkey, %qPi%, qPi, On ; Turns this variable into a hotkey.

Hotkey, %fPi%, fPi, On ; Turns this variable into a hotkey.

Hotkey, %bPi%, bPi, On ; Turns this variable into a hotkey.

Hotkey, %pPi%, pPi, On ; Turns this variable into a hotkey.

Hotkey, %gPi%, gPi, On ; Turns this variable into a hotkey.

Hotkey, %nPi%, nPi, On ; Turns this variable into a hotkey.

Hotkey, %cPi%, cPi, On ; Turns this variable into a hotkey.

Hotkey, %mTimer%, mTimer, On ; Turns this variable into a hotkey.

Hotkey, %sTimer%, sTimer, On ; Turns this variable into a hotkey.

Hotkey, %ePi%, ePi, On ; Turns this variable into a hotkey.

Hotkey, %rPi%, rPi, On ; Turns this variable into a hotkey.


dPi(){ ; Checks if you press the keyboard shortcut, according to the INI file.

Loop ; Begins a loop. This one is for making sure you have put in the offset correctly. If not, you will get nagged about it until you do, or enter some random character(s).

{ ; Beginning of first loop.
IniRead, piOffset, preferences.ini, Data, Offset, %A_Space% ; Read the offset from INI file before starting anything.

If piOffset <= 0 || piOffset = ; Checking if our offset is blank or negative. If so, we want a new one.
{ ; Beginning bracket.

InputBox, piOffset, What Starting Position Do You Want?, Current offset is %piOffset% ; Let's provide a new offset.

piQty := piOffset ; If we provided a new offset, let's remember it here for the () progress tracker or if we want to come back here.

IniWrite, %piOffset%, preferences.ini, Data, Offset ; Save our brand new offset. Not that efficient to do every time this loop is repeated.
continue ; Nags again if blank.
} ; End bracket.
else ; Our offset is good...
break ; Then end the loop because we're probably good.
} ; Ending of first loop.

Loop ; Begins another loop. This one is making sure you have put in the quantity correctly. If not, same behavior as the offset loop essentially.
{ ; Beginning of second loop.
IniRead, piDigitQty, preferences.ini, Data, Quantity, %A_Space% ; Read the quantity from INI file before starting anything.

If piDigitQty <= 0 || piDigitQty = ; Checking if our quantity is blank or negative. If so, we want a new one.
{ ; Beginning bracket.

InputBox, piDigitQty, How Many Digits After The Offset Do You Want?, Current Quantity is %piDigitQty% ; Let's provide a new quantity.

IniWrite, %piDigitQty%, preferences.ini, Data, Quantity ; Save our brand new quantity.
continue ; Nags again if blank.
} ; End bracket.
else ; Our quantity is good...
break ; Then end the loop because we're probably good.
} ; Ending of second loop.
FileRead, piDigits, Digits.txt ; Reads the file that contains the digits of Pi the program can work with and stores it in a variable "piDigits". Currently 1,048,576 so the program isn't too slow. Can be unlimited, or as much as your computer can store. Digits generated through Y-cruncher, which can be downloaded here: http://www.numberworld.org/y-cruncher/

StringMid, piResult, piDigits, %piOffset%, %piDigitQty% ; Purges your specified offset and quantity reading from "piDigits" and applies the result to the "piResult" variable.

piDQty := piQty-piDigitQty ; Variable used to assist in showing the number in parentheses. Subtracts our quantity from starting offset.

piDaily := piOffset-piDQty ; Variable showing how many digits you are since the starting offset. This will be negative if you go before this.

Msgbox, , %piOffset%; %piDigitQty%, %piResult% (%piDaily%) ; Displays the digits in a message box. The title will be your offset followed by the x amount of digits, each separated with a semi-colon.
} ; Ending of keyboard shortcut function.
return ; Needed at the end of every shortcut, otherwise it will glitch with other shortcuts within this program.

qPi(){ ; Checks if you press the keyboard shortcut, according to the INI file.
Loop ; Runs the exact same two loops for specifying offset and quantity.
{ ; Beginning of first loop.
IniRead, piOffset, preferences.ini, Data, Offset, %A_Space%
If piOffset <= 0 || piOffset =
{
InputBox, piOffset, What Starting Position Do You Want?, Current offset is %piOffset%
piQty := piOffset
IniWrite, %piOffset%, preferences.ini, Data, Offset
continue
}
else
break
} ; Ending of first loop.
Loop
{ ; Beginning of second loop.
IniRead, piDigitQty, preferences.ini, Data, Quantity, %A_Space%
If piDigitQty <= 0 || piDigitQty =
{
InputBox, piDigitQty, How Many Digits After The Offset Do You Want?, Current Quantity is %piDigitQty%
IniWrite, %piDigitQty%, preferences.ini, Data, Quantity
continue
}
else
break
} ; Ending of second loop.
FileRead, piDigits, Digits.txt ; Read the digits.
StringMid, piResult, piDigits, %piOffset%, %piDigitQty% ; Purge the results.
piDQty := piQty-piDigitQty ; Calculate total viewed digits from beginning offset.
piDaily := piOffset-piDQty ; Calculate the number in parentheses
InputBox, guessPi, What Digits Belong In This Region?, The offset is %piOffset% with %piDigitQty% digits. (%piDaily%) ; Displays the dialogue box where you can guess and test your knowledge of digits you may know, based on the offset and quantity. Stores your input in "guessPi" variable.

if(guessPi == piResult) ; Check if your input matches the result purged!

MsgBox, , Correct!, %piResult% is correct! ; If you are correct, message box will say you are correct! Using "piResult" instead of "guessPi" because it isn't the most reliable when checking large variables. This way, you can manually make sure you BOTH agree!

else ; If this statement is false...
MsgBox, , Incorrect!, Sorry, %guessPi% is incorrect! It should've been %piResult%! ; If you are incorrect, message box will say you are incorrect! Will show what you put in and what it should be.
} ; Ending of keyboard shortcut function.
return ; Needed at the end of every shortcut.

fPi(){ ; Checks if you press the keyboard shortcut, according to the INI file.
If piOffset != ; This is where we are navigating forward. We only want to do this if we checked that we specified an offset.
{ ; Beginning bracket.
piOffset := piOffset+piDigitQty ; Navigate forward x amount of digits.
IniWrite, %piOffset%, preferences.ini, Data, Offset ; Save the new offset.
} ; End bracket.
else ; We otherwise have a blank variable...
{ ; Beginning bracket for if statement.
Loop ; Runs those two loops again for offset and quantity.
{ ; Beginning of first loop.
IniRead, piOffset, preferences.ini, Data, Offset, %A_Space%
If piOffset <= 0 || piOffset =
{
InputBox, piOffset, What Starting Position Do You Want?, Current offset is %piOffset%
piQty := piOffset
IniWrite, %piOffset%, preferences.ini, Data, Offset
continue
}
else
break
} ; Ending of first loop.
Loop
{ ; Beginning of second loop.
IniRead, piDigitQty, preferences.ini, Data, Quantity, %A_Space%
If piDigitQty <= 0 || piDigitQty =
{
InputBox, piDigitQty, How Many Digits After The Offset Do You Want?, Current Quantity is %piDigitQty%
IniWrite, %piDigitQty%, preferences.ini, Data, Quantity
continue
}
else
break
} ; Ending of second loop.
} ; Ending bracket for if statement.
} ; Ending of keyboard shortcut function.
return ; Needed at the end of every shortcut.

pPi(){ ; Checks if you press the keyboard shortcut, according to the INI file.
Loop ; Start a loop for quantity, since this function is INTENDED to change the quantity.
{ ; Beginning of loop.
InputBox, piDigitQty, How Many Digits After The Offset Do You Want?, Current Quantity is %piDigitQty% ; Ask for new quantity.

IniWrite, %piDigitQty%, preferences.ini, Data, Quantity ; Save the new quantity.
If piDigitQty < 1 || piDigitQty <> 0 || piDigitQty = ; Checking to make sure it's not blank or negative.
continue ; If it is, repeat until finished.
else ; If not...
break ; Stop...
} ; Ending of loop.
} ; Ending of keyboard shortcut function.
return ; Needed at the end of every shortcut.

gPi(){ ; Checks if you press the keyboard shortcut, according to the INI file.
DetectHiddenWindows, On ; Might be needed, depending on the text editor used.
WinGetTitle, pTitle, a ; Get the title of the current window (the text editor) which will be used later.
Loop ; Run the loop for getting the offset.
{ ; Beginning of loop.
If piOffset <= 0 || piOffset =
{
InputBox, piOffset, What Starting Position Do You Want?, Current offset is %piOffset%
piQty := piOffset
IniWrite, %piOffset%, preferences.ini, Data, Offset
continue
}
else
break
} ; Ending of loop.
Loop ; Run the loop for getting the quantity.
{ ; Beginning of loop.
If piDigitQty <= 0 || piDigitQty =
{
InputBox, piDigitQty, How Many Digits After The Offset Do You Want?, Current Quantity is %piDigitQty%
IniWrite, %piDigitQty%, preferences.ini, Data, Quantity
continue
}
else
break
} ; Ending of loop.
FileRead, piDigits, Digits.txt ; Reads the file that contains the digits.

pigQty := piOffset ; If you do more than one group, it will automatically navigate to get the next consecutive groups, so we want to remember where we start before running this so we can bring it back when it's done.

InputBox, dGroups, How Many Groups?, How many groups of %piDigitQty% would you like to type? ; If you want to type in more than one group of however many digits you have, you can specify that here. Number stored in "dGroups" variable.

WinActivate, %pTitle% ; Makes sure the text editor you selected previously, has activated. This is the reason "pTitle" needs to be global.

dQty = 0 ; Creates a new variable called "dQty", which keeps track of how many groups you have typed in so far. Essential to ending a loop we are running for each group we have.

Loop ; Starts the loop for typing in our group(s) of digits.
{ ; Beginning of loop.
dQty := dQty + 1 ; Incrementally increases per group we are working on.

StringMid, piResult, piDigits, %piOffset%, %piDigitQty% ; Purging results for every group we are typing.

Send %piResult% ; Types in the result.
if (dQty >= dGroups) ; Checks if we have typed in all of the groups we need.
break ; If we have, we will end the loop.
else ; If not... Then keep going until we finish all of our groups.
Send {Enter} ; Send enter if we are doing more than one group and not on the last. This prevents it from typing in an extra enter, AFTER we have typed our last group.
piOffset := piOffset+piDigitQty ; Navigates to our next group of digits and repeats the loop until finished.
} ; Ending of loop.
piOffset := pigQty ; Since we are finished typing, we want to set our offset back to where we first started before typing.
} ; Ending of keyboard shortcut function.
return ; Needed at the end of every shortcut.

bPi(){ ; Checks if you press the keyboard shortcut, according to the INI file.
if piOffset != ; Makes sure we have an offset. If not, don't do anything for now.
{ ; Beginning bracket of true statement.
piOffset := piOffset-piDigitQty ; If we have an offset, go back our x amount of digits.
IniWrite, %piOffset%, preferences.ini, Data, Offset ; Saves our new offset.
} ; Ending bracket of true statement.
else
{ ; Beginning bracket of false statement.
Loop ; Beginning of first loop.
{
IniRead, piOffset, preferences.ini, Data, Offset, %A_Space%
If piOffset <= 0 || piOffset =
{
InputBox, piOffset, What Starting Position Do You Want?, Current offset is %piOffset%
piQty := piOffset
IniWrite, %piOffset%, preferences.ini, Data, Offset
continue
}
else
break
} ; Ending of first loop.
Loop
{ ; Beginning of second loop.
IniRead, piDigitQty, preferences.ini, Data, Quantity, %A_Space%
If piDigitQty <= 0 || piDigitQty =
{
InputBox, piDigitQty, How Many Digits After The Offset Do You Want?, Current Quantity is %piDigitQty%
IniWrite, %piDigitQty%, preferences.ini, Data, Quantity
continue
}
else
break
} ; Ending of second loop.
} ; Ending of false if statement.
} ; Ending of keyboard shortcut function.
return

nPi(){ ; Checks if you press the keyboard shortcut, according to the INI file.
piDQty := piQty-piDigitQty
piDaily := piOffset-piDQty
piOffset := piOffset-piDaily+piDigitQty
IniWrite, %piOffset%, preferences.ini, Data, Offset
}
return ; Needed at the end of every shortcut.

cPi(){ ; Checks if you press the keyboard shortcut, according to the INI file.
piQty := piOffset ; Reset out starting offset to our current offset.
} ; Ending of keyboard shortcut function.
return ; Needed at the end of every shortcut.

mTimer(){ ; Checks if you press the keyboard shortcut, according to the INI file.
Run, Minutes Timer.exe ; Run the minutes based timer application.
} ; Ending of keyboard shortcut function.
return ; Needed at the end of every shortcut.

sTimer(){ ; Checks if you press the keyboard shortcut, according to the INI file.
Run, Seconds Timer.exe ; Run the seconds based timer application.
} ; Ending of keyboard shortcut function.
return ; Needed at the end of every shortcut.

ePi(){ ; Checks if you press the keyboard shortcut, according to the INI file.
ExitApp ; Close this program. Note the offset and quantity are still stored in INI file.
} ; Ending of keyboard shortcut function.
return ; Needed at the end of every shortcut.

rPi(){ ; Checks if you press the keyboard shortcut, according to the INI file.
IniWrite, %A_Space%, preferences.ini, Data, Offset ; Resets the offset to nothing.
IniWrite, %A_Space%, preferences.ini, Data, Quantity ; Resets the quantity to nothing.
reload ; Restarts the script.
} ; Ending of keyboard shortcut function.
return ; Needed at the end of every shortcut.