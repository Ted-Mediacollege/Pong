package pong.game.event 
{
	import pong.engine.util.MathHelper;
	
	public class EventBase 
	{
		public var eventLength:int;
		public var eventName:String;
		
		public function EventBase() 
		{
		}
		
		public function eventTick():void
		{
			
		}
		
		public function getOtherRandom(n:int):int
		{
			var max:int = 15;
			
			while (max > 0)
			{
				max--;
				var r:int = MathHelper.nextInt(4);
				if (n != r)
				{
					return r;
				}
			}
			
			return MathHelper.nextInt(4);
		}
	}
}