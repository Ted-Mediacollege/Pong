package pong.game.gui 
{
	import pong.game.Main;
	import starling.display.Shape;
	
	public class GuiFlash extends Shape
	{
		public var a:Boolean;
		public var timer:int;
		
		public function GuiFlash() 
		{
		}
		
		public function start():void
		{
			a = true;
			timer = 80;
			visible = true;
		}
		
		public function tick():void
		{
			graphics.clear();
			if (a)
			{
				timer--;
				if (timer < 1)
				{
					a = false;
					visible = false;
				}
				
				if (timer < 40)
				{
					graphics.lineStyle(0, 0xFFFFFF, timer / 30);
					graphics.beginFill(0xFFFFFF, timer / 30);
				}
				else
				{
					graphics.beginFill(0xFFFFFF, 1);
				}
				
				graphics.drawRect(-20,-20, Main.screenWidth + 40, Main.screenHeight + 40);
				graphics.endFill();
			}
		}
	}
}