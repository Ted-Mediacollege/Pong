package pong.game.world 
{
	import pong.game.particle.ParticleBase;
	import starling.display.Sprite;
	
	public class WorldParticle extends Sprite
	{
		public var PRATICLES:Vector.<ParticleBase>;
		public static var particles_currently:int;
		public static var particles_max:int = 1000;
		
		public function WorldParticle() 
		{
		}
		
		public function build():void
		{
			PRATICLES = new Vector.<ParticleBase>();
			particles_currently = 0;
		}
		
		public function tick():void
		{
			for (var i:int = 0; i < PRATICLES.length; i++ )
			{
				if (PRATICLES[i].dead)
				{
					particles_currently -= PRATICLES[i].amount;
					removeChild(PRATICLES[i]);
					PRATICLES.splice(i, 1);
				}
			}
			
			for (var j:int = 0; j < PRATICLES.length; j++ )
			{
				PRATICLES[j].tick();
			}
		}
		
		public function createParticle(p:ParticleBase):void
		{
			var newparticle:ParticleBase = p;
			PRATICLES.push(newparticle);
			addChild(newparticle);
		}
	}
}