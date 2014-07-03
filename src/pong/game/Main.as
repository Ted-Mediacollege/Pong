package pong.game
{
	import flash.display.Sprite;
	import flash.events.Event;
	import pong.game.gui.GuiMenu;
	import pong.game.world.World;
	import pong.engine.Engine;
	import flash.display.Shape;
	import pong.engine.audio.Audio;
	import pong.game.data.AudioList;
	import pong.game.renderer.Textures;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	
	import starling.core.Starling;

	[SWF(width="1280", height="720", frameRate="30", backgroundColor="#000000")]
	public class Main extends Sprite 
	{
		[Embed(source = "../../../lib/space age.ttf", fontFamily="costumFont", embedAsCFF="false")]
		public var customfont:String;
		
		public static var screenHeight:int;
		public static var screenWidth:int;
		
		public var starling:Starling;
		
		public function Main()
		{
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
			
			screenHeight = stage.stageHeight;
			screenWidth = stage.stageWidth;
			
			Audio.startBackgroundMusic(AudioList.music_backgroundloop1);
			
			starling = new Starling(Engine, stage);
			starling.start();
		}
	}
}