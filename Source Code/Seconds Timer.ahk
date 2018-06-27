#singleinstance off
InputBox, wTime, How many seconds? This can be decimal., Enter your value in seconds. Abort any time by pressing Ctrl+Win+Shift+Home.
If wTime > 0 && wTime !=
msgbox, , Ready?, Then press okay! (%wTime% seconds)
If wTime <= 0 && wTime =
msgbox, , Ready?, Then press okay! (Timeless seconds)
Loop, %wTime%
{
sleep 1000
}
If wTime !=
msgbox, , Timer Finished!, Your %wTime% seconds are up!
If wTime =
msgbox, , Timer Finished!, Your timeless seconds are up!
Exitapp

^#+Home::
Exitapp