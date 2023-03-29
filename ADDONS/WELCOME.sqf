/*
	
	ZERO COOLS WELCOME.SQF SCRIPT
	
	PLAYS SONG AND SHOWS IMAGE FOR PLAYERS THAT JUST JOINNED
	EXAMPLE PHOTO SHOWN IN PICTURES FOLDER
	ONLY .PAA PHOTOS WORK
	2X1 RATIO OR 1X1 WILL WORK
	
	IF CREATING YOUR OWN IMAGE
	IMAGE WILL SHRINK HORIZONTALLY SO YOULL NEED TO OVER STRETCH YOUR OWN TO COMPENSATE
	
*/

	waitUntil {!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != ''};  
	if ( alive player ) then 
		{	
			uiSleep 1;
			/*
			 IF YOU DONT USE OR WANT THE SOUND TO PLAY
				ADD //  TO playSound "ANTHEM";
				LIKE SO
				//playSound "ANTHEM";
			*/
			playSound "ANTHEM";	
			// PUZZLE PEICE APPEAR THEN FADE AWAY
			//["DIRECTORY\PICTURE.paa",[x, y, width, hieght],[width, hieght],duration,fadeInOutTime,tileTransparency] spawn BIS_fnc_textTiles
			["PICTURES\OFGWELCOME.paa",[0,0,1,1],[5,5],5,2,0.3] spawn BIS_fnc_textTiles;	
		};


