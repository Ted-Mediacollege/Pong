package pong.game.world 
{
	import flash.display.MovieClip;
	import pong.game.animation.Animation;
	
	public class WorldAnimation extends MovieClip
	{
		public var ANIMATIONS:Vector.<Animation>;

		public function build():void
		{
			ANIMATIONS = new Vector.<Animation>();
		}
		
		public function tick():void
		{
			for (var i:int = 0; i < ANIMATIONS.length; i++ )
			{
				if (ANIMATIONS[i].dead)
				{
					removeChild(ANIMATIONS[i]);
					ANIMATIONS.splice(i, 1);
				}
			}
			
			for (var j:int = 0; j < ANIMATIONS.length; j++ )
			{
				ANIMATIONS[j].tick();
			}
		}
		
		public function createAnim(a:Animation):void 
		{
			var newAnim:Animation = a;
			ANIMATIONS.push(newAnim);
			addChild(newAnim);
		}
	}
}