;------------------------------------------------------------------------

; Source code of Pi Training program with commentary.

; Key:
; ^ = Ctrl
; ! = Alt
; # = Win
; + = Shift

;------------------------------------------------------------------------

#p:: ; Checks if you press Win+P keyboard shortcut for displaying digits in text box.
Loop ; Begins a loop. This one is for making sure you have put in the offset correctly. If not, you will get nagged about it until you do, or enter some random character(s).
{ ; Beginning of loop

If piOffset <= 0 || piOffset = ; Checking if our offset is blank or negative. If so, we want a new one.

InputBox, piOffset, What Starting Position Do You Want?, Current offset is %piOffset% ; Let's provide a new offset.

If piOffset <= 0 || piOffset = ; Checking if our offset is blank or negative again. If so, we want to get nagged until it's a valid number, or letter or symbol I guess.

continue ; If it is blank or negative, nag again.

else ; If not...

break ; Then end this loop because we're probably good.
} ; Ending of loop.

Loop ; Begins another loop. This one is making sure you have put in the quantity correctly. If not, same behavior as the offset loop essentially.
{ ; Beginning of loop.

If piDigitQty = ; Defines the variable in parentheses if we haven't specified quantity yet.

piQty := piOffset ; Defines the variable in parentheses.

If piDigitQty <= 0 || piDigitQty = ; Checking if quantity is blank or negative.

InputBox, piDigitQty, How Many Digits After The Offset Do You Want?, Current Quantity is %piDigitQty% ; If blank, ask for quantity.

If piDigitQty <= 0 || piDigitQty = ; If still blank or negative, ask again.

continue ; Nags if blank

else ; If not...

break ; Then end the loop because we're probably good.
}
FileRead, piDigits, Digits.txt ; Reads the file that contains the digits of Pi the program can work with and stores it in a variable "piDigits". Currently 1,048,576 so the program isn't too slow. Can be unlimited, or as much as your computer can store. Digits generated through Y-cruncher, which can be downloaded here: http://www.numberworld.org/y-cruncher/

StringMid, piResult, piDigits, %piOffset%, %piDigitQty% ; Purges your specified offset and quantity reading from "piDigits" and applies the result to the "piResult" variable.

piDQty := piQty-piDigitQty ; Variable used to assist in showing the number in parentheses and allowing you to reset back to the starting offset.

piDaily := piOffset-piDQty ; The actual variable that shows how many digits you are since the starting offset. This will be negative if you go before this.

Msgbox, , %piOffset%; %piDigitQty%, %piResult% (%piDaily%) ; Displays the digits in a message box. The title will be your offset followed by the x amount of digits, each separated with a semi-colon.

return ; Needed at the end of every shortcut, otherwise it will glitch with other shortcuts within this program.


#+p:: ; Checks if you press Win+Shift+P for guessing the digits to quiz yourself.
Loop ; Runs the same two loops for specifying offset and quantity.
{ ; Beginning of first loop
If piOffset <= 0 || piOffset =
InputBox, piOffset, What Starting Position Do You Want?, Current offset is %piOffset%
If piOffset <= 0 || piOffset =
continue
else
break
} ; Ending of first loop
Loop
{ ; Beginning of second loop
If piDigitQty =
piQty := piOffset
If piDigitQty <= 0 || piDigitQty =
InputBox, piDigitQty, How Many Digits After The Offset Do You Want?, Current Quantity is %piDigitQty%
If piDigitQty <= 0 || piDigitQty =
continue
else
break
} ; Ending of second loop

FileRead, piDigits, 1048576 Digits.txt ; Reads the file that contains the digits of Pi the program can work with, storing in the "piDigits" variable. Needed for every shortcut.

StringMid, piResult, piDigits, %piOffset%, %piDigitQty% ; Purges the results based on the offset and quantity you specified.

piDQty := piQty-piDigitQty ; Used to assist in showing the number that is in parentheses.

piDaily := piOffset-piDQty ; The variable that shows how many digits you are since the starting offset.

InputBox, guessPi, What Digits Belong In This Region?, The offset is %piOffset% with %piDigitQty% digits. (%piDaily%) ; Displays the dialogue box where you can guess and test your knowledge of digits you may know, based on the offset and quantity. Stores your input in "guessPi" variable.

if(guessPi == piResult) ; Check if your input matches the result purged!

MsgBox, , Correct!, %piResult% is correct! ; If you are correct, message box will say you are correct! Using "piResult" instead of "guessPi" because it isn't the most reliable when checking large variables. This way, you can manually make sure you BOTH agree!

else ; If this statement is false...

MsgBox, , Incorrect!, Sorry, %guessPi% is incorrect! It should've been %piResult%! ; If you are incorrect, message box will say you are incorrect! Will show what you put in and what it should be.

return ; Needed at the end of every shortcut.


#!p:: ; Checks if you press Win+Alt+P to check if you want to navigate forward x amount of digits.

If piOffset != ; This is where we are navigating forward. We only want to do this if we specified an offset.

piOffset := piOffset+piDigitQty ; Allows us to move forward the next x amount of digits we have for our quantity.
Loop ; Runs those two loops again for offset and quantity.
{ ; Beginning of first loop
If piOffset <= 0 || piOffset =
InputBox, piOffset, What Starting Position Do You Want?, Current offset is %piOffset%
If piOffset <= 0 || piOffset =
continue
else
break
} ; Ending of first loop
Loop
{ ; Beginning of second loop
If piDigitQty =
piQty := piOffset
If piDigitQty <= 0 || piDigitQty =
InputBox, piDigitQty, How Many Digits After The Offset Do You Want?, Current Quantity is %piDigitQty%
If piDigitQty <= 0 || piDigitQty =
continue
else
break
} ; Ending of second loop

