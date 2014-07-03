package pong.game.event 
{
	import pong.game.world.World;
	import pong.engine.util.MathHelper;
	
	public class EventTesting extends EventBase
	{
		public var shoot:int;
		public var delay:int;
		
		public function EventTesting() 
		{
			eventName = "TEST";
			delay = 120;
			eventLength = 30 * 300000;
		}
		
		override public function eventTick():void
		{
			shoot--;
			if (shoot < 0)
			{
				shoot = delay;
				World.worldentity.TURRETS[1].shoot(1, 3);
			}
		}
	}
}