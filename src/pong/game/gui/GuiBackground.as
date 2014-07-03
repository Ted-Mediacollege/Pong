package pong.game.gui 
{
	import pong.game.renderer.Textures;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import pong.engine.util.MathHelper;
	
	public class GuiBackground extends Sprite
	{
		[Embed(source = "../../../../lib/background.jpg")]
		public var bg_jpg:Class;
		public var img1:Image;
		public var img2:Image;
		
		public function GuiBackground() 
		{
			img1 = new Image(Texture.fromBitmap(new bg_jpg()));
			img2 = new Image(Texture.fromBitmap(new bg_jpg()));
			img2.x = 1280;
			
			addChild(img1);
			addChild(img2);
			
			flatten();
		}
		
		public function tick():void
		{
			x-=1;
			if (x < -1280)
			{
				x += 1280;
			}
		}
	}
}