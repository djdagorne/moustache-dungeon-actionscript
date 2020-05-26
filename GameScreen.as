package   
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;

	import flash.utils.Timer;
	
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

SoundChannel
	
	
	public class GameScreen extends MovieClip 
	{
		public var player1:PlayableWizard;
		public var level1:Room1;
		public var level1Boolean:Boolean;
		public var level2:Room2;
		public var level2Boolean:Boolean;
		public var level3:Room3;
		public var level3Boolean:Boolean;
		public var winner:winScreen;
		
		
		public var eyeSwitchArray:Array;
		
		public var blockArray:Array;
		
		public var walltileArray:Array;
		
		public var lockeddoorArray:Array;
		
		public var cashmoneyArray:Array;
		public var canewaxArray:Array;
		
		public var keyArray:Array;
		public var lockSwitch:Boolean;
		
		public var shellArray:Array;
		public var shellSwitch:Boolean;
		
		public var hittingWall:Boolean;
		
		//noises here
		public var filename:String = "sodaopen.mp3" // declare sound
		public var level1Theme:Sound;
		public var channel:SoundChannel;
		
		
		public function GameScreen() 
		{
			//
			addEventListener(Event.ADDED_TO_STAGE,onStage);
			// constructor code
		}
		public function onStage(e:Event)
		{
			removeEventListener(Event.ADDED_TO_STAGE, onStage); //lets code know that things are all added to stage now
			
			
			blockArray = new Array;
			eyeSwitchArray = new Array;
			cashmoneyArray = new Array;
			canewaxArray = new Array;
			keyArray = new Array;
			shellArray = new Array;
			walltileArray = new Array;
			lockeddoorArray = new Array;
			
			shellSwitch = false;
			lockSwitch = false;
			
			
			
			
			player1 = new PlayableWizard(3,3); 
			addChild(player1);
			
			level1= new Room1(); //delares the first room
			level1Boolean = true;
			level2Boolean = false;
			level3Boolean = false;
			
			addChildAt(level1,numChildren);
			swapChildren(player1,level1);
			loadLevelCollisions(level1); 
			
			//does that noise
			level1Theme = new Sound(new URLRequest("sodaopen.mp3"));
			level1Theme.play(0, 1);
			//level1Theme.play();
			
			setEyeStatus();
			
			addEventListener(Event.ENTER_FRAME, loop); //as level loads, go to loop
		}
		
		public function setEyeStatus()
		{
			
			/*eyeSwitchArray[0].gotoAndStop("open");
			eyeSwitchArray[1].gotoAndStop("open");
			eyeSwitchArray[2].gotoAndStop("open");
			eyeSwitchArray[3].gotoAndStop("open");
			eyeSwitchArray[4].gotoAndStop("open");
			eyeSwitchArray[5].gotoAndStop("open");*/
			
			for( var j:int = 0; j < eyeSwitchArray.length; j++)
			{
				
				eyeSwitchArray[j].gotoAndStop("open"); //this sets eyes to CLOSED by default
				
			}
			
		}
		
		public function loop(e:Event)
		{
			
			checkEyeStatus();   //loop basically goes through the eye check every time the level is loaded
			checkShellStatus();
			checkCollisions();
			if (shellSwitch == false)
			{
				checkShellCollisions();  //if all the eyes are not on (shellswitch = false) then keep them colliding on the stage
			}
			
		}
		
		public function checkEyeStatus()
		{
			var currentCount : int;
			currentCount = 0;
			
			for( var j:int = 0; j < eyeSwitchArray.length; j++)
			{
				
				var eyeCount : int;
				eyeCount = eyeSwitchArray.length
				
				
				
				
				if (eyeSwitchArray[j].currentLabel == ("closed"))
				{
						
					break;
					//break;
				}
				else if (eyeSwitchArray[j].currentLabel == ("open"))
				{
					//trace ( " is open");
					currentCount ++;
					//trace (currentCount);
				}

				
			}
			
			//trace ("looping");
			if (currentCount == eyeCount)
			{
					
					//trace ("thank you jesus");
					shellSwitch = true;
			
			}
		}
		
		private function checkShellStatus()
		{
			
			if (shellSwitch == true)
			{
				
				for( var l:int = 0; l < shellArray.length; l++)
				{
					
					shellArray[l].alpha = 0;
					
				}
				
			}
		}
		
		private function checkCollisions()
		{
			var leftSideWall:int;
			var rightSideWall:int;
			var topSideWall:int;
			var bottomSideWall:int;
			
			var leftSideCoin:int;
			var rightSideCoin:int;
			var topSideCoin:int;
			var bottomSideCoin:int;
			
			var leftSideWax:int;
			var rightSideWax:int;
			var topSideWax:int;
			var bottomSideWax:int;
			
			var leftSideKey:int;
			var rightSideKey:int;
			var topSideKey:int;
			var bottomSideKey:int;
			
			
			
			var leftSideLDoor:int;
			var rightSideLDoor:int;
			var topSideLDoor:int;
			var bottomSideLDoor:int;
			
			var leftSideShell:int;
			var rightSideShell:int;
			var topSideShell:int;
			var bottomSideShell:int;
			
			
			
			var buffer:int = 1;
			
			var leftSideWizard:int   = player1.x - player1.width/2;
			var rightSideWizard:int  = player1.x + player1.width/2;
			var topSideWizard:int    = player1.y - player1.height/2;
			var bottomSideWizard:int = player1.y + player1.height/2;
			
			
					
			for( var s:int; s < shellArray.length; s++ ) //############################################################SHELL LOOP
			{
				leftSideShell   = shellArray[s].x - shellArray[s].width/2;
				rightSideShell  = shellArray[s].x + shellArray[s].width/2;
				topSideShell    = shellArray[s].y - shellArray[s].height/2;
				bottomSideShell = shellArray[s].y + shellArray[s].height/2;
		
				if( ( rightSideWizard >= leftSideShell ) && ( leftSideWizard <= rightSideShell ) )
				{
					//Check the top of the wall
			
					if( ( bottomSideWizard <= topSideShell ) && ( bottomSideWizard + player1.dy >= topSideShell) )
					{
						player1.y = topSideShell - player1.height/2 - buffer;
						player1.HITTOP = true;
						hittingWall = true;
						trace("hitTOP");
						break;
					}
			//Check the bottom of the wall
					else if( ( topSideWizard >= bottomSideShell ) && ( topSideWizard - player1.dy <= bottomSideShell ) )
					{
						player1.y = bottomSideShell + player1.height/2 + buffer;
						player1.HITBOTTOM = true;
						hittingWall = true;
						trace("hitBOT");
						break;
					}
				}
		
				else
				{
					player1.HITTOP = false;
					player1.HITBOTTOM = false;
					hittingWall = false;
				}
				if( ( bottomSideWizard >= topSideShell) &&( topSideWizard <= bottomSideShell ) )
				{
					if( ( leftSideWizard >= rightSideShell ) && ( leftSideWizard - player1.dx <= rightSideShell ))
					{
						player1.x = rightSideShell + player1.width/2 + buffer;
						player1.HITRIGHT = true;
						//trace("hitRIGHT");
						break;
					}
				
					else if( ( rightSideWizard <= leftSideShell ) && ( rightSideWizard + player1.dy >= leftSideShell ) )
					{
						player1.x = leftSideShell - player1.width/2 - buffer;
						player1.HITLEFT = true;
						//trace("hitLEFT");
						break;
					}
				}
				else
				{
					player1.HITLEFT = false;
					player1.HITRIGHT = false;
				}
			}
			for( var c:int; c < cashmoneyArray.length; c++) // ############################################## COIN ARRAY
			{
				leftSideCoin   = cashmoneyArray[c].x - cashmoneyArray[c].width/2;
				rightSideCoin  = cashmoneyArray[c].x + cashmoneyArray[c].width/2;
				topSideCoin    = cashmoneyArray[c].y - cashmoneyArray[c].height/2;
				bottomSideCoin = cashmoneyArray[c].y + cashmoneyArray[c].height/2;
				
				if( ( rightSideWizard >= leftSideCoin ) && ( leftSideWizard <= rightSideCoin ) )
				{
					//Check the top of the wall&& ( bottomSideWizard + player1.dy >= topSideCoin)
					if( ( bottomSideWizard >= topSideCoin )  && (topSideWizard <= bottomSideCoin))
					{
						//removeChild(cashmoneyArray[c]);
						cashmoneyArray[c].alpha = 0;
						trace("increase swaggg");
						break;
					}
				}
			}
			for( var cw:int; cw < canewaxArray.length; cw++) // ############################################## WAX ARRAY
			{
				leftSideWax   = canewaxArray[cw].x - canewaxArray[cw].width/2;
				rightSideWax  = canewaxArray[cw].x + canewaxArray[cw].width/2;
				topSideWax    = canewaxArray[cw].y - canewaxArray[cw].height/2;
				bottomSideWax = canewaxArray[cw].y + canewaxArray[cw].height/2;
				
				if( ( rightSideWizard >= leftSideWax ) && ( leftSideWizard <= rightSideWax ) )
				{
					//Check the top of the wall&& ( bottomSideWizard + player1.dy >= topSideCoin)
					if( ( bottomSideWizard >= topSideWax )  && (topSideWizard <= bottomSideWax))
					{
						//removeChild(cashmoneyArray[c]);
						canewaxArray[cw].alpha = 0;
						trace("increase swaggg");
						break;
					}
				}
			}
			for( var k:int; k < keyArray.length; k++) // ############################################## K/EY ARRAY
			{
				leftSideKey   = keyArray[k].x - keyArray[k].width/2;
				rightSideKey  = keyArray[k].x + keyArray[k].width/2;
				topSideKey    = keyArray[k].y - keyArray[k].height/2;
				bottomSideKey = keyArray[k].y + keyArray[k].height/2;
				
				if( ( rightSideWizard >= leftSideKey ) && ( leftSideWizard <= rightSideKey ) )
				{
					//Check the top of the wall&& ( bottomSideWizard + player1.dy >= topSideCoin)
					if( ( bottomSideWizard >= topSideKey )  && (topSideWizard <= bottomSideKey))
					{
						//removeChild(cashmoneyArray[c]);
						keyArray[k].alpha = 0;
						trace("key picked up");
						lockSwitch = true;
						break;
					}
				}
			}
			
			for( var w:int; w < walltileArray.length; w++ )
			{
				leftSideWall   = walltileArray[w].x - walltileArray[w].width/2;
				rightSideWall  = walltileArray[w].x + walltileArray[w].width/2;
				topSideWall    = walltileArray[w].y - walltileArray[w].height/2;
				bottomSideWall = walltileArray[w].y + walltileArray[w].height/2;
				
				if( ( rightSideWizard >= leftSideWall ) && ( leftSideWizard <= rightSideWall ) )
				{
					//Check the top of the wall
					
					if( ( bottomSideWizard <= topSideWall ) && ( bottomSideWizard + player1.dy >= topSideWall) )
					{
						player1.y = topSideWall - player1.height/2 - buffer;
						player1.HITTOP = true;
						hittingWall = true;
						trace("hitTOP");
						break;
					}
					//Check the bottom of the wall
					else if( ( topSideWizard >= bottomSideWall ) && ( topSideWizard - player1.dy <= bottomSideWall ) )
					{
						player1.y = bottomSideWall + player1.height/2 + buffer;
						player1.HITBOTTOM = true;
						hittingWall = true;
						trace("hitBOT");
						break;
					}
					
					
					
					
				}
				
			
				
				else
				{
					player1.HITTOP = false;
					player1.HITBOTTOM = false;
					hittingWall = false;
				}

				if( ( bottomSideWizard >= topSideWall) &&( topSideWizard <= bottomSideWall ) )
				{
					if( ( leftSideWizard >= rightSideWall ) && ( leftSideWizard - player1.dx <= rightSideWall ))
					{
						player1.x = rightSideWall + player1.width/2 + buffer;
						player1.HITRIGHT = true;
						//trace("hitRIGHT");
						break;
					}
					
					else if( ( rightSideWizard <= leftSideWall ) && ( rightSideWizard + player1.dy >= leftSideWall ) )
					{
						player1.x = leftSideWall - player1.width/2 - buffer;
						player1.HITLEFT = true;
						//trace("hitLEFT");
						break;
					}
				}
				else
				{
					player1.HITLEFT = false;
					player1.HITRIGHT = false;
				}
			}
			for( var l:int; l < lockeddoorArray.length; l++)
			{
				leftSideLDoor   = lockeddoorArray[l].x - lockeddoorArray[l].width/2;
				rightSideLDoor  = lockeddoorArray[l].x + lockeddoorArray[l].width/2;
				topSideLDoor    = lockeddoorArray[l].y - lockeddoorArray[l].height/2;
				bottomSideLDoor = lockeddoorArray[l].y + lockeddoorArray[l].height/2;
				
				if(lockSwitch)
				{
					if( ( rightSideWizard >= leftSideLDoor ) && ( leftSideWizard <= rightSideLDoor ) )//if lockswitch = true make locked door a victory tile
					{
						
						//Check the bottom of the wall
						if( ( topSideWizard >= bottomSideLDoor ) && ( topSideWizard - player1.dy <= bottomSideLDoor ) )
						{
							if (level1Boolean)
							{
								level2 = new Room2();				//makes level 2 appear
				 				addChildAt(level2,numChildren);		//puts it on top of level 1
			 					swapChildren(player1,level2);		//redo order
				 				removeChild(level1);				//removes level from the background
								level1Boolean = false;
								level2Boolean = true;
								level3Boolean = false;
								player1.x = 160;										//position the Character on the x axis
								player1.y = 201;
								trace("go to room2");//also you can kind of walk through this door
								setEyeStatus();
								lockSwitch = false;
								loadLevelCollisions(level2)
								checkCollisions()
								break;
							}
							
							
							if (level2Boolean)
							{
								level3 = new Room3();				//makes level 2 appear
			 					addChildAt(level3,numChildren);		//puts it on top of level 1
			 					swapChildren(player1,level3);		//redo order
				 				removeChild(level2);				//removes level from the background
								level1Boolean = false;
								level2Boolean = false;
								level3Boolean = true;
								player1.x = 160;										//position the Character on the x axis
								player1.y = 201;
								trace("go to room3");//also you can kind of walk through this door
								setEyeStatus();
								lockSwitch = false;
								loadLevelCollisions(level3)
								checkCollisions()
								break;
							}
							if (level3Boolean)
							{
								winner = new winScreen();				//makes level 2 appear
			 					addChildAt(winner,numChildren);		//puts it on top of level 1
			 					swapChildren(player1,winner);		//redo order
				 				removeChild(level3);				//removes level from the background
								level1Boolean = false;
								level2Boolean = false;
								level3Boolean = false;
								player1.x = stage.stageWidth/2;										//position the Character on the x axis
								player1.y = stage.stageHeight/2;
								trace("go to WINNER");//also you can kind of walk through this door
								setEyeStatus();
								lockSwitch = false;
								loadLevelCollisions(winner);
								break;
							}
							
						}
					}
				}
				else//if it isn't true, that shit stays LOCKED
				{
					if(( rightSideWizard >= leftSideLDoor ) && ( leftSideWizard <= rightSideLDoor ))
					{
						//Check the bottom of the wall
						if( ( topSideWizard >= bottomSideLDoor ) && ( topSideWizard - player1.dy <= bottomSideLDoor ) )
						{
							player1.y = bottomSideLDoor + player1.height/2 + buffer;
							player1.HITBOTTOM = true;
							trace("hitBOT/get key now");
							break;
						}
					}
					else if (hittingWall = false)
					{
						player1.HITTOP = false;
						player1.HITBOTTOM = false;
					}
				}
			}
			
						
			
		
		}
		private function checkShellCollisions()
		{
			//trace ("checkingShellCollisions");
		}
		
		/*private function onClick(e:MouseEvent)
		{
			buttonMode = true;
			dispatchEvent(new Event(ScreenGOTY.TITLE));
		}*/
		private function loadLevelCollisions(levelToLoad:MovieClip)
		{
			if(blockArray.length != 0) //if the array has stuff in it
			{
				//remove all the objects from the array
				//the function splices out everything from index 0 to the end point
				blockArray.splice(0,blockArray.length-1);
			}
			if(eyeSwitchArray.length != 0) //if the array has stuff in it
			{
				//remove all the objects from the array
				//the function splices out everything from index 0 to the end point
				eyeSwitchArray.splice(0,eyeSwitchArray.length-1);
			}
			if(walltileArray.length != 0) //if the array has stuff in it
			{
				//remove all the objects from the array
				//the function splices out everything from index 0 to the end point
				walltileArray.splice(0,walltileArray.length-1);
			}
			if(canewaxArray.length != 0) //if the array has stuff in it
			{
				//remove all the objects from the array
				//the function splices out everything from index 0 to the end point
				canewaxArray.splice(0,canewaxArray.length-1);
			}
			if(cashmoneyArray.length != 0) //if the array has stuff in it
			{
				//remove all the objects from the array
				//the function splices out everything from index 0 to the end point
				cashmoneyArray.splice(0,cashmoneyArray.length-1);
			}
			if(keyArray.length != 0) //if the array has stuff in it
			{
				//remove all the objects from the array
				//the function splices out everything from index 0 to the end point
				keyArray.splice(0,keyArray.length-1);
			}
			if(shellArray.length != 0) //if the array has stuff in it
			{
				//remove all the objects from the array
				//the function splices out everything from index 0 to the end point
				shellArray.splice(0,shellArray.length-1);
			}
			if(lockeddoorArray.length != 0)
			{
				lockeddoorArray.splice(0,lockeddoorArray.length-1);
			}			
			//loop through all the objects in the movieclip
			for( var i:int = 0; i < levelToLoad.numChildren; i++)//grab each child by index value and store in a variable
			{
				trace(levelToLoad.getChildAt(i));
				
				var mc = levelToLoad.getChildAt(i);
				
				if( mc is Block)//check if it is a type of Collision object
				{
					blockArray.push(mc)//if its a Collision object, add it to the fixedObject array
				}
				if( mc is Shell)
				{
					shellArray.push(mc)//sends enemies to the badguy array
				}
				if( mc is BatKey)
				{
					keyArray.push(mc)//keys are keys
				}
				if( mc is SpinningCoin)
				{
					cashmoneyArray.push(mc)
				}
				if( mc is CaneWax)
				{
					canewaxArray.push(mc)
				}
				if( mc is LockedDoor)
				{
					lockeddoorArray.push(mc)
				}
				if( mc is WallTile)
				{
					walltileArray.push(mc)
				}
				else if( mc is EyeSwitch)
				{
					eyeSwitchArray.push(mc)
				}
			}
				
		}
		
	}
	
}
