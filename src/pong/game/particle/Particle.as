package pong.game.particle 
{
	import flash.display.Sprite;
	import pong.engine.util.MathHelper;
	import pong.engine.util.Coords;
	import pong.game.world.WorldParticle;
	import pong.game.data.Settings;
	
	public class Particle extends ParticleBase
	{
		public var particlesX:Vector.<Number>;
		public var particlesY:Vector.<Number>;
		public var particlesR:Vector.<Number>;
		public var particlesS:Vector.<Number>;
		
		public var speed:Number;
		public var timetotal:int;
		public var time:int;
		public var color:uint;
		public var wallcol:Boolean;
		
		public function Particle(px:Number, py:Number, d:Number, r:Number, a:int, s:Number, l:int, c:uint, col:Boolean, start:int = 0) 
		{
			a = int(Math.floor(a / Settings.particles));
			
			time = l;
			timetotal = l;
			color = c;
			speed = s;
			wallcol = col;
			amount = a;
			
			WorldParticle.particles_currently += amount;
			
			particlesX = new Vector.<Number>(a);
			particlesY = new Vector.<Number>(a);
			particlesR = new Vector.<Number>(a);
			particlesS = new Vector.<Number>(a);
			
			var minspeed:Number = s / 0.6;
			
			for (var i:int = 0; i < a; i++ )
			{
				particlesR[i] = d - r + MathHelper.nextNumber(r * 2);
				if (start > 0)
				{
					particlesX[i] = Coords.getNextX(px, particlesR[i], start);
					particlesY[i] = Coords.getNextY(py, particlesR[i], start);
				}
				else
				{
					particlesX[i] = px;
					particlesY[i] = py;
				}
				particlesS[i] = MathHelper.rangeNumber(minspeed, s);
			}
		}
		
		override public function tick():void
		{
			var alp:Number = time / timetotal * 4;
			if (alp > 1) { alp = 1; }
			
			graphics.clear();
			graphics.lineStyle(2, color, alp);
			
			time--;
			if (time < 0)
			{
				dead = true;
			}
			else
			{
				for (var i:int = 0; i < amount; i++ )
				{
					graphics.moveTo(particlesX[i], particlesY[i]);
					graphics.lineTo(
						Coords.getNextX(particlesX[i], particlesR[i], particlesS[i] * 2), 
						Coords.getNextY(particlesY[i], particlesR[i], particlesS[i] * 2)
					);
					
					particlesS[i] = particlesS[i] / 1.1;
					
					particlesX[i] = Coords.getNextX(particlesX[i], particlesR[i], particlesS[i]);
					particlesY[i] = Coords.getNextY(particlesY[i], particlesR[i], particlesS[i]);
					
					if (wallcol)
					{
						if (particlesX[i] < 0)
						{
							particlesR[i] = bounce(particlesR[i], 180);
						}
						if (particlesY[i] < 0)
						{
							particlesR[i] = bounce(particlesR[i], -90);
						}
						if (particlesX[i] > 1280)
						{
							particlesR[i] = bounce(particlesR[i], 0);
						}
						if (particlesY[i] > 720)
						{
							particlesR[i] = bounce(particlesR[i], 90);
						}
					}
				}
			}
		}
		
		public function bounce(velD:Number, sideCol:Number):int
		{		
			var incommingD:Number = velD - sideCol;
			var newVelD:Number = incommingD - (incommingD * 2) + 180;
			return newVelD + sideCol;
		}
	}
}