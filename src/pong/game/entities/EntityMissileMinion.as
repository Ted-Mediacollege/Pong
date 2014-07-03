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
	
	public class EntityMissileMinion extends EntityMissile
	{		
		public function EntityMissileMinion(px:Number, py:Number, vd:Number) 
		{
			super(new Image(Textures.purpleMissile), px, py, vd, 0xFFA2E4, 50, 8);
			art.pivotX = 38;
			art.pivotY = 38;
			art.scaleX = 0.5;
			art.scaleY = 0.5;
		}	
		
		override public function tick():void
		{
			update();
		}
	}
}