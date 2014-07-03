package pong.game.gui 
{
	import pong.engine.gui.GuiScreen;
	import pong.engine.gui.GuiText;
	import pong.engine.gui.GuiButton;
	import pong.game.Main;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.MovieClip;
	import pong.game.renderer.Textures;
	import pong.engine.util.MathHelper;
	
	public class GuiInstructions extends GuiScreen
	{
		public function GuiInstructions() 
		{
			x = -1280;
			timer = 16;
			next = -1;
			targetX = 0;
			targetY = 0;
		}
	
		override public function init():void
		{
			buttonList = new Vector.<GuiButton>();
			
			var a:Image = new Image(Textures.instructions);
			a.x = 320;
			a.y = 0;
			addChild(a);
			
			var b:GuiButton = new GuiButton(0, 450, 600);
			b.setText("Back to menu", 25, 0xFFFFFF);
			addChild(b);
			buttonList.push(b);
		}
		
		override public function tick():void
		{
			var disX:Number = targetX - x;
			var disY:Number = targetY - y;
			x += disX / 12;
			y += disY / 12;
			
			if (disX < 0.5 && disY < 0.5 && disX > -0.5 && disY > -0.5)
			{
				x = targetX;
				y = targetY;
			}
			
			if (timer < 16)
			{
				timer--;
				trace(timer);
				if (timer < 1)
				{
					timer--;
					action(next);
				}
			}
		}
		
		override public function action(id:int):void
		{
			targetX = -(1280 * 1.2);
			if (timer < 1)
			{
				if (id == 0)
				{
					engine.switchGui(new GuiMenu());
				}
			}
			else
			{
				next = id;
				timer = 15;
			}
		}
	}
}