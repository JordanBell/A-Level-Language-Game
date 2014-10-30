package  {
	
	import flash.display.MovieClip;
	
	public class FrameTransition extends MovieClip{

		public function FrameTransition() {
			// constructor code
		}

		public function customGotoFrame(frameName:String):void{
			trace("Listen");
			/*stage.addChild(this);
			this.x = 0;
			this.y = 0;
			gotoAndStop("Selection_Games", "Menus");*/
		}
	}
	
}
