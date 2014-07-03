package pong.engine.util 
{	
	public class SimpleDate 
	{		
		public static function getDate():String
		{
			var date:Date = new Date;
			var d:int = date.date;
			var m:int = date.month;
			var y:int = date.fullYear;
			
			return String(d + "-" + m + "-" + y);
		}
	}
}