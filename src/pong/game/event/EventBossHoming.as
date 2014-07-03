package pong.game.event 
{
	import pong.game.world.World;
	import pong.engine.util.MathHelper;
	import pong.game.data.Stats;
	
	public class EventBossHoming extends EventBase
	{
		public var shoot:int;
		public var delay:int;
		
		public function EventBossHoming() 
		{
			eventName = "BOSSHOMING";
			eventLength = 30 * 30;
			
			if (Stats.level > 200)
			{
				delay = 52;
			}
			else
			{
				delay = 42;
			}
		}
		
		override public function eventTick():void
		{
			shoot--;
			if (shoot < 0)
			{
				shoot = delay;
				World.worldentity.TURRETS[MathHelper.nextInt(4)].shoot(1, 4);
			}
		}
	}
}