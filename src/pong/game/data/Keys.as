package pong.game.data 
{
	import flash.ui.Keyboard;
	import pong.engine.input.InputKey;
	
	public class Keys 
	{
		public static var P1_KEY_LEFT:int;
		public static var P1_KEY_RIGHT:int;
		public static var P2_KEY_LEFT:int;
		public static var P2_KEY_RIGHT:int;
		
		public static var Y:int;
		public static var O:int;
		public static var L:int;
		
		public static function init():void
		{
			P1_KEY_LEFT = InputKey.addKey(Keyboard.LEFT);
			P1_KEY_RIGHT = InputKey.addKey(Keyboard.RIGHT);
			P2_KEY_LEFT = InputKey.addKey(Keyboard.A);
			P2_KEY_RIGHT = InputKey.addKey(Keyboard.D);
			
			Y = InputKey.addKey(Keyboard.Y);
			O = InputKey.addKey(Keyboard.O);
			L = InputKey.addKey(Keyboard.L);
		}
	}
}