package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		[Embed(source="data/vignette.png")] protected var ImgVignette:Class;
		[Embed(source="data/house.png")] protected var ImgHouse:Class;
		[Embed(source="data/GoGoGoSong.mp3")] protected var SndGo:Class;
		[Embed(source="data/HomeSong.mp3")] protected var SndHome:Class;
		
		public var player:Player;
		public var house:SquashSprite;
		public var radius:Number;
		public var umbra:Number;
		public var middle:FlxRect;
		public var darkness:FlxSprite;

		public var bgEmitter:FlxEmitter;
		
		public var text1:FlxText;
		public var text2:FlxText;
		public var timer:Number;
		
		public var won:Boolean;
		
		public var thoughts:FlxGroup;
		
		public var bg2:FlxSprite;
		
		static public var home:FlxSound;
		
		override public function create():void
		{
			var i:uint;
			
			radius = FlxG.width*3; //this is half the diameter of the circular arena
			umbra = FlxG.width*0.8;
			middle = new FlxRect();
			
			//background blue
			var s:FlxSprite = new FlxSprite().createGraphic(FlxG.width,FlxG.height,0xff92c1e8);
			s.scrollFactor.x = s.scrollFactor.y = 0;
			add(s);
			
			bg2 = new FlxSprite().createGraphic(FlxG.width,FlxG.height,0xffeddf8d);
			bg2.scrollFactor = s.scrollFactor;
			bg2.alpha = 0;
			add(bg2);
			
			player = new Player();
			
			//bg motion stuffs
			bgEmitter = new FlxEmitter();
			bgEmitter.setSize(FlxG.width,FlxG.height);
			bgEmitter.setXSpeed();
			bgEmitter.setYSpeed();
			bgEmitter.setRotation();
			bgEmitter.gravity = 0;
			bgEmitter.drag.x = bgEmitter.drag.y = 0;
			for(i = 0; i < 10; i++)
				bgEmitter.add(new BGElement());
			add(bgEmitter);
			bgEmitter.start(false);
			
			//house!
			house = new SquashSprite(ImgHouse,0.5);
			house.color = FlxU.random()*0x7f7f7f + 0x7f7f7f;
			(house as SquashSprite).alwaysBounce = true;
			house.x = -35;
			house.y = -80;
			add(house);
			
			var t:Thought;
			thoughts = new FlxGroup();
			var p:FlxPoint = new FlxPoint();
			for(i = 0; i < 40; i++)
			{
				t = new Thought();
				FlxU.rotatePoint(FlxU.random()*radius,0,0,0,FlxU.random()*360,p);
				t.reset(p.x,p.y);
				thoughts.add(t);
			}
			add(thoughts);

			//actually add player here
			FlxU.rotatePoint(radius-umbra,0,0,0,FlxU.random()*360,p);
			player.reset(p.x - player.width/2,p.y - player.height/2);
			add(player);
			
			//dark corners
			s = new FlxSprite().loadGraphic(ImgVignette);
			s.scrollFactor.x = s.scrollFactor.y = 0;
			add(s);
			
			//dark overlay for going out of bounds
			darkness = new FlxSprite().createGraphic(FlxG.width,FlxG.height,0xff000000);
			darkness.scrollFactor.x = darkness.scrollFactor.y = 0;
			darkness.alpha = 0;
			add(darkness);
			
			text1 = new FlxText(0,35,FlxG.width,"a lost thought").setFormat("pencil",50,0xffffff,"center",0xff000000);
			text1.scrollFactor.x = text1.scrollFactor.y = 0;
			text1.alpha = 0;
			add(text1);
			text2 = new FlxText(0,FlxG.height - 100,FlxG.width,"trying to find its way back").setFormat("pencil",50,0xffffff,"center",0xff000000);;
			text2.scrollFactor.x = text2.scrollFactor.y = 0;
			text2.alpha = 0;
			add(text2);
			timer = 0;
			
			won = false;
			
			FlxG.follow(player,2.5);
			FlxG.followAdjust(0.25,0.25);
			FlxU.setWorldBounds(-radius,-radius,radius*2,radius*2,5);
			
			FlxG.flash.start(0xff000000);
			
			if((FlxG.music == null) || (!FlxG.music.playing))
				FlxG.playMusic(SndGo);
			if((home == null) || (!home.playing))
			{
				home = FlxG.play(SndHome,1,true);
				home.survive = true;
			}
			home.proximity(0,0,player,radius*0.65);
		}
		
		protected function onFade():void
		{
			home.proximity(0,0,null,0);
			if(!won)
				FlxG.music.volume = 0.1;
			FlxG.state = new MenuState();
		}
		
		protected function onLost(T:Thought,P:Player):void
		{
			P.kill();
			T.kill();
			text2.text = "never made it back";
			timer = 0;
			home.pause();
		}
		
		override public function update():void
		{
			//text fade in and out
			timer += FlxG.elapsed;
			if(player.dead)
			{
				if(text1.alpha < 1)
					text1.alpha += FlxG.elapsed*0.5;
				if((timer > 5) && (text2.alpha > 0))
				{
					text2.alpha -= FlxG.elapsed;
					FlxG.fade.start(0xff000000,1,onFade);
				}
				else if((timer > 1.5) && (text2.alpha < 1))
					text2.alpha += FlxG.elapsed*0.5;
			}
			if(won)
			{
				if(text1.alpha < 1)
					text1.alpha += FlxG.elapsed*0.5;
				if((timer > 5) && (text2.alpha > 0))
				{
					text2.alpha -= FlxG.elapsed;
					FlxG.fade.start(0xff000000,1,onFade);
				}
				else if((timer > 1.5) && (text2.alpha < 1))
					text2.alpha += FlxG.elapsed*0.5;
			}
			else
			{
				if((timer > 4.5) && (text1.alpha > 0))
					text1.alpha -= FlxG.elapsed;
				else if((timer > 1) && (text1.alpha < 1))
					text1.alpha += FlxG.elapsed*0.5;
				if((timer > 6) && (text2.alpha > 0))
					text2.alpha -= FlxG.elapsed;
				else if((timer > 2.5) && (text2.alpha < 1))
					text2.alpha += FlxG.elapsed*0.5;
			}
			
			//Scale player's motion and world light based on player position
			var d:Number = middle.getDistanceMidpoints(player);
			if(d > radius-umbra)
			{
				var danger:Number = (radius-d)/umbra;
				danger = 0.2 + danger*danger*0.8;
				darkness.alpha = 1-danger;
				if(player.x < radius*0.5)
					player.velocityXScale = -danger;
				else if(player.x > radius*0.5)
					player.velocityXScale = danger;
				if(player.y < radius*0.5)
					player.velocityYScale = -danger;
				else if(player.y > radius*0.5)
					player.velocityYScale = danger;
			}
			bgEmitter.x = player.x + player.origin.x - bgEmitter.width/2;
			bgEmitter.y = player.y + player.origin.y - bgEmitter.height/2;
			bgEmitter.delay = 0.15 + (d/radius)*1.2;
			bg2.alpha = (radius-d)/radius;
			bg2.alpha *= bg2.alpha;
			
			FlxG.music.volume = 1-home.getActualVolume();
			
			super.update();
			
			if(!won && house.overlaps(player))
			{
				won = true;
				timer = 0;
				text2.text = "found its way back";
				thoughts.kill();
			}
			
			if(!won && !player.dead)
				FlxU.overlap(thoughts,player,onLost);
			
			if(d > radius)
			{
				var f:Number = radius/d;
				player.x *= f;
				player.y *= f;
			}
		}
	}
}