return ; Needed at the end of every shortcut.


#^+p:: ; Checks if we pressed Ctrl+Win+Shift+P to spontaneously change the quantity of digits shown.

Loop ; This is where we can specify a new quantity if we want to change it. It's in a loop because if we don't specify anything, we want it to nag you until you do. This will not work for letters or symbols. This is a bug I NEVER plan on fixing.
{ ; Beginning of loop

InputBox, piDigitQty, How Many Digits After The Offset Do You Want?, Current Quantity is %piDigitQty% ; Allows us to specify our new quantity. Will remind you what you already have before you change it.

If piDigitQty < 1 || piDigitQty <> 0 || piDigitQty = ; Makes sure you didn't type a number less than 1 or 0 or nothing at all.

continue ; Will make the loop nag you until you do what you're supposed to (specifying a number larger than 1)

else ; Otherwise you did what you were supposed to.

break ; If you entered a number correctly, you will no longer get nagged about this.

} ; Ending the loop
return ; Needed at the end of every shortcut.


^#p:: ; Checks if you pressed Ctrl+Win+P to check if you want to automatically type 1 or more groups of digits.
WinGetTitle, pTitle, a ; Get the title of the current window (the text editor) which will be used later.
Loop ; Begin that offset and quantity loop again.
{ ; Beginning of first loop.
If piOffset <= 0 || piOffset =
InputBox, piOffset, What Starting Position Do You Want?, Current offset is %piOffset%
If piOffset <= 0 || piOffset =
continue
else
break
} ; Ending of first loop.
Loop
{ ; Beginning of second loop.
If piDigitQty =
piQty := piOffset
If piDigitQty <= 0 || piDigitQty =
InputBox, piDigitQty, How Many Digits After The Offset Do You Want?, Current Quantity is %piDigitQty%
If piDigitQty <= 0 || piDigitQty =
continue
else
break
} ; Ending of second loop.

WinActivate, pTitle ; For some reason, running this causes text editor to go out of focus, so this will bring it back in focus if it was selected before pressing the shortcut for this.

FileRead, piDigits, 1048576 Digits.txt ; Reads the file that contains the digits.

pigQty := piOffset ; If you do more than one group, it will automatically navigate to get the next consecutive groups, so we want to remember where we start before running this so we can bring it back when it's done.

InputBox, dGroups, How Many Groups?, How many groups of %piDigitQty% would you like to type? ; If you want to type in more than one group of however many digits you have, you can specify that here. Number stored in "dGroups" variable.

dQty = 0 ; Creates a new variable called "dQty", which keeps track of how many groups you have typed in so far. Essential to ending a loop we are running for each group we have.

Loop ; Begins the loop
{ ; Beginning of loop
dQty := dQty + 1 ; Adds 1 to "dQty" to indicate we are starting our next group of digits.

StringMid, piResult, piDigits, %piOffset%, %piDigitQty% ; Purging results as usual, really important to be in loop because the result changes for every group we do.

Send %piResult% ; Types in the result.

if (dQty >= dGroups) ; Checks if we have typed in all of the groups we need.

break ; If we have, we will end the loop.

else ; If not... Then keep going until we finish all of our groups.

Send {Enter} ; Separates more than 1 group by pressing enter. Under else so when we type our last group, it doesn't do an extra enter at the end.

piOffset := piOffset+piDigitQty ; Navigates to our next group of digits and repeats the loop until finished.
} ; Ending of loop.

piOffset := pigQty ; Since we are finished typing, we want to set our offset back to where we first started before typing.

return ; Needed at the end of every shortcut.


#!+p:: ; Checks if we pressed Win+Alt+Shift+P to navigate backwards x amount of digits.

if piOffset != ; Makes sure we have an offset. If not, don't do anything for now.

piOffset := piOffset-piDigitQty ; If we have an offset, go back our x amount of digits.
Loop ; Run the loop again. If we have them already, they'll just end right away.
{ ; Beginning of first loop
If piOffset <= 0 || piOffset =
InputBox, piOffset, What Starting Position Do You Want?, Current offset is %piOffset%
If piOffset <= 0 || piOffset =
continue
else
break
} ; Ending of first loop
Loop
{ ; Beginning of second loop
If piDigitQty =
piQty := piOffset
If piDigitQty <= 0 || piDigitQty =
InputBox, piDigitQty, How Many Digits After The Offset Do You Want?, Current Quantity is %piDigitQty%
If piDigitQty <= 0 || piDigitQty =
continue
else
break
} ; Ending of second loop
return ; Needed at the end of every shortcut.


^!#+p:: ; Checks if you press Ctrl+Alt+Win+Shift+P to bring us back to our starting point.

piOffset := piOffset-piDaily+piDigitQty ; Algorithm that will bring us back our starting point.

return ; Needed at the end of every shortcut.

^#+i:: ; Checks if we pressed Ctrl+Win+Shift+I to change the starting offset to current position.
piQty := piOffset ; Change our starting offset to where we are now.
return ; Needed at the end of every shortcut.

#Home:: ; Checks if we press Win+Home to run a minute based timer.
Run, Minutes Timer.ahk ; Run the script for that minute based timer.
return ; Needed at the end of every shortcut.

#+Home:: ; Checks if we press Win+Shift+Home to run a second based timer entering x seconds instead of minutes.
Run, Seconds Timer.ahk ; Run the script for that seconds based timer.
return ; Needed at the end of every shortcut.

#i:: ; Checks if we pressed Win+I to close the Pi program.
ExitApp ; Closes the whole Pi program.
return ; Needed at the end of every shortcut.

#+i:: ; Checks if we pressed Win+Shift+I to reload the Pi program for resetting variables.
reload ; Reloads the program.
return ; Needed at the end of every shortcut.