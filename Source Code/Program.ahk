#SingleInstance force
IniRead, dPi, preferences.ini, Shortcuts, dPi, %A_Space%
IniRead, qPi, preferences.ini, Shortcuts, qPi, %A_Space%
IniRead, fPi, preferences.ini, Shortcuts, fPi, %A_Space%
IniRead, bPi, preferences.ini, Shortcuts, bPi, %A_Space%
IniRead, pPi, preferences.ini, Shortcuts, pPi, %A_Space%
IniRead, gPi, preferences.ini, Shortcuts, gPi, %A_Space%
IniRead, nPi, preferences.ini, Shortcuts, nPi, %A_Space%
IniRead, cPi, preferences.ini, Shortcuts, cPi, %A_Space%
IniRead, mTimer, preferences.ini, Shortcuts, mTimer, %A_Space%
IniRead, sTimer, preferences.ini, Shortcuts, sTimer, %A_Space%
IniRead, ePi, preferences.ini, Shortcuts, ePi, %A_Space%
IniRead, rPi, preferences.ini, Shortcuts, rPi, %A_Space%
IniRead, hPi, preferences.ini, Shortcuts, hPi, %A_Space%
If dPi =
{
IniWrite, #p, preferences.ini, Shortcuts, dPi
IniRead, dPi, preferences.ini, Shortcuts, dPi, %A_Space%
}
If qPi =
{
IniWrite, #+p, preferences.ini, Shortcuts, qPi
IniRead, qPi, preferences.ini, Shortcuts, qPi, %A_Space%
}
If fPi =
{
IniWrite, #!p, preferences.ini, Shortcuts, fPi
IniRead, fPi, preferences.ini, Shortcuts, fPi, %A_Space%
}
If bPi =
{
IniWrite, #!+p, preferences.ini, Shortcuts, bPi
IniRead, bPi, preferences.ini, Shortcuts, bPi, %A_Space%
}
If pPi =
{
IniWrite, ^#+p, preferences.ini, Shortcuts, pPi
IniRead, pPi, preferences.ini, Shortcuts, pPi, %A_Space%
}
If gPi =
{
IniWrite, ^#p, preferences.ini, Shortcuts, gPi
IniRead, gPi, preferences.ini, Shortcuts, gPi, %A_Space%
}
If nPi =
{
IniWrite, ^!#+p, preferences.ini, Shortcuts, nPi
IniRead, nPi, preferences.ini, Shortcuts, nPi, %A_Space%
}
If cPi =
{
IniWrite, ^#+i, preferences.ini, Shortcuts, cPi
IniRead, cPi, preferences.ini, Shortcuts, cPi, %A_Space%
}
If mTimer =
{
IniWrite, #Home, preferences.ini, Shortcuts, mTimer
IniRead, mTimer, preferences.ini, Shortcuts, mTimer, %A_Space%
}
If sTimer =
{
IniWrite, #+Home, preferences.ini, Shortcuts, sTimer
IniRead, sTimer, preferences.ini, Shortcuts, sTimer, %A_Space%
}
If ePi =
{
IniWrite, #i, preferences.ini, Shortcuts, ePi
IniRead, ePi, preferences.ini, Shortcuts, ePi, %A_Space%
}
If rPi =
{
IniWrite, #+i, preferences.ini, Shortcuts, rPi
IniRead, rPi, preferences.ini, Shortcuts, rPi, %A_Space%
}
If hPi =
{
IniWrite, #/, preferences.ini, Shortcuts, hPi
IniRead, hPi, preferences.ini, Shortcuts, hPi, %A_Space%
}
IniRead, piOffset, preferences.ini, Data, Offset, %A_Space%
IniRead, piDigitQty, preferences.ini, Data, Quantity, %A_Space%
global piQty
global piOffset
global piDigitQty
global pTitle
piQty := piOffset
Hotkey, %dPi%, dPi, On
Hotkey, %qPi%, qPi, On
Hotkey, %fPi%, fPi, On
Hotkey, %bPi%, bPi, On
Hotkey, %pPi%, pPi, On
Hotkey, %gPi%, gPi, On
Hotkey, %nPi%, nPi, On
Hotkey, %cPi%, cPi, On
Hotkey, %mTimer%, mTimer, On
Hotkey, %sTimer%, sTimer, On
Hotkey, %ePi%, ePi, On
Hotkey, %rPi%, rPi, On
Hotkey, %hPi%, hPi, On

dPi(){
Loop
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
}
Loop
{
IniRead, piDigitQty, preferences.ini, Data, Quantity, %A_Space%
If piDigitQty <= 0 || piDigitQty =
{
InputBox, piDigitQty, How Many Digits After The Offset Do You Want?, Current Quantity is %piDigitQty%
IniWrite, %piDigitQty%, preferences.ini, Data, Quantity
continue
}
else
break
}
FileRead, piDigits, Digits.txt
StringMid, piResult, piDigits, %piOffset%, %piDigitQty%
piDQty := piQty-piDigitQty
piDaily := piOffset-piDQty
Msgbox, , %piOffset%; %piDigitQty%, %piResult% (%piDaily%)
}
return

