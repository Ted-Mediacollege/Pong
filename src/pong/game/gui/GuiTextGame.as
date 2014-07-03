package pong.game.gui 
{
	import pong.engine.gui.GuiText;
	
	public class GuiTextGame extends GuiText
	{
		public var alp:int;
		public var dead:Boolean;
		public var size:int;
		
		public function GuiTextGame(px:int, py:int, s:int, text:String) 
		{
			super(px, py, s, 0xFFFFFF, "center");
			size = s;
			alp = 30;
			setText(text);
		}
		
		public function tick():void
		{
			alp--;
			if (alp < 0)
			{
				dead = true;
				visible = false;
			}
			else
			{
				size--;
				tf.fontSize = size;
				tf.alpha = alp / 30;
			}
		}
	}
}