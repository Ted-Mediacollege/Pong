package pong.engine.gui 
{
	import pong.engine.Engine;
	import pong.engine.audio.Audio;
	import pong.game.data.AudioList;
	import starling.display.Sprite;
	
	public class GuiScreen extends Sprite
	{
		public var engine:Engine;
		public var buttonList:Vector.<GuiButton>;
		public var targetX:Number;
		public var targetY:Number;
		public var timer:int;
		public var next:int;
		
		public function init():void { }
		public function tick():void { }
		public function unFocus():void { }
		public function action(id:int):void { }
		public function scroll(delta:int):void { }
		public function onKeyPress(key:int):void { }
		
		public function saveEngine(e:Engine):void
		{
			engine = e;
		}
		
		public function checkButtons(posX:int, posY:int):void
		{
			for (var i:int = 0; i < buttonList.length; i++ )
			{
				if (posX > buttonList[i].posX &&
					posY > buttonList[i].posY && 
					posX < buttonList[i].posX + buttonList[i].box[0] && 
					posY < buttonList[i].posY + buttonList[i].box[1] )
				{
					action(buttonList[i].id);
					Audio.playSoundEffect(AudioList.sound_menuClick);
					break;
				}
			}
		}
		
		public function checkHover(posX:int, posY:int):void
		{
			for (var i:int = 0; i < buttonList.length; i++ )
			{
				if (posX > buttonList[i].posX &&
					posY > buttonList[i].posY && 
					posX < buttonList[i].posX + buttonList[i].box[0] && 
					posY < buttonList[i].posY + buttonList[i].box[1] )
				{
					buttonList[i].hover(true);
				}
				else
				{
					buttonList[i].hover(false);
				}
			}
		}
	}
}