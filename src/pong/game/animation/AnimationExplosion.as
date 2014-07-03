package pong.game.animation 
{
	public class AnimationExplosion extends Animation
	{
		public function AnimationExplosion(px:Number, py:Number, size:Number, rot:Number, max:int = 2) 
		{
			art = new ArtExplosionFast();
			art.x = px;
			art.y = py;
			art.scaleX = size;
			art.scaleY = size;
			art.rotationZ = rot;
			addChild(art);
			
			frameRate = frameSkip;
			frameCurrent = 1;
			frameMax = 30;
			frameSkip = 1;
			
			dead = false;
			loop = false;
		}  
	}
}