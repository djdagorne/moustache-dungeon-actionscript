package  
{
	
	import flash.display.*;
	import flash.events.*;
	import flash.ui.Keyboard;

	import flash.utils.Timer;
	
	
	public class PlayableWizard extends Wizard 
	{
		
		public var HITTOP:Boolean;
		public var HITBOTTOM:Boolean;
		public var HITLEFT:Boolean;
		public var HITRIGHT:Boolean;
		
		public var upLook:Boolean;
		public var downLook:Boolean;
		public var leftLook:Boolean;
		public var rightLook:Boolean;
		
		
		

		/*Speed Variables for Character*/
		public var dx:int;
		public var dy:int;
		
		public function PlayableWizard(dx:int,dy:int) 
		{
			trace("Character has been created");
			
			upLook = false;
			downLook = false;
			leftLook = false;
			rightLook = false;
			
			// constructor code
			this.dx = dx; 									//sets the characters speed
			this.dy = dy; 									//sets the characters speed
			
			x = 160;										//position the Character on the x axis
			y = 201;										//position the Character on the y axis
			
			gotoAndStop("uIdle");
			addEventListener(Event.ENTER_FRAME,onEnter);	//handles the character animation
		}
		private function onEnter(e:Event)
		{
			//handling the animation for Character
			
			if(leftPressed /*&& !upPressed && !downPressed */&& !HITRIGHT)	//is the left key pressed and not hitting the right of a box
			{
				//Move Character left
				moveHorizontal(-dx);	//calls a function to move the character left dx pixels
				gotoAndStop("lWalk");	//plays the walk animation
				
				upLook = false;
				downLook = false;
				leftLook = true;
				rightLook = false;
				
			}
			if(rightPressed /*&& !upPressed && !downPressed */&& !HITLEFT)	//is the right key pressed and not hitting the left of a box
			{
				//do stuff if document class told Character right is pressed
				moveHorizontal(dx);		//calls a function to move the character right dx pixels
				gotoAndStop("rWalk");	//plays the walk animation
				
				upLook = false;
				downLook = false;
				leftLook = false;
				rightLook = true;
			}
			
			if(upPressed /*&& !leftPressed && !rightPressed */&& !HITBOTTOM)		//is the up key pressed and not hitting the bottom of a box
			{
				//do stuff if document class told Character right is pressed
				moveVertical(-dy);		//calls a function to move the character up dy pixels
				gotoAndStop("uWalk");	//plays the walk animation
				
				upLook = true;
				downLook = false;
				leftLook = false;
				rightLook = false;
			}
			if(downPressed /*&& !leftPressed && !rightPressed*/ && !HITTOP)		//is the down key pressed and not hitting the top of a box
			{
				//do stuff if document class told Character right is pressed
				moveVertical(dy);		//calls a function to move the character down dx pixels
				gotoAndStop("dWalk");	//plays the walk animation
				
				upLook = false;
				downLook = true;
				leftLook = false;
				rightLook = false;
			}
			/*if(upPressed && rightPressed && !HITBOTTOM)		//is the up key pressed and not hitting the bottom of a box
			{
				//do stuff if document class told Character right is pressed
				moveVertical(-dy);		//calls a function to move the character up dy pixels
				moveHorizontal(dx);		//calls a function to move the character right dx pixels
				gotoAndStop("uWalk");	//plays the walk animation
				
				upLook = true;
				downLook = false;
				leftLook = false;
				rightLook = false;
			}
			if(upPressed && leftPressed && !HITBOTTOM)		//is the up key pressed and not hitting the bottom of a box
			{
				//do stuff if document class told Character right is pressed
				moveVertical(-dy);		//calls a function to move the character up dy pixels
				moveHorizontal(-dx);		//calls a function to move the character right dx pixels
				gotoAndStop("uWalk");	//plays the walk animation
				
				upLook = true;
				downLook = false;
				leftLook = false;
				rightLook = false;
			}
			if(downPressed && rightPressed && !HITTOP)		//is the down key pressed and not hitting the top of a box
			{
				//do stuff if document class told Character right is pressed
				moveVertical(dy);		//calls a function to move the character down dx pixels
				moveHorizontal(dx);		//calls a function to move the character right dx pixels
				gotoAndStop("dWalk");	//plays the walk animation
				
				upLook = false;
				downLook = true;
				leftLook = false;
				rightLook = false;
			}
			if(downPressed && leftPressed && !HITTOP)		//is the down key pressed and not hitting the top of a box
			{
				//do stuff if document class told Character right is pressed
				moveVertical(dy);		//calls a function to move the character down dx pixels
				moveHorizontal(-dx);		//calls a function to move the character right dx pixels
				gotoAndStop("dWalk");	//plays the walk animation
				
				upLook = false;
				downLook = true;
				leftLook = false;
				rightLook = false;
			}*/
			
			
			if(zPressed)
			{
				if(upLook && upPressed)
				{
					gotoAndStop("uAttack")
					if(uAttack_mc.currentFrame == uAttack_mc.totalFrames)	//checks to see if the animation is done
					{
						zPressed = false;								//reset the z key so other things can happen
					}
					
				}//his direction affects his attack animation
				
				if(downLook && downPressed)
				{	
					if(dAttack_mc.currentFrame == dAttack_mc.totalFrames)	//checks to see if the animation is done
					{
						zPressed = false;								//reset the z key so other things can happen
					}
					gotoAndStop("dAttack")
				}
				
				if(leftLook && leftPressed)
				{
					
					if(lAttack_mc.currentFrame == lAttack_mc.totalFrames)	//checks to see if the animation is done
					{
						zPressed = false;								//reset the z key so other things can happen
					}
					gotoAndStop("lAttack")
				}
				
				if(rightLook && rightPressed)
				{	
					if(rAttack_mc.currentFrame == rAttack_mc.totalFrames)	//checks to see if the animation is done
					{
						zPressed = false;								//reset the z key so other things can happen
					}
					gotoAndStop("rAttack")
				}
				
				
			}
			if(!leftPressed && !rightPressed && !upPressed && !downPressed && !zPressed)
			{
				if(upLook && !upPressed)
				{
					gotoAndStop("uIdle")
				}
				if(downLook && !downPressed)
				{
					gotoAndStop("dIdle")
				}
				if(leftLook && !leftPressed)
				{
					gotoAndStop("lIdle")
				}
				if(rightLook && !rightPressed)
				{
					gotoAndStop("rIdle")
				}
			}
			
			
		}//closes function
		
		public function moveHorizontal(dx:int)
		{
			x += dx; //move character x at a speed of dx
		}
		
		public function moveVertical(dy:int)
		{
			y += dy; //move character x at a speed of dx
		}
	}
	
}
