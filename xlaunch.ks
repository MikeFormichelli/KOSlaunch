//helloLaunch

//First clear the screen
CLEARSCREEN.
if addons:available("RT"){
    local myRT is addons:RT.
    Print "The delay from KSC to myself is:" at (0,39).
    print myRT:KSCDelay(ship) + "seconds" at (0,40).
}
LOCK throttle to 1.0. //1.0 is the max

//COUNTDOWN LOOP

PRINT "COUNTING DOWN".
FROM {local countdown is 10.} UNTIL countdown = 0 STEP {SET countdown to countdown -1.} DO {
	PRINT "..." + countdown.
	WAIT 1. //pauses the script for 1 second.
}
stage.

clearscreen.

SET mysteer TO heading(90,90).
LOCK steering TO mysteer.

UNTIL Ship:Apoapsis > 100000 
{
        PRINT "SHIP APOAPSIS:" at (0,15).
        PRINT Round(ship:apoapsis,0) at (0,16).
        PRINT "SHIP PERAPSIS:" at (20,15).
        PRINT round(ship:periapsis,0) at (20,16).
        PRINT "SHIP LIQ FUEL:" AT (0,18).
        PRINT Round(ship:liquidfuel,0) AT (0,19).
        PRINT "SHIP OX:" at (20,18).
        PRINT Round(ship:oxidizer,0) AT (20,19).
        PRINT "SHIP ALTITUDE:" At (0,22).
        PRINT round(ship:altitude,0) at (0,23).
        PRINT "SHIP RADAR ALT:" At (20,22).
        PRINT round (alt:RADAR,0) at (20,23).
        PRINT "Ship Remaining Delta V:" at (0,25).
        PRINT round (Ship:deltav:current) at (0,26).
        print geoPosition:lat at (0,28).
        print geoPosition:lng at (20,28).

    if stage:liquidfuel = 1400{
        stage.
    }

    IF Ship:Velocity:Surface:mag < 100 {
		SET mysteer TO heading(90,90).
        
    }ELSE IF ship:velocity:surface:mag >= 100 AND ship:velocity:surface:mag < 200 
        {
	    SET mysteer TO heading (90,85).
	    PRINT "Pitching to 85 degrees" AT (0,14).
	
    } ELSE IF ship:velocity:surface:mag >=200 AND ship:velocity:surface:mag <300 {
	SET mysteer TO heading (90,80).
	PRINT "Pitching to 80 degrees" at (0,14).
	
    } ELSE IF SHIP:VELOCITY:SURFACE:MAG >= 300 AND SHIP:VELOCITY:SURFACE:MAG < 400  {
        SET MYSTEER TO HEADING(90,75).
        PRINT "Pitching to 75 degrees" AT(0,14).
        

    } ELSE IF SHIP:VELOCITY:SURFACE:MAG >= 400 AND SHIP:VELOCITY:SURFACE:MAG < 500 {
        SET MYSTEER TO HEADING(90,70).
        PRINT "Pitching to 70 degrees" AT(0,14).
        

    } ELSE IF SHIP:VELOCITY:SURFACE:MAG >= 500 AND SHIP:VELOCITY:SURFACE:MAG < 600   {
        SET MYSTEER TO HEADING(90,60).
        PRINT "Pitching to 60 degrees" AT(0,14).
        

    } ELSE IF SHIP:VELOCITY:SURFACE:MAG >= 600 AND SHIP:VELOCITY:SURFACE:MAG < 700  {
        SET MYSTEER TO HEADING(90,50).
        PRINT "Pitching to 50 degrees" AT(0,14).
        

    } ELSE IF SHIP:VELOCITY:SURFACE:MAG >= 700 AND SHIP:VELOCITY:SURFACE:MAG < 800  {
        SET MYSTEER TO HEADING(90,20).
        PRINT "Pitching to 20 degrees" AT(0,14).
        rcs on.

        
    } ELSE IF SHIP:VELOCITY:SURFACE:MAG >= 800 {
        SET MYSTEER TO HEADING(90,10).
        PRINT "Pitching to 10 degrees" AT(0,14).
    }.

}.

    PRINT "100,000 km apoapsis reached, cutting throttle" at (0,12).
    lock throttle to 0.
    lock steering to prograde.
    wait 1.
    Print "Next up, circularization" at (0,13).

    until ship:periapsis >=100000 and ship:apoapsis >=100000
    {
        
        PRINT "Circularizing" at (0,14).
        PRINT "SHIP APOAPSIS:" at (0,15).
        PRINT Round(ship:apoapsis,0) at (0,16).
        PRINT "SHIP PERAPSIS:" at (20,15).
        PRINT round(ship:periapsis,0) at (20,16).
        PRINT "SHIP LIQ FUEL:" AT (0,18).
        PRINT Round(ship:liquidfuel,0) AT (0,19).
        PRINT "SHIP OX:" at (20,18).
        PRINT Round(ship:oxidizer,0) AT (20,19).
        PRINT "SHIP ALTITUDE:" At (0,22).
        PRINT round(ship:altitude,0) at (0,23).
        PRINT "SHIP RADAR ALT:" At (20,22).
        PRINT round (alt:RADAR,0) at (20,23).
        PRINT "Ship Remaining Delta V:" at (0,25).
        PRINT round (Ship:deltav:current) at (0,26).
        print geoPosition:lat at (0,28).
        print geoPosition:lng at (20,28).
        lock steering to prograde.
    
       if ship:altitude >= 100000
       {
       
        lock throttle to 1.
       }
        if maxthrust = 0
           { 
            STAGE.
           }
       if periapsis >= 100000
            {
                lock throttle to 0.
                PRINT "Okay, we're there." at (0,30).
                wait 2.
                Stage.
                Panels on.
            }
    }
         

SET SHIP:CONTROL:PILOTMAINTHROTTLE TO 0.
Set ship:heading to prograde.
