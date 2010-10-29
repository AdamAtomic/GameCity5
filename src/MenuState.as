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
		
		override public function create():void
		{
			add(new FlxSprite().createGraphic(FlxG.width,FlxG.height,0xff413946));

			title = add(new FlxSprite(-5,-5).loadGraphic(ImgTitle)) as FlxSprite;
			title.antialiasing = true;
			bounce();
			
			var t:FlxText;
			t = new FlxText(FlxG.width/2-150,FlxG.height-80,300,"click to play");
			t.setFormat("pencil",50,0xffffff,"center",0xff000000);
			add(t);
			
			add(new FlxSprite().loadGraphic(ImgVignette));
			
			FlxG.mouse.show(ImgCursor);
			
			FlxG.flash.start(0xff000000);
			
			if(music == null)
				music = FlxG.play(SndMusic,1,true);
			else if(!PlayState.home.playing)
				music.play();
		}

		override public function update():void
		{
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

			if(FlxG.mouse.justPressed())
				FlxG.fade.start(0xff000000,1,onFade);
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
