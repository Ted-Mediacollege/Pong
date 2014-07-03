package pong.engine 
{
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import flash.utils.ByteArray;
	import pong.game.gui.GuiMenu;
	import pong.game.Main;
	import flash.events.MouseEvent;
	import starling.events.KeyboardEvent;
	import pong.engine.gui.GuiScreen;
	import pong.engine.input.InputKey;
	import pong.engine.input.InputMouse;
	import pong.engine.util.MathHelper;
	import pong.game.data.Keys;
	import pong.game.renderer.Textures;
	import starling.events.TouchPhase;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import pong.game.gui.GuiBackground;
	import starling.filters.BlurFilter;
	import starling.filters.ColorMatrixFilter;
	import starling.filters.DisplacementMapFilter;
	import starling.filters.FragmentFilter;
	
	public class Engine extends Sprite
	{
		public var background:GuiBackground;
		
		public static var activeGui:GuiScreen;
		public static var active:Boolean;
		
		public var mouse:InputMouse;
		public var key:InputKey;
		
		public function Engine() 
		{
			Textures.load();

			background = new GuiBackground();
			addChild(background);
			
			switchGui(new GuiMenu());
			
			//mouse events
			mouse = new InputMouse(this);
			addEventListener(TouchEvent.TOUCH, mouse.onMouse);
			
			//key events
			key = new InputKey();
			addEventListener(KeyboardEvent.KEY_DOWN, key.onKeyDown);
			addEventListener(KeyboardEvent.KEY_UP, key.onKeyUp);
			
			//tick
			addEventListener(EnterFrameEvent.ENTER_FRAME, tick);
		}

		public function switchGui(newGui:GuiScreen):void
		{
			active = false;
			if (activeGui != null)
			{
				removeChild(activeGui);
			}
			activeGui = newGui;
			addChildAt(newGui, 1);
			activeGui.saveEngine(this);
			activeGui.init();
			active = true;
		}
		
		public function tick(e:EnterFrameEvent):void
		{
			background.tick();
			if (active)
			{
				activeGui.tick();
			}
		}
	}
}