package pong.game.entities 
{
	import flash.display.MovieClip;
	import pong.game.Main;
	
	public class EntityProjectile extends Entity
	{
		public var velD:Number;
		public var velS:Number;
		
		public var missileColor:uint;
		public var dead:Boolean;
		
		public function EntityProjectile(px:Number, py:Number, vd:Number, vs:Number) 
		{
			super(px, py);
			
			velD = vd;
			velS = vs;
			dead = false;
		}
		
		override public function tick():void
		{
		}
		
		public function endAction():void
		{
			//used for homing and trow
		}
	}
}