qPi(){
Loop
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
}
Loop
{
IniRead, piDigitQty, preferences.ini, Data, Quantity, %A_Space%
If piDigitQty <= 0 || piDigitQty =
{
InputBox, piDigitQty, How Many Digits After The Offset Do You Want?, Current Quantity is %piDigitQty%
IniWrite, %piDigitQty%, preferences.ini, Data, Quantity
continue
}
else
break
}
FileRead, piDigits, Digits.txt
StringMid, piResult, piDigits, %piOffset%, %piDigitQty%
piDQty := piQty-piDigitQty
piDaily := piOffset-piDQty
InputBox, guessPi, What Digits Belong In This Region?, The offset is %piOffset% with %piDigitQty% digits. (%piDaily%)
if(guessPi == piResult)
MsgBox, , Correct!, %piResult% is correct!
else
MsgBox, , Incorrect!, Sorry, %guessPi% is incorrect! It should've been %piResult%!
}
return

fPi(){
If piOffset !=
{
piOffset := piOffset+piDigitQty
IniWrite, %piOffset%, preferences.ini, Data, Offset
}
else
{
Loop
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
}
Loop
{
IniRead, piDigitQty, preferences.ini, Data, Quantity, %A_Space%
If piDigitQty <= 0 || piDigitQty =
{
InputBox, piDigitQty, How Many Digits After The Offset Do You Want?, Current Quantity is %piDigitQty%
IniWrite, %piDigitQty%, preferences.ini, Data, Quantity
continue
}
else
break
}
}
}
return

pPi(){
Loop
{
InputBox, piDigitQty, How Many Digits After The Offset Do You Want?, Current Quantity is %piDigitQty%
IniWrite, %piDigitQty%, preferences.ini, Data, Quantity
If piDigitQty < 1 || piDigitQty <> 0 || piDigitQty =
continue
else
break
}
}
return

gPi(){
DetectHiddenWindows, On
WinGetTitle, pTitle, a
Loop
{
If piOffset <= 0 || piOffset =
{
InputBox, piOffset, What Starting Position Do You Want?, Current offset is %piOffset%
piQty := piOffset
IniWrite, %piOffset%, preferences.ini, Data, Offset
continue
}
else
break
}
Loop
{
If piDigitQty <= 0 || piDigitQty =
{
InputBox, piDigitQty, How Many Digits After The Offset Do You Want?, Current Quantity is %piDigitQty%
IniWrite, %piDigitQty%, preferences.ini, Data, Quantity
continue
}
else
break
}
FileRead, piDigits, Digits.txt
pigQty := piOffset
InputBox, dGroups, How Many Groups?, How many groups of %piDigitQty% would you like to type?
WinActivate, %pTitle%
dQty = 0
Loop
{
dQty := dQty + 1
StringMid, piResult, piDigits, %piOffset%, %piDigitQty%
Send %piResult%
if (dQty >= dGroups)
break
else
Send {Enter}
piOffset := piOffset+piDigitQty
}
piOffset := pigQty
}
return

bPi(){
if piOffset !=
{
piOffset := piOffset-piDigitQty
IniWrite, %piOffset%, preferences.ini, Data, Offset
}
else
{
Loop
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
}
Loop
{
IniRead, piDigitQty, preferences.ini, Data, Quantity, %A_Space%
If piDigitQty <= 0 || piDigitQty =
{
InputBox, piDigitQty, How Many Digits After The Offset Do You Want?, Current Quantity is %piDigitQty%
IniWrite, %piDigitQty%, preferences.ini, Data, Quantity
continue
}
else
break
}
}
}
return

nPi(){
piDQty := piQty-piDigitQty
piDaily := piOffset-piDQty
piOffset := piOffset-piDaily+piDigitQty
IniWrite, %piOffset%, preferences.ini, Data, Offset
}
return

cPi(){
piQty := piOffset
}
return

mTimer(){
Run, Minutes Timer.exe
}
return

sTimer(){
Run, Seconds Timer.exe
}
return

ePi(){
ExitApp
}
return

rPi(){
IniWrite, %A_Space%, preferences.ini, Data, Offset
IniWrite, %A_Space%, preferences.ini, Data, Quantity
reload
}
return

hPi(){
msgbox,
(
Default shortcuts (Also in video description featuring this program):

Display the digits of Pi: Win+P

Quiz yourself with specified offset and quantity: Win+Shift+P

Navigate forward x amount of digits: Win+Alt+P

Navigate backward x amount of digits: Win+Shift+Alt+P

Change the quantity of digits displayed or printed: Ctrl+Win+Shift+P

Type group(s) of specified digits as text: Ctrl+Win+P

Navigate back to the saved offset and quantity: Ctrl+Alt+Win+Shift+P

Change the saved offset to the current offset: Ctrl+Win+Shift+I

Run the minutes based timer: Win+Home

Run the seconds based timer: Win+Shift+Home

Quit this application: Win+I

Restart this script and reset the offset and quantity: Win+Shift+I

Show this help dialog: Win+? (No shift)
)
}
return