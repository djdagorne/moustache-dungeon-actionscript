package  
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;

	import flash.utils.Timer;
	
	
	public class Room1 extends MovieClip 
	{
		
		
		/*public var level2:Room2;*/
		
		public function Room1() 
		{
			trace("Room1 function")
			
			
			addEventListener(Event.ADDED_TO_STAGE,onStage);
		}// constructor code
		private function onStage(e:Event)
		{
			
			trace("Room1s stuff is onStage");
			
			
			/*player1 = new PlayableWizard;
			addChild(player1);*/
			
			//level1 = new Room1;
			
			//addChildAt(level1,numChildren);
			//swapChildren(player1,level1);
			
		}
	}
	
}
