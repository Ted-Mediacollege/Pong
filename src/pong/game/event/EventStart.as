package pong.game.event 
{
	import pong.game.world.World;
	import pong.engine.util.MathHelper;
		
	public class EventStart extends EventBase
	{
		public var shoot:int;
		
		public function EventStart() 
		{
			eventName = "START";
			eventLength = 30 * 15;
		}
		
		override public function eventTick():void
		{
			if (eventLength > 30 * 10)
			{
				shoot--;
				if (shoot < 0)
				{
					shoot = 35;
					World.worldentity.TURRETS[MathHelper.nextInt(4)].shoot(1, 2);
				}
			}
			else
			{
				shoot--;
				if (shoot < 0)
				{
					if (MathHelper.nextInt(2) == 0)
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
}