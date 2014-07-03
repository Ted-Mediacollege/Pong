package pong.game.world 
{
	import pong.game.gui.GuiTextGame;
	import starling.display.Sprite;
	
	public class WorldText extends Sprite
	{
		public var TEXT:Vector.<GuiTextGame>;
		
		public function WorldText() 
		{
		}
		
		public function build():void
		{
			TEXT = new Vector.<GuiTextGame>();
		}
		
		public function tick():void
		{
			for (var i:int = 0; i < TEXT.length; i++ )
			{
				if (TEXT[i].dead)
				{
					removeChild(TEXT[i]);
					TEXT.splice(i, 1);
				}
			}
			
			for (var j:int = 0; j < TEXT.length; j++ )
			{
				TEXT[j].tick();
			}
		}
		
		public function createText(a:GuiTextGame):void 
		{
			TEXT.push(a);
			addChild(a);
		}
	}
}