package pong.game.world 
{
	import flash.events.Event;
	import flash.utils.ByteArray;
	import pong.game.gui.GuiFlash;
	import pong.game.particle.Particle;
	import pong.engine.util.MathHelper;
	import pong.game.Main;
	import pong.game.entities.EntityMissileHoming;
	import starling.display.Sprite;
	import pong.game.event.*;
	import pong.game.data.Stats;
	
	public class World extends Sprite
	{
		public static var worldparticle:WorldParticle;
		//public static var worldanim:WorldAnimation;
		public static var worldentity:WorldEntity;
		public static var worldtext:WorldText;
		public static var flash:GuiFlash;
		
		public static var dead:Boolean;
		public static var hit:int;
		public var ended:Boolean;
		
		public static var activeEvent:EventBase;
		public var eventDelay:int;
		
		public function World() 
		{		
			worldentity = new WorldEntity();
			addChild(worldentity);
			
			//worldanim = new WorldAnimation();
			//addChild(worldanim);
			
			worldparticle = new WorldParticle();
			addChild(worldparticle);
			
			flash = new GuiFlash();
			addChild(flash);
			
			worldtext = new WorldText();
			addChild(worldtext);
		}
		
		public function build():void
		{
			dead = false;
			ended = false;
			
			Stats.score = 0;
			Stats.level = 20;
			Stats.lives = 100;
			
			worldentity.build();
			//worldanim.build();
			worldparticle.build();
			worldtext.build();
			
			activeEvent = new EventStart();
		}
		
		public function tick():void
		{
			if (hit > 0)
			{
				hit--;
				x = MathHelper.nextInt(int(Math.floor(hit / 2)));
				y = MathHelper.nextInt(int(Math.floor(hit / 2)));
			}
			else
			{
				x = 0;
				y = 0;
			}
			
			if (!dead)
			{
				worldentity.tick();
				//worldanim.tick();
			}
			else if(!ended)
			{
				endGame();
			}
			worldparticle.tick();
			worldtext.tick();
			flash.tick();
			
			activeEvent.eventLength--;
			if (activeEvent.eventLength < 0)
			{
				for (var k:int = 0; k < worldentity.PROJECTILES.length; k++ )
				{
					worldentity.PROJECTILES[k].endAction();
				}
				
				if (Stats.level < 40)
				{
					activeEvent = new EventEasy();
				}
				else
				{
					if (Stats.level > 100 && MathHelper.nextInt(8) == 0)
					{
						if (Stats.level > 200 && MathHelper.nextInt(2) == 0)
						{
							activeEvent = new EventBossTrow();
						}
						else
						{
							activeEvent = new EventBossHoming();
						}
					}
					else if (MathHelper.nextInt(2) == 0)
					{
						activeEvent = new EventRandom();
					}
					else
					{
						activeEvent = new EventRotate();
					}
				}
				eventDelay = 60;
			}
			else if(eventDelay < 0)
			{
				activeEvent.eventTick();
			}
			else
			{
				eventDelay--;
			}
		}
		
		public function endGame():void
		{
			ended = true;
			removeChild(worldentity);
			
			worldparticle.createParticle(
				new Particle(
					worldentity.PLAYER.posX, worldentity.PLAYER.posY, 0, 180, 120, 14, 45, 0xD8D8D8, false
				)
			);
			
			for (var i:int = 0; i < worldentity.PROJECTILES.length; i++ )
			{
				if (worldentity.PROJECTILES[i] is EntityMissileHoming)
				{
					(worldentity.PROJECTILES[i] as EntityMissileHoming).particlespray.done = true;
				}
				
				worldparticle.createParticle(
					new Particle(
						worldentity.PROJECTILES[i].posX, worldentity.PROJECTILES[i].posY, 0, 180, 45, 15, 45, worldentity.PROJECTILES[i].missileColor, true
					)
				);
			}
		}
	}
}