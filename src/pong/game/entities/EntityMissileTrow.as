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
	
	public class EntityMissileTrow extends EntityMissile
	{		
		public var particlespray:ParticleSpray;
		
		public var minions:int;
		public var minionTimer:int;
		public var targetPosX:Number;
		public var targetPosY:Number;
		
		public var type:int;
		
		public var sprayRotation:Number;
		
		public function EntityMissileTrow(px:Number, py:Number, vd:Number, t:int) 
		{
			super(new Image(Textures.purpleMissile), px, py, vd, 0xFFA2E4, 120, 5);
			art.pivotX = 38;
			art.pivotY = 38;
			art.scaleX = 1.5;
			art.scaleY = 1.5;
			
			type = t;
			
			sprayRotation = -180;
			explosionsound = 3;
			
			minions = 20;
			minionTimer = 160;
			targetPosX = Coords.getNextX(World.worldentity.PLAYER.posX, Coords.getDegreeFromPoint(World.worldentity.PLAYER.posX, World.worldentity.PLAYER.posY, posX, posY) - 90, 310);
			targetPosY = Coords.getNextY(World.worldentity.PLAYER.posY, Coords.getDegreeFromPoint(World.worldentity.PLAYER.posX, World.worldentity.PLAYER.posY, posX, posY) - 90, 310);
			velD = Coords.getDegreeFromPoint(posX, posY, targetPosX, targetPosY);
			
			particlespray = new ParticleSpray(px, py, velD - 180, 10, 1, 4, 12, 0xFFA2E4, 30);
			World.worldparticle.createParticle(particlespray);
		}	
		
		public function homingAI():void
		{
			if (Coords.getDistance(posX, posY, targetPosX, targetPosY) < 5)
			{
				targetPosX = Coords.getNextX(World.worldentity.PLAYER.posX, Coords.getDegreeFromPoint(World.worldentity.PLAYER.posX, World.worldentity.PLAYER.posY, posX, posY) - 5, 310);
				targetPosY = Coords.getNextY(World.worldentity.PLAYER.posY, Coords.getDegreeFromPoint(World.worldentity.PLAYER.posX, World.worldentity.PLAYER.posY, posX, posY) - 5, 310);
				velD = Coords.getDegreeFromPoint(posX, posY, targetPosX, targetPosY);
			}
		}
		
		override public function tick():void
		{
			homingAI();
			update();
			
			minionTimer--;
			if (minionTimer < 0)
			{
				if (minions < 0)
				{
					dead = true;
				}
				minions--;
				art.scaleX -= 0.04;
				art.scaleY -= 0.04;
				
				if (type == 1)
				{
					minionTimer = 50;
				}
				else
				{
					minionTimer = 150;
				}
				World.worldentity.addMissile(new EntityMissileMinion(posX, posY, Coords.getDegreeFromPoint(posX, posY, World.worldentity.PLAYER.posX, World.worldentity.PLAYER.posY)));
			}
			
			sprayRotation+=10;
			if (sprayRotation > 180)
			{
				sprayRotation -= 360;
			}
			particlespray.posR = velD + sprayRotation;
			particlespray.posX = posX;
			particlespray.posY = posY;
			
			if (dead)
			{
				particlespray.done = true;
			}
			art.rotation = deg2rad(velD);
		}
		
		override public function endAction():void
		{
			dead = true;
			particlespray.done = true;
			
			World.worldparticle.createParticle(
				new Particle(
					posX, posY, 0, 180, 100, 20, 20, missileColor, false
				)
			);
		}
	}
}