package pong.game.world 
{
	import flash.utils.ByteArray;
	import pong.engine.input.InputKey;
	import pong.engine.input.InputMouse;
	import pong.game.data.Keys;
	import pong.engine.util.Coords;
	import pong.game.gui.GuiTextGame;
	import pong.game.particle.Particle;
	import starling.display.Image;
	import pong.game.renderer.Textures;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.utils.deg2rad;
	import pong.engine.util.MathHelper;
	import pong.game.data.Stats;
	
	public class Player extends Sprite
	{
		public var kern:Image;
		public var shield:Image;
		public var posX:Number;
		public var posY:Number;
		public var posR:Number;
		public var hit:int;
		
		public var s:Shape;
		
		public var frame:int;
		
		public function Player(keys:int, px:Number, py:Number) 
		{
			posX = px;
			posY = py;
			posR = 0;
			
			s = new Shape();
			addChild(s);
			
			kern = new Image(Textures.player); 
			kern.x = posX;
			kern.y = posY;
			kern.pivotX = 68;
			kern.pivotY = 68;
			addChild(kern);
			
			shield = new Image(Textures.paddle);
			shield.x = posX;
			shield.y = posY;
			shield.pivotX = 18;
			shield.pivotY = 53;
			addChild(shield);
			
			frame = -1;
		}
		
		public function damage():void
		{
			World.hit = 20;
			Stats.lives--;
			if (Stats.lives == 0)
			{
				World.dead = true;
			}
			else
			{
				Stats.level -= int(Math.floor(Stats.level / 25)) + 1;
				if (Stats.level < 0)
				{
					Stats.level = 0;
				}
				World.worldtext.createText(new GuiTextGame(posX + 150, posY - 55, 50, "-1 LIFE"));
				World.worldparticle.createParticle(
					new Particle(
						posX, posY, 0, 180, 60, 25, 25, 0xD8D8D8, true, 40
					)
				);
			}
		}
		
		public function bounce():void
		{
			hit = 15;
		}
		
		public function tick():void
		{
			if (hit > 0)
			{
				hit--;
			}
			posR = Coords.getDegreeFromPoint(posX, posY, InputMouse.mouseX, InputMouse.mouseY);
			
			shield.x = Coords.getNextX(posX, posR, 80 - int(Math.floor(hit / 3)));
			shield.y = Coords.getNextY(posY, posR, 80 - int(Math.floor(hit / 3)));
			
			shield.rotation = deg2rad(posR);
		}
	}
}