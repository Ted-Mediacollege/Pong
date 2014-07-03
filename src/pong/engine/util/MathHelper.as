package pong.engine.util 
{
	public class MathHelper 
	{
		public static function nextInt(max:int):int
		{	
			return Math.floor(Math.random() * max);
		}

		public static function nextNumber(max:Number):int
		{	
			return Math.floor(Math.random() * max);
		}
		
		public static function rangeInt(min:int, max:int):int
		{
			return min + Math.floor(Math.random() * (max - min));
		}
		
		public static function rangeNumber(min:Number, max:Number):Number
		{
			return min + (Math.random() * (max - min));
		}
	}
}