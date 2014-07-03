package pong.game.data 
{
	import flash.media.Sound;
	
	public class AudioList 
	{
		public static var music_backgroundloop1:Sound = new AudioBackground1();
		
		public static var sound_explosionDefault:Sound = new AudioExplosionDefault();
		public static var sound_explosionBounce:Sound = new AudioExplosionBounce();
		public static var sound_explosionFast:Sound = new AudioExplosionFastball();
		
		public static var sound_bounce:Sound = new AudioMissileBounce();
		
		public static var sound_paddle:Sound = new AudioPaddle();
		
		public static var sound_menuClick:Sound = new AudioButtonPress();
		public static var sound_menuHover:Sound = new AudioButtonHover();
	}
}