package pong.game.animation 
{
	import flash.display.MovieClip;
	
	public class Animation extends MovieClip
	{
		public var art:MovieClip;
		public var frameCurrent:int;
		public var frameMax:int;
		public var frameSkip:int;
		public var frameRate:int;
		public var loop:Boolean;
		public var dead:Boolean;
		
		public function tick():void 
		{
			frameRate--;
			if (frameRate < 0)
			{
				frameRate = frameSkip
				art.gotoAndStop(frameCurrent);
				if (frameCurrent + 1 > frameMax)
				{
					if (loop)
					{
						frameCurrent = 1;
					}
					else
					{
						dead = true;
					}
				}
				else
				{
					frameCurrent++;
				}
			}
		}
	}
}