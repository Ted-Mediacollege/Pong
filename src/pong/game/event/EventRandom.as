package pong.game.event 
{
	import pong.engine.util.MathHelper;
	import pong.game.world.World;
	import pong.game.data.Stats;
	
	public class EventRandom extends EventBase
	{
		public var shoot:int;
		public var delay:int;
		
		public function EventRandom() 
		{
			eventName = "RANDOM";
			delay = 20;
			eventLength = 30 * 30;
			
			if (Stats.level < 230)
			{
				delay = 20;
			}
			else if (Stats.level < 340)
			{
				delay = 16;
			}
			else
			{
				delay = 12;
			}
		}
		
		override public function eventTick():void
		{
			shoot--;
			if (shoot < 0)
			{
				shoot = delay;
				var r:int = MathHelper.nextInt(4);
				
				if (Stats.level < 230)
				{
					if(MathHelper.nextInt(13) == 0)
					{
						World.worldentity.TURRETS[r].shoot(1, 4);
					}
					else if(MathHelper.nextInt(4) == 0)
					{
						World.worldentity.TURRETS[r].shoot(1, 1);
						randomFast(r);
					}
					else
					{
						World.worldentity.TURRETS[r].shoot(1, 2);
						randomFast(r);
					}
				}
				else if (Stats.level < 340)
				{
					if(MathHelper.nextInt(13) == 0)
					{
						World.worldentity.TURRETS[r].shoot(1, 4);
					}
					else if(MathHelper.nextInt(3) == 0)
					{
						World.worldentity.TURRETS[r].shoot(1, 1);
						randomFast(r);
					}
					else
					{
						World.worldentity.TURRETS[r].shoot(1, 2);
						randomFast(r);
					}
				}
				else
				{
					if(MathHelper.nextInt(10) == 0)
					{
						World.worldentity.TURRETS[r].shoot(1, 4);
					}
					else if(MathHelper.nextInt(3) == 0)
					{
						World.worldentity.TURRETS[r].shoot(1, 1);
						randomFast(r);
					}
					else
					{
						World.worldentity.TURRETS[r].shoot(1, 2);
						randomFast(r);
					}
				}
			}
		}
		
		public function randomFast(r:int):void
		{
			if (Stats.level < 230)
			{
				if (MathHelper.nextInt(5) == 0)
				{
					shoot += 20;
					if (MathHelper.nextInt(4) == 0)
					{
						World.worldentity.TURRETS[getOtherRandom(r)].shoot(1, 3, 55);
					}
					else
					{
						World.worldentity.TURRETS[getOtherRandom(r)].shoot(1, 0, 55);
					}
				}
			}
			else if (Stats.level < 340)
			{
				if (MathHelper.nextInt(5) == 0)
				{
					shoot += 10;
					if (MathHelper.nextInt(4) == 0)
					{
						World.worldentity.TURRETS[getOtherRandom(r)].shoot(1, 3, 45);
					}
					else
					{
						World.worldentity.TURRETS[getOtherRandom(r)].shoot(1, 0, 45);
					}
				}
			}
			else
			{
				if (MathHelper.nextInt(5) == 0)
				{
					shoot += 5;
					if (MathHelper.nextInt(4) == 0)
					{
						World.worldentity.TURRETS[getOtherRandom(r)].shoot(1, 3, 35);
					}
					else
					{
						World.worldentity.TURRETS[getOtherRandom(r)].shoot(1, 0, 35);
					}
				}
			}
		}
	}
}