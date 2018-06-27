#singleinstance off
InputBox, wTime, How many minutes? This can be decimal., Enter your value in minutes. Abort any time by pressing Ctrl+Win+Shift+Home.
wTimeS := wTime * 60
If wTime > 0 && wTime !=
msgbox, , Ready?, Then press okay! (%wTime% minutes)
If wTime <= 0 && wTime =
msgbox, , Ready?, Then press okay! (Timeless minutes)
Loop, %wTimeS%
{
sleep 1000
}
If wTime !=
msgbox, , Timer Finished!, Your %wTime% minutes are up!
If wTime =
msgbox, , Timer Finished!, Your timeless minutes are up!
Exitapp

^#+Home::
Exitapp