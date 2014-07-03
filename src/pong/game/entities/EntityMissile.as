package pong.game.entities 
{
	import pong.engine.util.MathHelper;
	import pong.engine.util.Coords;
	import pong.game.animation.AnimationExplosion;
	import pong.game.particle.Particle;
	import pong.game.world.World;
	import flash.display.MovieClip;
	import pong.game.gui.GuiTextGame;
	import pong.game.Main;
	import pong.engine.audio.Audio;
	import pong.game.data.AudioList;
	import starling.display.Image;
	import pong.game.renderer.Textures;
	import starling.utils.deg2rad;
	import pong.game.data.Stats;
	
	public class EntityMissile extends EntityProjectile
	{		
		public var inside:Boolean;
		public var bounces:int;
		public var bounceCooldown:int;
		public var score:int;
		public var flash:Boolean;
		public var explosionsound:int;
		
		public var art:Image;
		
		public function EntityMissile(a:Image, px:Number, py:Number, vd:Number, c:uint, s:int, vs:Number = 8, b:int = 0) 
		{
			super(px, py, vd, vs);
			
			art = a;
			addChild(a);
			
			inside = false;
			missileColor = c;
			bounces = b;
			bounceCooldown = 0;
			score = s;
			flash = false;
			explosionsound = 1;
		}
		
		override public function tick():void
		{
			update();
		}
		
		public function update():void
		{
			if (!fieldCheck())
			{
				dead = true;
			}
			
			if (bounceCooldown > 0)
			{
				bounceCooldown--;
			}
			
			playerCheck();
						
			if (bounces > 0)
			{
				wallBounce();
			}
			
			posX = Coords.getNextX(posX, velD, velS);
			posY = Coords.getNextY(posY, velD, velS);
			
			art.x = posX;
			art.y = posY;
		}
		
		public function playerCheck():void
		{
			if (Coords.getDistance(posX, posY, World.worldentity.PLAYER.posX, World.worldentity.PLAYER.posY) < 110)
			{
				if (inside)
				{
					if (Coords.getDistance(posX, posY, World.worldentity.PLAYER.posX, World.worldentity.PLAYER.posY) < 57)
					{
						dead = true;
						World.worldentity.PLAYER.damage();
						onKill();
					}
					else if (Coords.getDistance(posX, posY, World.worldentity.PLAYER.posX, World.worldentity.PLAYER.posY) > 110)
					{
						inside = false;
					}
				}
				else
				{
					var playerDir:Number = Coords.getDegreeFromPoint(World.worldentity.PLAYER.posX, World.worldentity.PLAYER.posY, posX, posY) - World.worldentity.PLAYER.posR;
					if (playerDir > -45 && playerDir < 45)
					{			
						if (bounces > 0)
						{
							World.worldentity.PLAYER.bounce();
							onBounce();
						}
						else
						{
							dead = true;
							onDeath(playerDir);
						}
					}
					else if (Coords.getDistance(posX, posY, World.worldentity.PLAYER.posX, World.worldentity.PLAYER.posY) < 80)
					{
						inside = true;
					}
				}
			}
		}
		
		public function wallBounce():void
		{
			var v:Vector.<Boolean> = new Vector.<Boolean>(4);
			for (var i:int = 0; i < v.length; i++ ) { v[i] = bounceCheck(Coords.getNextX(posX, i * 90, 15), Coords.getNextY(posY, i * 90, 15)); }
			if (v[0]) { velD = bounce(velD, 0); }
			if (v[1]) { velD = bounce(velD, 90); }
			if (v[2]) { velD = bounce(velD, 180); }
			if (v[3]) { velD = bounce(velD, -90); }
		}
		
		public function fieldCheck():Boolean
		{
			if (posX < -20 || posY < -20 || posX > Main.screenWidth + 20 || posY > Main.screenHeight + 20)
			{
				return false;
			}
			return true;
		}		
		
		public function bounceCheck(x:Number, y:Number):Boolean
		{
			if (x < 0 || x > Main.screenWidth - 1 || y < 0 || y > Main.screenHeight -1 )
			{
				return true;
			}
			return false;
		}
		
		public function addScore(px:Number, py:Number, s:int):void
		{
			Stats.score += s;
			World.worldtext.createText(new GuiTextGame(px, py - art.pivotY, 32, "+" + s));
		}
		
		public function bounce(velD:Number, sideCol:Number, atPlayer:Boolean = false):int
		{		
			bounces--;
			if (atPlayer)
			{
				Audio.playSoundEffect(AudioList.sound_explosionBounce);
			}
			World.worldparticle.createParticle( new Particle(posX, posY, sideCol - 180, 130, 65, 15, 20, missileColor, false));
			if (bounces == 0 && !atPlayer)
			{
				return Coords.getDegreeFromPoint(posX, posY, World.worldentity.PLAYER.posX, World.worldentity.PLAYER.posY);
			}
			else
			{
				var incommingD:Number = velD - sideCol;
				var newVelD:Number = incommingD - (incommingD * 2) + 180;
				return newVelD + sideCol;
			}
		}
		
		public function onBounce():void
		{
			velD = bounce(velD, Coords.getDegreeFromPoint(posX, posY, World.worldentity.PLAYER.posX, World.worldentity.PLAYER.posY), true);
			bounceCooldown = 20;
		}
		
		public function onDeath(playerDir:Number):void
		{							
			addScore(posX, posY, score);
			
			Stats.level++;
			World.worldentity.PLAYER.bounce();
			
			World.worldparticle.createParticle(
				new Particle(
					Coords.getNextX(World.worldentity.PLAYER.posX, playerDir + World.worldentity.PLAYER.posR, 90), 
					Coords.getNextY(World.worldentity.PLAYER.posY, playerDir + World.worldentity.PLAYER.posR, 90), 
					velD - 180, 130, 100, 20, 20, missileColor, false
				)
			);
			
			if (explosionsound == 1) { Audio.playSoundEffect(AudioList.sound_explosionDefault); }
			else if (explosionsound == 2) { Audio.playSoundEffect(AudioList.sound_explosionBounce); }
			else if (explosionsound == 3) { Audio.playSoundEffect(AudioList.sound_explosionFast); }
		}
		
		public function onKill():void
		{
			if (flash)
			{
				World.flash.start();
			}
			
			if (explosionsound == 1) { Audio.playSoundEffect(AudioList.sound_explosionDefault); }
			else if (explosionsound == 2) { Audio.playSoundEffect(AudioList.sound_explosionBounce); }
			else if (explosionsound == 3) { Audio.playSoundEffect(AudioList.sound_explosionFast); }
		}
	}
}