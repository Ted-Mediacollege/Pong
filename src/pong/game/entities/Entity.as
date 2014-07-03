package pong.game.entities 
{
	import starling.display.Sprite;
	
	public class Entity extends Sprite
	{
		public var posX:Number;
		public var posY:Number;
		
		public function Entity(px:Number, py:Number) 
		{
			posX = px;
			posY = py;
		}
		
		public function tick():void
		{
		}
	}
}