/*
	
	ZERO COOLS WELCOME.SQF SCRIPT
	TO RUN, ADD THIS TO INITPLAYERLOCAL.SQF AS IT IS			
		[] execVM "ADDONS\WELCOME.sqf";			
			
	3rd PERSON CAM 
	POINTED AT PLAYER
	SHOWING THE PLAYER SALUTING AS THEY JOIN
	ALSO DISPLAYS SOUND AND TEXT DURING CAMERA ANIMATION
	
	TURNING OFF THE SOUND IF YOU DONT USE OR HAVE ONE	
		OFF>	//playSound "CHANGEME";	
		ON>		playSound "CHANGEME";	

	IF YOU WANT TO CHANGE THE WELCOM TEXT 
	EDIT THIS LINE
		["Welcom To Arma!",[0,0,1,1],[10,10],1,3,0.3] spawn BIS_fnc_textTiles;
		TO
		["YOU TEXT HERE",[0,0,1,1],[10,10],1,3,0.3] spawn BIS_fnc_textTiles; 	

*/
	waitUntil {!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != ''};  
	// PLAY A SOUND DEFINED IN DESCRIPTION
	//playSound "ANTHEM";		
	[] spawn {
				// SWITCH TO 3RD PERSON
				player switchCamera "External";
				// FORCE PLAYER TO HOLSTER WEAPON IF IT DOES NOT WORK WITH SALUTE ANIMATION
				if ( (currentWeapon player) != ( primaryWeapon player) ) then 
					{
						 player action ['SwitchWeapon', player, player, -1];
						uisleep 2.5;
						player action ["salute", player];
						uisleep 2;
					}
					else
					{
						player action ["salute", player];
						uisleep 2; 					
					};  
				// CREAT CAMERA
				showCinemaBorder true;			   
				private _CAM = "camera" camCreate (player modelToWorld [1,1,1]);    
				_CAM cameraEffect ["Internal","TOP"]; 
				_CAM camSetTarget vehicle player;     
				_CAM camSetRelPos [1,15,10];     
				_CAM camSetFov 2;
				if ( sunOrmoon < 1 ) then 
					{       
						camUseNVG true; 
					} 
					else 
					{ 
						camUseNVG false; 
					}; 
				// SPEED OF THE CAMERA MOVEMENT IN SECONDS
				_CAM camCommit 10;
				// FIRST SLEEP SHOWING THE PLAYER SALUTING
				uisleep 4;
				// GREETING DISPLAY AFTER PLAYER IS SALUTING
				["Welcome To Arma!",[0,0,1,1],[10,10],1,3,0.3] spawn BIS_fnc_textTiles; 
				uisleep 3; 
				// KILL CAM
				_CAM cameraEffect ["terminate","back"];
				_CAM camSetPos (player modelToWorld [0,0,1]); 
				_CAM camCommit 2;
				uisleep 2; 
				camDestroy _CAM;
		};

