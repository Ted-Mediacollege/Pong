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
	
	public class EntityMissileFlash extends EntityMissile
	{		
		public function EntityMissileFlash(px:Number, py:Number, vd:Number) 
		{
			super(new Image(Textures.yellowMissile), px, py, vd, 0xF6F675, 250, 15);
			flash = true;
			
			art.pivotX = 43;
			art.pivotY = 43;
		}	
		
		override public function tick():void
		{
			update();
		}
	}
}