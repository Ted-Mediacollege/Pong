package pong.engine.gui 
{
	import starling.display.Sprite;
	import starling.text.TextField;
	
	public class GuiText extends Sprite
	{
		public var tf:TextField;
		
		public function GuiText(px:int, py:int, s:int, c:uint, a:String) 
		{
			tf = new TextField(800, s * 2, "", "costumFont", s, c);
			tf.hAlign = a;
			tf.x = px;
			tf.y = py;
			//tf.embedFonts = true;
			//tf.setTextFormat(fo);
			//tf.selectable = false;
			
			if (a == "center") 
			{ 
				tf.x = tf.x - (tf.width / 2); 
			}
			else 
			{
				tf.x = tf.x; 
			}
			
			addChild(tf);
		}	
		
		public function setText(s:String):void
		{
			tf.text = s;
		}
		
		public function setColor(c:uint):void
		{
			tf.color = c;
		}
	}
}