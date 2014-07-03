package pong.game.entities 
{
	import flash.display.MovieClip;
	import flash.display.NativeMenu;
	import pong.game.particle.Particle;
	import pong.game.world.World;
	import pong.engine.util.Coords;
	import pong.engine.util.MathHelper;
	import starling.display.Image;
	import pong.game.renderer.Textures;
	import starling.utils.deg2rad;
	
	public class EntityTurret extends Entity
	{	
		public var shootdelay:int;
		public var missilesleft:int;
		public var missilestypes:int;
		public var idle:Boolean;
		public var frame:int;
		
		public var posR:Number;
		public var posM:Number;
		
		public var art:Image;
		
		public function EntityTurret(px:Number, py:Number, rot:int) 
		{
			super(px, py);
			
			posR = rot;
			posM = rot;
			
			art = new Image(Textures.turret);
			art.rotation = deg2rad(posR);
			art.x = posX;
			art.y = posY;
			addChild(art);
			art.pivotX = 106;
			art.pivotY = 106;
		}
		
		override public function tick():void
		{
			if (missilesleft > 0)
			{
				shootdelay--;
				if (shootdelay < 1)
				{
					posR = posM;
					art.rotation = deg2rad(posR);
					
					shootdelay = 14;
					missilesleft--;
					
					var nx:Number = Coords.getNextX(posX, posR - 90, 95);
					var ny:Number = Coords.getNextY(posY, posR - 90, 95);
					var newMissile:EntityMissile;
					
					switch(missilestypes)
					{
						case 0: newMissile = new EntityMissileFast(nx, ny, posR - 90); break;
						case 1: newMissile = new EntityMissileBounce(nx, ny, posR - 90); break; 
						case 2: newMissile = new EntityMissileDefault(nx, ny, posR - 90); break; 
						case 3: newMissile = new EntityMissileFlash(nx, ny, posR - 90); break;
						case 4: newMissile = new EntityMissileHoming(nx, ny, posR - 90); break;
						case 5: newMissile = new EntityMissileTrow(nx, ny, posR - 90, 1); break;
						case 6: newMissile = new EntityMissileTrow(nx, ny, posR - 90, 0); break;
					}
					
					World.worldentity.addMissile(newMissile);
					World.worldparticle.createParticle(new Particle(nx, ny, posR - 90, 30, 30, 18, 20, newMissile.missileColor, false, 5));
				}
			}
			else
			{
				if (shootdelay > 0)
				{
					shootdelay--;
				}
				idle = true;
			}
		}
		
		public function shoot(missiles:int, type:int, delay:int = 0):void
		{
			idle = false;
			missilesleft = missiles;
			missilestypes = type;
			shootdelay = delay;
		}
	}
}