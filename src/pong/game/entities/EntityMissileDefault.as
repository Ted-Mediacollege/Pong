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
	
	public class EntityMissileDefault extends EntityMissile
	{		
		public function EntityMissileDefault(px:Number, py:Number, vd:Number) 
		{
			super(new Image(Textures.blueMissile), px, py, vd, 0xAD99FE, 50, 8);
			
			art.pivotX = 35;
			art.pivotY = 39;
		}	
		
		override public function tick():void
		{
			update();
		}
	}
}