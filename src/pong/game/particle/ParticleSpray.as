package pong.game.particle 
{
	import starling.display.Shape;
	import pong.engine.util.MathHelper;
	import pong.engine.util.Coords;
	import pong.game.data.Settings;
	
	public class ParticleSpray extends ParticleBase
	{
		public var particlesX:Vector.<Number>;
		public var particlesY:Vector.<Number>;
		public var particlesR:Vector.<Number>;
		public var particlesS:Vector.<Number>;
		public var particlesT:Vector.<int>;
		
		public var color:uint;
		public var range:Number;
		public var speed:Number;
		public var spawn:int;
		public var time:int;
		public var done:Boolean;
		public var start:Number;
		
		public var posX:int;
		public var posY:int;
		public var posR:int;
		
		public function ParticleSpray(px:Number, py:Number, d:Number, r:Number, a:int, s:Number, l:int, c:uint, st:Number) 
		{
			posX = px;
			posY = py;
			posR = d;
			
			color = c;
			range = r;
			spawn = a;
			speed = s;
			time = l;
			done = false;
			start = st;
			
			particlesX = new Vector.<Number>();
			particlesY = new Vector.<Number>();
			particlesR = new Vector.<Number>();
			particlesS = new Vector.<Number>();
			particlesT = new Vector.<int>();
		}
		
		override public function tick():void
		{
			graphics.clear();
			
			if (!done)
			{
				for (var j:int = 0; j < spawn; j++ )
				{
					if (MathHelper.nextInt(Settings.particles) == 0)
					{
						var nr:Number = posR - range + MathHelper.nextNumber(range * 2);
						if (start > 0)
						{
							particlesX.push(Coords.getNextX(posX, nr, start));
							particlesY.push(Coords.getNextY(posY, nr, start));
						}
						else
						{
							particlesX.push(posX);
							particlesY.push(posY);
						}
						particlesR.push(nr);
						particlesS.push(speed / 0.3);
						particlesT.push(time);
					}
				}
			}
			else if (particlesX.length < 1)
			{
				dead = true;
			}
			
			var a:int = particlesX.length;
			for (var i:int = a - 1; i > -1; i-- )
			{
				particlesT[i]--;
				if (particlesT[i] < 1)
				{
					particlesX.splice(i, 1);
					particlesY.splice(i, 1);
					particlesR.splice(i, 1);
					particlesS.splice(i, 1);
					particlesT.splice(i, 1);
				}
				else
				{
					var alp:Number = particlesT[i] / time * 4;
					if (alp > 1) { alp = 1; }
					graphics.lineStyle(2, color, alp);
					
					graphics.moveTo(particlesX[i], particlesY[i]);
					graphics.lineTo(
						Coords.getNextX(particlesX[i], particlesR[i], particlesS[i] * 2), 
						Coords.getNextY(particlesY[i], particlesR[i], particlesS[i] * 2)
					);
					
					particlesS[i] = particlesS[i] / 1.1;
					
					particlesX[i] = Coords.getNextX(particlesX[i], particlesR[i], particlesS[i]);
					particlesY[i] = Coords.getNextY(particlesY[i], particlesR[i], particlesS[i]);
				}
			}
		}
	}
}