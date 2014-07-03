package pong.game.world 
{
	import pong.game.animation.Animation;
	import pong.game.entities.EntityMissile;
	import pong.game.entities.EntityMissileBounce;
	import pong.game.entities.EntityMissileFast;
	import pong.game.entities.EntityProjectile;
	import pong.engine.input.InputKey;
	import pong.game.data.Keys;
	import pong.engine.util.MathHelper;
	import pong.game.entities.EntityTurret;
	import pong.engine.util.Coords;
	import starling.display.Sprite;

	public class WorldEntity extends Sprite
	{
		public var PLAYER:Player; 
		
		public var PROJECTILES:Vector.<EntityProjectile>;
		public var TURRETS:Vector.<EntityTurret>;
		
		public var shootDelay:int;
		
		public function WorldEntity() 
		{
		}
		
		public function build():void
		{
			PROJECTILES = new Vector.<EntityProjectile>();
			TURRETS = new Vector.<EntityTurret>();
			
			PLAYER = new Player(1, 640, 360);
			addChild(PLAYER);
			
			var t1:EntityTurret = new EntityTurret(0, 0, 90 + Coords.getDegreeFromPoint(0, 0, 640, 360));
			var t2:EntityTurret = new EntityTurret(1280, 0, 90 + Coords.getDegreeFromPoint(1280, 0, 640, 360));
			var t3:EntityTurret = new EntityTurret(1280, 720, 90 + Coords.getDegreeFromPoint(1280, 720, 640, 360));
			var t4:EntityTurret = new EntityTurret(0, 720, 90 + Coords.getDegreeFromPoint(0, 720, 640, 360));
			TURRETS.push(t1);
			TURRETS.push(t2);
			TURRETS.push(t3);
			TURRETS.push(t4);
			addChild(t1);
			addChild(t2);
			addChild(t3);
			addChild(t4);
		}
		
		public function tick():void
		{
			PLAYER.tick();
			
			if(!World.dead)
			{	
				for (var tr:int = 0; tr < TURRETS.length; tr++ )
				{
					TURRETS[tr].tick();
				}
				
				for (var p1:int = 0; p1 < PROJECTILES.length; p1++ )
				{
					PROJECTILES[p1].tick();
				}
				
				for (var p2:int = PROJECTILES.length - 1; p2 > -1; p2-- )
				{
					if (PROJECTILES[p2].dead)
					{
						removeChild(PROJECTILES[p2]);
						PROJECTILES.splice(p2, 1);
					}
				}
			}
		}
		
		public function addMissile(m:EntityMissile):void
		{
			addChild(m);
			PROJECTILES.push(m);
		}
	}
}