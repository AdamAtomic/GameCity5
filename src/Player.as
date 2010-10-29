package
{
	import org.flixel.*;
	
	public class Player extends SquashSprite
	{
		[Embed(source="data/players/1.png")] protected var Img1:Class;
		[Embed(source="data/players/2.png")] protected var Img2:Class;
		[Embed(source="data/players/3.png")] protected var Img3:Class;
		[Embed(source="data/players/4.png")] protected var Img4:Class;
		[Embed(source="data/players/5.png")] protected var Img5:Class;
		[Embed(source="data/players/6.png")] protected var Img6:Class;
		[Embed(source="data/players/7.png")] protected var Img7:Class;
		[Embed(source="data/players/8.png")] protected var Img8:Class;
		[Embed(source="data/players/9.png")] protected var Img9:Class;
		[Embed(source="data/players/10.png")] protected var Img10:Class;
		[Embed(source="data/players/11.png")] protected var Img11:Class;
		[Embed(source="data/players/12.png")] protected var Img12:Class;
		[Embed(source="data/players/13.png")] protected var Img13:Class;
		[Embed(source="data/players/14.png")] protected var Img14:Class;
		[Embed(source="data/players/15.png")] protected var Img15:Class;
		[Embed(source="data/players/16.png")] protected var Img16:Class;
		[Embed(source="data/players/17.png")] protected var Img17:Class;
		[Embed(source="data/players/18.png")] protected var Img18:Class;
		[Embed(source="data/players/19.png")] protected var Img19:Class;
		[Embed(source="data/players/20.png")] protected var Img20:Class;
		[Embed(source="data/players/21.png")] protected var Img21:Class;
		[Embed(source="data/players/22.png")] protected var Img22:Class;
		[Embed(source="data/players/23.png")] protected var Img23:Class;
		[Embed(source="data/players/24.png")] protected var Img24:Class;
		[Embed(source="data/players/25.png")] protected var Img25:Class;
		[Embed(source="data/players/26.png")] protected var Img26:Class;
		[Embed(source="data/players/27.png")] protected var Img27:Class;
		[Embed(source="data/players/28.png")] protected var Img28:Class;
		[Embed(source="data/players/29.png")] protected var Img29:Class;
		[Embed(source="data/players/30.png")] protected var Img30:Class;
		[Embed(source="data/players/31.png")] protected var Img31:Class;
		[Embed(source="data/players/32.png")] protected var Img32:Class;
		[Embed(source="data/players/33.png")] protected var Img33:Class;
		
		public var velocityXScale:Number;
		public var velocityYScale:Number;
		
		public function Player(Graphic:Class=null)
		{
			var a:Array = [Img1,Img2,Img3,Img4,Img5,Img6,Img7,Img8,Img9,Img10,Img11,Img12,Img13,Img14,Img15,Img16,Img17,Img18,Img19,Img20,Img21,Img22,Img23,Img24,Img25,Img26,Img27,Img28,Img29,Img30,Img31,Img32,Img33];
			super(a[uint(FlxU.random()*a.length)]);
		}
		
		override public function update():void
		{
			//Calculate player motion
			var v:Number = 120;
			if(FlxG.keys.SHIFT)
				v *= 2;
			velocity.x = 0;
			velocity.y = 0;
			var a:Boolean = false;
			if(FlxG.keys.LEFT)
			{
				velocity.x -= v;
				facing = FlxSprite.LEFT;
				if(FlxG.keys.UP || FlxG.keys.DOWN)
					a = true;
			}
			if(FlxG.keys.RIGHT)
			{
				velocity.x += v;
				facing = FlxSprite.RIGHT;
				if(FlxG.keys.UP || FlxG.keys.DOWN)
					a = true;
			}
			if(FlxG.keys.UP)
			{
				velocity.y -= v;
				if(FlxG.keys.LEFT || FlxG.keys.RIGHT)
					a = true;
			}
			if(FlxG.keys.DOWN)
			{
				velocity.y += v;
				if(FlxG.keys.LEFT || FlxG.keys.RIGHT)
					a = true;
			}
			if(a)
			{
				velocity.x *= 0.73;
				velocity.y *= 0.73;
			}
			
			//Scale any player motion that's near the edges of the arena
			if((velocity.x < 0) && (velocityXScale < 0))
				velocity.x *= -velocityXScale;
			else if((velocity.x > 0) && (velocityXScale > 0))
				velocity.x *= velocityXScale;
			if((velocity.y < 0) && (velocityYScale < 0))
				velocity.y *= -velocityYScale;
			else if((velocity.y > 0) && (velocityYScale > 0))
				velocity.y *= velocityYScale;
			velocityXScale = 0;
			velocityYScale = 0;
			
			super.update();
		}
	}
}