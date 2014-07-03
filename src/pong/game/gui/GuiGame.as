package pong.game.gui 
{
	import starling.display.Image;
	import starling.display.MovieClip;
	import flash.media.Sound;
	import pong.engine.gui.GuiScreen;
	import pong.engine.gui.GuiText;
	import pong.engine.util.FpsMonitor;
	import pong.game.world.World;
	import pong.engine.gui.GuiButton;
	import pong.engine.util.FPScounter;
	import pong.game.Main;
	import pong.engine.util.MathHelper;
	import pong.game.particle.Particle;
	import pong.game.world.WorldParticle;
	import pong.engine.audio.Audio;
	import pong.game.data.AudioList;
	import pong.game.renderer.Textures;
	import pong.game.data.Stats;

	public class GuiGame extends GuiScreen
	{	
		public var world:World;
		public var fps:GuiText;
		public var fpsmonitor:FpsMonitor;
		
		public var scoreText:int;
		public var text_score:GuiText;
		public var text_lives:GuiText;
		public var text_level:GuiText;
		
		public var gameoverScreen:Boolean;
		public var text_gameover_message:GuiText;
		public var text_gameover_score1:GuiText;
		public var text_gameover_score2:GuiText;
		public var gameover_particles:int;
		public var gameover_score:int;
		public var gameover_timer:int;
		
		public var button_menu:GuiButton;
		
		public function GuiGame() 
		{
			world = new World();
		}
		
		override public function init():void
		{
			buttonList = new Vector.<GuiButton>();
			addChild(world);
			
			scoreText = 0;
			text_score = new GuiText(950, 10, 30, 0x9CE043, "left");
			text_score.setText("SCORE: -");
			addChild(text_score);
			
			text_lives = new GuiText(670, 10, 30, 0x9CE043, "left");
			text_lives.setText("LIVES: -");
			addChild(text_lives);
			
			text_level = new GuiText(420, 620, 30, 0xFFFFFF, "left");
			text_level.setText("-");
			text_level.tf.fontName = "Arial";
			addChild(text_level);
			
			fps = new GuiText(20, 10, 25, 0xFFFFFF, "left");
			fps.setText("FPS: -");
			addChild(fps);
			fpsmonitor = new FpsMonitor(50, 50, 480, 60, 480 * 2, 30, 25);
			//addChild(fpsmonitor);
			
			gameoverScreen = false;
			
			Audio.playSoundEffect(AudioList.sound_paddle);
			
			world.build();
		}
		
		override public function tick():void
		{
			fps.setText("FPS: " + FPScounter.update());
			if (FPScounter.fps < 28)
			{
				fps.setColor(0xFF0000);
			}
			else
			{
				fps.setColor(0xFFFFFF);
			}
			//fpsmonitor.tick();
			
			world.tick();
			
			if (!world.ended)
			{
				//SCORE TEXT
				if (scoreText < Stats.score)
				{
					text_score.tf.x = 947 + MathHelper.nextInt(6);
					text_score.tf.y = 7 + MathHelper.nextInt(6);
					scoreText += 4;
					text_score.setColor(0xC6ED93);
					if (scoreText >= Stats.score)
					{
						scoreText = Stats.score;
						text_score.tf.x = 950;
						text_score.tf.y = 10;
						text_score.setColor(0x9CE043);
					}
				}
				text_score.setText("SCORE: " + scoreText);
				
				//LIFE TEXT
				text_lives.setText("LIVES: " + Stats.lives);
				
				//LEVEL TEXT
				text_level.setText("EVENT: " + World.activeEvent.eventName + " " + World.activeEvent.eventLength + " LEVEL: " + Stats.level);
			}
			else
			{
				if(!gameoverScreen) 
				{
					gameoverScreen = true;
					gameOver();
				}
				else
				{
					gameover_particles--;
					if (gameover_particles < 0)
					{
						World.
						worldparticle.createParticle(
							new Particle(
								MathHelper.nextInt(1000) + 140, MathHelper.nextInt(520) + 100, 0, 180, 160, 10, 45, 0xD8D8D8, true
							)
						);
						
						gameover_particles = 15;
					}
					
					if (gameover_timer < 90)
					{
						gameover_timer++;
						gameover_score = int(Math.floor(Stats.score / 90 * gameover_timer));
						text_gameover_score2.setText("" + gameover_score);
					}
				}
			}
		}
		
		public function gameOver():void
		{
			text_score.visible = false;
			text_lives.visible = false;
			gameover_particles = 22;
			gameover_score = 0;
			gameover_timer = -1;
			
			var gameover:Image = new Image(Textures.gameover);
			gameover.x = 240;
			gameover.y = 150;
			addChild(gameover);
			
			text_gameover_score1 = new GuiText(Main.screenWidth / 2 - 60, 300, 40, 0xFFFFFF, "center");
			text_gameover_score1.setText("SCORE:");
			addChild(text_gameover_score1);
			
			text_gameover_score2 = new GuiText(Main.screenWidth / 2 + 60, 300, 40, 0xFFFFFF, "left");
			text_gameover_score2.setText("0");
			addChild(text_gameover_score2);
			
			button_menu = new GuiButton(0, 450, 500);
			button_menu.setText("Back to menu", 25, 0xFFFFFF);
			addChild(button_menu);
			buttonList.push(button_menu);
		}
		
		override public function action(id:int):void
		{
			if (id == 0)
			{
				engine.switchGui(new GuiMenu());
			}
		}
	}
}