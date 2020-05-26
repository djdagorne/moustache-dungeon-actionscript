package  
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class TitleScreen extends MovieClip  //this was ScreenGOTY for some reason before, just a self-reminder
	{
		public function TitleScreen() 
		{
			addEventListener(Event.ADDED_TO_STAGE,onStage);
		}
		private function onStage(e:Event)
		{
			trace("loading title screen assets");
			
			newgame_button.addEventListener(MouseEvent.CLICK,onClick);
			//button2.addEventListener(MouseEvent.CLICK,onClick2);
		}
		public function onClick(e:MouseEvent)
		{
			trace("start clicked");
			dispatchEvent(new Event(ScreenGOTY.ROOM1));
			
		}
		public function onClick2(e:MouseEvent)
		{
			//trace("gaben pressed");
			//dispatchEvent(new Event(BaseScreen.putsomethingherelater));
		}
	}
	
}
