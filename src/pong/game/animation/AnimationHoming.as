package pong.game.animation 
{
	public class AnimationHoming extends Animation
	{
		public function AnimationHoming(px:Number, py:Number, size:Number, rot:Number) 
		{
			art = new ArtEffectHoming();
			art.x = px;
			art.y = py;
			art.scaleX = size;
			art.scaleY = size;
			art.rotationZ = rot;
			addChild(art);
			
			frameRate = frameSkip;
			frameCurrent = 1;
			frameMax = 30;
			frameSkip = 0;
			
			dead = false;
			loop = false;
		}  
	}
}