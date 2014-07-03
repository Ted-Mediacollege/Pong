package pong.game.gui 
{
	import flash.display.MovieClip;
	import pong.engine.Engine;
	import pong.engine.gui.GuiScreen;
	import pong.engine.gui.GuiText;
	import pong.game.gui.GuiGame;
	import pong.game.data.Keys;
	import pong.engine.gui.GuiButton;
	import pong.game.Main;
	import flash.system.fscommand;
	import starling.display.Image;
	import pong.game.renderer.Textures;
	import pong.engine.util.Coords;
	import flash.desktop.NativeApplication;
	
	public class GuiMenu extends GuiScreen
	{
		public var logo:Image;
		
		public function GuiMenu() 
		{
			Keys.init();
			y = -720;
			
			timer = 16;
			next = -1;
			targetX = 0;
			targetY = 0;
		}
		
		override public function init():void
		{
			buttonList = new Vector.<GuiButton>();
			
			logo = new Image(Textures.logo);
			logo.x = (Main.screenWidth / 2) - 340;
			logo.y = 10;
			addChild(logo);
			
			var b:GuiButton = new GuiButton(0, (Main.screenWidth / 2) - 200, 200);
			var c:GuiButton = new GuiButton(1, (Main.screenWidth / 2) -	200, 320);
			var d:GuiButton = new GuiButton(2, (Main.screenWidth / 2) -	200, 440);
			var e:GuiButton = new GuiButton(3, (Main.screenWidth / 2) -	200, 560);
			
			b.setText("Start Game", 35, 0xFFFFFF);
			addChild(b);
			buttonList.push(b);
			
			c.setText("Instructies", 35, 0xFFFFFF);
			addChild(c);
			buttonList.push(c);
			
			d.setText("Credits", 35, 0xFFFFFF);
			addChild(d);
			buttonList.push(d);
			
			e.setText("End Game", 35, 0xFFFFFF);
			addChild(e);
			buttonList.push(e);
			
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
			if (id == 3)
			{
				NativeApplication.nativeApplication.exit();
			}
			else
			{
				targetY = -(720 * 1.3);
				if (timer < 1)
				{
					if (id == 0)
					{
						//start button
						engine.switchGui(new GuiGame());
					}
					if (id == 1)
					{
						//instruction Button
						engine.switchGui(new GuiInstructions());
					}
					if (id == 2)
					{
						//Credit Button
						engine.switchGui(new GuiCredits);
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
}