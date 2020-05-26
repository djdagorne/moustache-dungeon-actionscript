package  
{
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.ui.Keyboard;
	
	public class Wizard extends MovieClip
	{
		public var leftPressed:Boolean;
		public var rightPressed:Boolean;
		public var upPressed:Boolean;
		public var downPressed:Boolean;
		public var zPressed:Boolean;
		
		
		
		public function Wizard()
		{
			// constructor code
			leftPressed = false;
			rightPressed = false;
			upPressed = false;
			downPressed = false;
			zPressed = false;
			
			addEventListener(Event.ADDED_TO_STAGE,onStage);
			
		} //closes function
		
		private function onStage(e:Event)
		{
			//character is on stage so stop waiting for the character to be on stage
			removeEventListener(Event.ADDED_TO_STAGE,onStage);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyPress);
			stage.addEventListener(KeyboardEvent.KEY_UP,onKeyRelease);
			//stage.focus = null;
		}
		
		private function onKeyPress(e:KeyboardEvent)
		{
			switch(e.keyCode)
			{
				case Keyboard.LEFT:
					leftPressed = true;
					break;
				case Keyboard.RIGHT:
					rightPressed = true;
					break;
				case Keyboard.UP:
					upPressed = true;
					break;
				case Keyboard.DOWN:
					downPressed = true;
					break;
				case Keyboard.Z:
					zPressed = true;
					break;
			}
		}
		
		private function onKeyRelease(e:KeyboardEvent)
		{
			switch(e.keyCode)
			{
				case Keyboard.LEFT:
					leftPressed = false;
					break;
				case Keyboard.RIGHT:
					rightPressed = false;
					break;
				case Keyboard.UP:
					upPressed = false;
					break;
				case Keyboard.DOWN:
					downPressed = false;
					break;
				
			}
		}


	}
	
}
