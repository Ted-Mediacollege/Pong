package pong.game.renderer 
{
	import adobe.utils.CustomActions;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.display.Image;
	
	public class Textures 
	{
		[Embed(source = "../../../../lib/assets.png")]
		public static var assets:Class;
		
		[Embed(source = "../../../../lib/assets.xml", mimeType="application/octet-stream")]
		public static var atlasXML:Class;
		
		public static var blueMissile:Texture;
		public static var redMissile:Texture;
		public static var greenMissile:Texture;
		public static var homeMissile:Texture;
		public static var yellowMissile:Texture;
		public static var cyanMissile:Texture;
		public static var purpleMissile:Texture;
		
		public static var player:Texture;
		public static var paddle:Texture;
		public static var turret:Texture;
		
		public static var gameover:Texture;
		public static var instructions:Texture;
		public static var logo:Texture;
		public static var credits:Texture;
		
		public static var button:Texture;
		public static var hover:Texture;
		
		public static function load():void
		{
			var s:Texture = Texture.fromBitmap(new assets());
			var x:XML = XML(new atlasXML());
			var atlas:TextureAtlas = new TextureAtlas(s, x);
			
			blueMissile = atlas.getTexture("blue"); //35 39
			redMissile = atlas.getTexture("red"); //55 37
			greenMissile = atlas.getTexture("green"); //26 29
			homeMissile = atlas.getTexture("home"); //230 236
			yellowMissile = atlas.getTexture("yellow"); //43 43
			cyanMissile = atlas.getTexture("cyan"); //39 39
			purpleMissile = atlas.getTexture("purple"); //38 38
			
			player = atlas.getTexture("player"); //68 68
			paddle = atlas.getTexture("paddle"); //18 53
			turret = atlas.getTexture("turret"); //106 106
			
			gameover = atlas.getTexture("gameover");
			instructions = atlas.getTexture("instructions");
			logo = atlas.getTexture("logo");
			credits = atlas.getTexture("credits");
		
			button = atlas.getTexture("button");
			hover = atlas.getTexture("hover");
		}
	}
}