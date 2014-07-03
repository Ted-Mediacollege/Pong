package pong.game.event 
{
	import pong.game.world.World;
	import pong.engine.util.MathHelper;
		
	public class EventEasy extends EventBase
	{
		public var shoot:int;
		
		public function EventEasy() 
		{
			eventName = "EASY";
			eventLength = 30 * 8;
		}
		
		override public function eventTick():void
		{
			shoot--;
			if (shoot < 0)
			{
				if (MathHelper.nextInt(4) == 0)
				{
					shoot = 42;
					World.worldentity.TURRETS[r].shoot(1, 1);
				}
				else if (MathHelper.nextInt(2) == 0)
				{
					shoot = 62;
					var r:int = MathHelper.nextInt(4);
					World.worldentity.TURRETS[r].shoot(2, 2);
					World.worldentity.TURRETS[getOtherRandom(r)].shoot(1, 0, 55);
				}
				else
				{
					shoot = 42;
					World.worldentity.TURRETS[MathHelper.nextInt(4)].shoot(2, 2);
				}
			}
		}
	}
}