#singleinstance off ; Allows for multiple timers simultaneously

InputBox, wTime, How many minutes? This can be decimal., Enter your value in minutes. Abort any time by 
pressing Ctrl+Win+Shift+Home. ; Sets the timer in # of minutes.

wTimeS := wTime * 60 ; Since I'm doing the looping system based on 1 second for each repeat, I want to convert minutes to seconds in the background. Note that decimals are still supported for number of minutes.

If wTime > 0 && wTime != ; Makes sure the time set is not blank and negative.

msgbox, , Ready?, Then press okay! (%wTime% minutes) ; Message confirming to make sure you are ready to start your timer if the number is not blank or negative.

If wTime <= 0 && wTime = ; If it is blank or negative, as a joke, people can start a "timeless" timer.

msgbox, , Ready?, Then press okay! (Timeless minutes) ; Message confirming to make sure you are ready to start your timeless timer if the number is blank or negative. Lolz.

Loop, %wTimeS% ; The timer is based on a loop that operates and repeats once a second, thus equaling out to what you set the timer for, converted to seconds, even with decimals!
{ ; Beginning of loop
sleep 1000 ; Waits one second to repeat
} ; Ending of loop

If wTime != ; Checks if the timer was not blank and positive while running!

msgbox, , Timer Finished!, Your %wTime% minutes are up! ; If it wasn't, says the real timer is up!

If wTime = ; If the timer was blank (if negative too because of above statements), then say the timeless timer is up.

msgbox, , Timer Finished!, Your timeless minutes are up! ; Message saying the timeless timer is up.

Exitapp ; Closes this instance of the program since we are done here.


^#+Home:: ; Checks if we press Ctrl+Win+Shift+Home if you want to abort this timer at any given time throughout its lifespan.
Exitapp ; If so, end it all!