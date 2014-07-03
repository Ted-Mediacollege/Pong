package pong.game.event 
{
	import pong.game.world.World;
	import pong.game.data.Stats;
	
	public class EventRotate extends EventBase
	{
		public var turret:int;
		public var shoot:int;
		public var turn:int;
		public var direction:int;
		
		public var missileType:int;
		public var delay:int;
		public var turnDelay:int;
		
		public function EventRotate() 
		{
			eventName = "ROTATE";
			
			if (Stats.level < 50)
			{
				eventLength = 30 * 15;
				turnDelay = 30 * 7;
				missileType = 2;
				delay = 14;
			}
			else if (Stats.level < 100)
			{
				eventLength = 30 * 15;
				turnDelay = 30 * 7;
				missileType = 2;
				delay = 10;
			}
			else if (Stats.level < 150)
			{
				eventLength = 30 * 15;
				turnDelay = 30 * 7;
				missileType = 0;
				delay = 12;
			}
			else if (Stats.level < 200)
			{
				eventLength = 30 * 10;
				turnDelay = 30 * 7;
				missileType = 2;
				delay = 8;
			}
			else if (Stats.level < 250)
			{
				eventLength = 30 * 10;
				turnDelay = 30 * 7;
				missileType = 2;
				delay = 6;
			}
			else if (Stats.level < 350)
			{
				eventLength = 30 * 10;
				turnDelay = 30 * 7;
				missileType = 0;
				delay = 6;
			}
			else
			{
				eventLength = 30 * 10;
				turnDelay = 30 * 7;
				missileType = 0;
				delay = 4;
			}
			
			turret = 0;
			shoot = 0;
			direction = 1;
			turn = turnDelay;
		}
		
		override public function eventTick():void
		{
			turn--;
			if (turn < 0)
			{
				turn = turnDelay;
				direction = -direction;
			}
			
			shoot--;
			if (shoot < 0)
			{
				turret+=direction;
				if (turret < 0)
				{
					turret = 3;
				}
				if (turret > 3)
				{
					turret = 0;
				}
				
				shoot = delay;
				World.worldentity.TURRETS[turret].shoot(1, missileType);
			}
		}
	}
}