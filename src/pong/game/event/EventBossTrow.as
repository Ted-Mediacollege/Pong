package pong.game.event 
{
	import pong.game.world.World;
	import pong.engine.util.MathHelper;
	
	public class EventBossTrow extends EventBase
	{
		public var shoot:int;
		public var delay:int;
		public var max:int;
		
		public function EventBossTrow() 
		{
			eventName = "BOSS2";
			delay = 80;
			max = 4;
			eventLength = 30 * 53;
		}
		
		override public function eventTick():void
		{
			shoot--;
			if (shoot < 0)
			{
				shoot = delay;
				if (max > -1)
				{
					max--;
					World.worldentity.TURRETS[0].shoot(1, 5);
				}
			}
		}
	}
}