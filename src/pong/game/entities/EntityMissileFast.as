package pong.game.entities 
{
	import pong.engine.util.MathHelper;
	import pong.engine.util.Coords;
	import pong.game.world.World;
	import flash.display.MovieClip;
	import pong.game.particle.Particle;
	import starling.display.Image;
	import pong.game.renderer.Textures;
	import starling.utils.deg2rad;
	
	public class EntityMissileFast extends EntityMissile
	{		
		public function EntityMissileFast(px:Number, py:Number, vd:Number) 
		{
			super(new Image(Textures.redMissile), px, py, vd, 0xE87272, 80, 8 + 5);
			explosionsound = 3;
			
			art.pivotX = 55;
			art.pivotY = 37;
		}	
		
		override public function tick():void
		{
			update();
			art.rotation = deg2rad(velD);
		}
	}
}