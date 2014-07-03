package pong.engine.gui 
{
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import pong.game.renderer.Textures;
	import starling.textures.Texture;
	
	public class GuiButton extends Sprite
	{
		public var art:MovieClip;
		
		public var text:GuiText;
		
		public var posX:int;
		public var posY:int;
		public var box:Vector.<int>;
		
		public var id:int;
		
		public function GuiButton(i:int, px:int, py:int) 
		{
			var mc:Vector.<Texture> = new Vector.<Texture>(2);
			mc[0] = Textures.button;
			mc[1] = Textures.hover;
			
			art = new MovieClip(mc);
			art.x = px;
			art.y = py;
			art.currentFrame = 0;
			addChild(art);
			
			posX = px;
			posY = py;
			box = new Vector.<int>(2);
			box[0] = 380;
			box[1] = 100;
			
			id = i;
		}
		
		public function setText(t:String, s:int, c:uint):void
		{
			text = new GuiText(posX + int(Math.floor(box[0] / 2) + 10), posY + 17, s, c, "center");
			text.setText(t);
			addChild(text);
		}
		
		public function updateText(t:String):void
		{
			if (text != null) 
			{
				text.setText(t);
			}
		}
		
		public function hover(hovering:Boolean):void
		{
			if (hovering)
			{
				art.currentFrame = 1;
			}
			else
			{
				art.currentFrame = 0;
			}
		}
	}
}