package
{
	import org.flixel.*;

	public class MenuState extends FlxState
	{
		[Embed(source="data/Mechanic_Pencil.ttf",fontFamily="pencil",embedAsCFF="false")] protected var junk:String;
		[Embed(source="data/title.jpg")] protected var ImgTitle:Class;
		[Embed(source="data/cursor.png")] protected var ImgCursor:Class;
		[Embed(source="data/vignette.png")] protected var ImgVignette:Class;
		[Embed(source="data/TitleMusic.mp3")] protected var SndMusic:Class;
		
		public var title:FlxSprite;
		static public var music:FlxSound;
		public var t:FlxText;
		static public var clicked:Boolean = false;
		public var credits1:FlxText;
		public var credits2:FlxText;
		public var timer:Number;
		
		override public function create():void
		{
			add(new FlxSprite().createGraphic(FlxG.width,FlxG.height,0xff413946));

			title = add(new FlxSprite(-5,-5).loadGraphic(ImgTitle)) as FlxSprite;
			title.antialiasing = true;
			bounce();
			
			t = new FlxText(0,FlxG.height-80,FlxG.width,(!clicked)?"click here to start":"press arrow keys to play");
			t.setFormat("pencil",50,0xffffff,"center",0xff000000);
			add(t);
			
			var cs:String = "";
			cs += "DESIGNERS\n\nAnonymous\nAdam Atomic\n\n";
			cs += "PROGRAMMER\n\nAdam Atomic\n\n";
			cs += "MUSICIAN\n\nRebecca Mayes\n\n";
			
			credits1 = new FlxText(0,20,FlxG.width,cs);
			credits1.setFormat("pencil",24,0xffffff,"center",0xff000000);
			credits1.alpha = 0;
			add(credits1);
			
			cs = "\t\t\tARTISTS\n\n";
			cs += "Abbigale\tAmber\tAmy\t\tAshlynn\nAyesha\tCaitlin\tConnie\tDanni\n";
		    cs += "Ed\t\tElys\t\tEsme\t\tEthan\nFiboene\tHarry\t\tIris\t\tJacob\n";
			cs += "Jessica\tJoe\t\tKai\t\tKatie\nKeia\t\tKevin\t\tKira\t\tKoen\n";
			cs += "Leonie\tLewis\t\tMichael\tMya\nOcian\tOllie\t\tPhoebe\tRebecca\n";
			cs += "Rhianna\tShanelle\tTai\t\tTamara\nTillie\t\tTim\t\tTasheque\tVictoria";
			credits2 = new FlxText(110,20,440,cs);
			credits2.setFormat("pencil",24,0xffffff,"left",0xff000000);
			credits2.alpha = 0;
			add(credits2);
			
			add(new FlxSprite().loadGraphic(ImgVignette));
			
			if(!clicked)
				FlxG.mouse.show(ImgCursor);
			
			FlxG.flash.start(0xff000000,0.5);
			
			if(music == null)
				music = FlxG.play(SndMusic,1,true);
			else if(!PlayState.home.playing)
				music.play();
			
			timer = 0;
		}

		override public function update():void
		{
			timer += FlxG.elapsed;
			
			var base:Number = 5;
			if(timer < base)
			{
				//nothing
			}
			else if(timer < base + 6)
			{
				if(credits1.alpha < 1)
					credits1.alpha += FlxG.elapsed;
			}
			else if(timer < base + 20)
			{
				if(credits1.alpha > 0)
					credits1.alpha -= FlxG.elapsed;
				else if(credits2.alpha < 1)
					credits2.alpha += FlxG.elapsed;
			}
			else if(credits2.alpha > 0)
				credits2.alpha -= FlxG.elapsed;
			
			super.update();
			
			var u:Boolean = false;
			if(title.x < -10)
			{
				title.x = -10;
				title.velocity.x = -title.velocity.x*0.5;
				u = true;
			}
			else if(title.x > 0)
			{
				title.x = 0;
				title.velocity.x = -title.velocity.x*0.5;
				u = true;
			}
			if(title.y < -10)
			{
				title.y = -10;
				title.velocity.y = -title.velocity.y*0.5;
				u = true;
			}
			else if(title.y > 0)
			{
				title.y = 0;
				title.velocity.y = -title.velocity.y*0.5;
				u = true;
			}
			if(u)
				bounce();

			if(!clicked && FlxG.mouse.justPressed())
			{
				t.text = "press arrow keys to play";
				clicked = true;
			}
			
			if(FlxG.keys.justPressed("LEFT") || FlxG.keys.justPressed("RIGHT") || FlxG.keys.justPressed("UP") || FlxG.keys.justPressed("DOWN"))
				FlxG.fade.start(0xff000000,0.5,onFade);
		}
		
		protected function onFade():void
		{
			FlxG.mouse.hide();
			FlxG.state = new PlayState();
		}
		
		protected function bounce():void
		{
			var min:Number = 10;
			var max:Number = 20;
			title.acceleration.x = min + FlxU.random()*max;
			if(FlxU.random() < 0.5)
				title.acceleration.x = -title.acceleration.x;
			title.acceleration.y = min + FlxU.random()*max;
			if(FlxU.random() < 0.5)
				title.acceleration.y = -title.acceleration.y;
			title.scale.x = title.scale.y = 1 + FlxU.random()*0.02;
			title.angularVelocity = -2 + FlxU.random()*4;
		}
	}
}
