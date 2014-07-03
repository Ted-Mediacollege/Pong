package pong.game.entities 
{
	import pong.engine.util.MathHelper;
	import pong.engine.util.Coords;
	import pong.game.animation.AnimationHoming;
	import pong.game.particle.ParticleSpray;
	import pong.game.world.World;
	import flash.display.MovieClip;
	import pong.game.particle.Particle;
	import starling.display.Image;
	import pong.game.renderer.Textures;
	import starling.utils.deg2rad;
	
	public class EntityMissileHoming extends EntityMissile
	{		
		public var particlespray:ParticleSpray;
		
		public var attackTimer:int;
		public var targetPosX:Number;
		public var targetPosY:Number;
		
		public function EntityMissileHoming(px:Number, py:Number, vd:Number) 
		{
			super(new Image(Textures.homeMissile), px, py, vd, 0xBF95EA, 120, 10);
			art.scaleX = 0.25;
			art.scaleY = 0.25;
			art.pivotX = 230;
			art.pivotY = 236;
			
			explosionsound = 3;
			
			attackTimer = 300 + MathHelper.nextInt(150);
			targetPosX = Coords.getNextX(World.worldentity.PLAYER.posX, Coords.getDegreeFromPoint(World.worldentity.PLAYER.posX, World.worldentity.PLAYER.posY, posX, posY) - 90, 280);
			targetPosY = Coords.getNextY(World.worldentity.PLAYER.posY, Coords.getDegreeFromPoint(World.worldentity.PLAYER.posX, World.worldentity.PLAYER.posY, posX, posY) - 90, 280);
			velD = Coords.getDegreeFromPoint(posX, posY, targetPosX, targetPosY);
			
			particlespray = new ParticleSpray(px, py, velD - 180, 10, 1, 5, 10, 0xBF95EA, 29);
			World.worldparticle.createParticle(particlespray);
		}	
		
		public function homingAI():void
		{
			attackTimer--;
			if (Coords.getDistance(posX, posY, targetPosX, targetPosY) < 5)
			{
				if (attackTimer < 0)
				{
					targetPosX = World.worldentity.PLAYER.posX;
					targetPosY = World.worldentity.PLAYER.posY;
					velD = Coords.getDegreeFromPoint(posX, posY, targetPosX, targetPosY);
				}
				else
				{
					targetPosX = Coords.getNextX(World.worldentity.PLAYER.posX, Coords.getDegreeFromPoint(World.worldentity.PLAYER.posX, World.worldentity.PLAYER.posY, posX, posY) - 5, 280);
					targetPosY = Coords.getNextY(World.worldentity.PLAYER.posY, Coords.getDegreeFromPoint(World.worldentity.PLAYER.posX, World.worldentity.PLAYER.posY, posX, posY) - 5, 280);
					velD = Coords.getDegreeFromPoint(posX, posY, targetPosX, targetPosY);
				}
			}
		}
		
		override public function tick():void
		{
			homingAI();
			update();
			
			particlespray.posR = velD - 180;
			particlespray.posX = posX;
			particlespray.posY = posY;
			if (dead)
			{
				particlespray.done = true;
				//World.worldanim.createAnim(new AnimationHoming(posX, posY, 0.5, velD));
			}
			art.rotation = deg2rad(velD);
		}
		
		override public function endAction():void
		{
			attackTimer = MathHelper.nextInt(60);
		}
	}
}