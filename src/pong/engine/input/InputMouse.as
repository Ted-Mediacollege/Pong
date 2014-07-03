package pong.engine.input 
{
	import flash.events.MouseEvent;
	import pong.engine.Engine;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.events.TouchEvent;
	
	public class InputMouse 
	{
		public static var mouseX:int;
		public static var mouseY:int;
		public static var mouseDown:Boolean;
		public var engine:Engine;
		
		public function InputMouse(e:Engine)
		{
			engine = e;
		}
		
		public function onMouse(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(engine);
			if(touch)
			{
				if(touch.phase == TouchPhase.BEGAN)
				{
					mouseX = touch.globalX;
					mouseY = touch.globalY;
					mouseDown = true;
					if (Engine.active)
					{
						Engine.activeGui.checkButtons(mouseX, mouseY);
					}
				}
 
				else if(touch.phase == TouchPhase.ENDED)
				{
					mouseX = touch.globalX;
					mouseY = touch.globalY;
					mouseDown = false;
				}
 
				else if(touch.phase == TouchPhase.MOVED)
				{
					mouseX = touch.globalX;
					mouseY = touch.globalY;
					if (Engine.active)
					{
						Engine.activeGui.checkHover(mouseX, mouseY);
					}
				}
				
				else if(touch.phase == TouchPhase.HOVER)
				{
					mouseX = touch.globalX;
					mouseY = touch.globalY;
					if (Engine.active)
					{
						Engine.activeGui.checkHover(mouseX, mouseY);
					}
				}
			}
		}
	}
}