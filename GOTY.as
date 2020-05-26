package  {
	
	import flash.display.*;
	import flash.events.*;
	
	
	public class GOTY extends MovieClip 
	{
		private var screen_mc;
		
		public function GOTY() 
		{
			screen_mc = new TitleScreen();
			addChild(screen_mc);
			screen_mc.addEventListener(ScreenGOTY.ROOM1,onScreenChange);
			
			//trace("game is compiled")
			
			//screen_mc.addEventListener(ScreenGOTY.ROOM1,onScreenChange);
		}
		private function onScreenChange(e:Event)
		{
			switch(e.type)
			{
				case ScreenGOTY.ROOM1:
					removeChild(screen_mc); //removing stuff
					
					screen_mc = new GameScreen();
					addChild(screen_mc);
					//trace("this adds the screen?")
					screen_mc.addEventListener(ScreenGOTY.TITLE,onScreenChange);
					break;
				/*case BaseScreen.TITLE:
					removeChild(screen_mc);
					
					screen_mc = new TitleScreen();
					screen_mc.addEventListener(BaseScreen.ROOM1,onScreenChange);
					screen_mc.addEventListener(BaseScreen.GABEN,onScreenChange);
					addChild(screen_mc);
					break;
				case BaseScreen.GABEN:					//creates a new screen state or whatever
					removeChild(screen_mc);				//removes the old screen
					
					screen_mc = new GabenScreen();		//makes screen_mc into the new screen
					addChild(screen_mc);				//throws up the new screen
					screen_mc.addEventListener(BaseScreen.GABEN,onScreenChange);
					break;*/
				
			}
		}
	}
	
}
