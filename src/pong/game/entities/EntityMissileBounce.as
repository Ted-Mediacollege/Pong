package pong.game.entities 
{
	import pong.engine.util.MathHelper;
	import pong.engine.util.Coords;
	import pong.game.world.World;
	import flash.display.MovieClip;
	import pong.game.Main;
	import pong.game.particle.Particle;
	import starling.display.Image;
	import pong.game.renderer.Textures;
	import starling.utils.deg2rad;
	
	public class EntityMissileBounce extends EntityMissile
	{		
		public function EntityMissileBounce(px:Number, py:Number, vd:Number) 
		{
			super(new Image(Textures.greenMissile), px, py, vd, 0x70DA70, 120, 8, 3);
			explosionsound = 2;
			
			art.pivotX = 26;
			art.pivotY = 29;
		}	
		
		override public function tick():void
		{
			update();
			art.rotation += deg2rad(6);
		}
	}
}