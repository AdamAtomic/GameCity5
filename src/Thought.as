package
{
	import org.flixel.*;
	
	public class Thought extends SquashSprite
	{
		[Embed(source="data/thoughts/1.png")] protected var Img1:Class;
		[Embed(source="data/thoughts/2.png")] protected var Img2:Class;
		[Embed(source="data/thoughts/3.png")] protected var Img3:Class;
		[Embed(source="data/thoughts/4.png")] protected var Img4:Class;
		[Embed(source="data/thoughts/5.png")] protected var Img5:Class;
		[Embed(source="data/thoughts/6.png")] protected var Img6:Class;
		[Embed(source="data/thoughts/7.png")] protected var Img7:Class;
		[Embed(source="data/thoughts/8.png")] protected var Img8:Class;
		[Embed(source="data/thoughts/9.png")] protected var Img9:Class;
		[Embed(source="data/thoughts/10.png")] protected var Img10:Class;
		[Embed(source="data/thoughts/11.png")] protected var Img11:Class;
		[Embed(source="data/thoughts/12.png")] protected var Img12:Class;
		[Embed(source="data/thoughts/13.png")] protected var Img13:Class;
		[Embed(source="data/thoughts/14.png")] protected var Img14:Class;
		[Embed(source="data/thoughts/15.png")] protected var Img15:Class;
		[Embed(source="data/thoughts/16.png")] protected var Img16:Class;
		[Embed(source="data/thoughts/17.png")] protected var Img17:Class;
		[Embed(source="data/thoughts/18.png")] protected var Img18:Class;
		[Embed(source="data/thoughts/19.png")] protected var Img19:Class;
		[Embed(source="data/thoughts/20.png")] protected var Img20:Class;
		[Embed(source="data/thoughts/21.png")] protected var Img21:Class;
		[Embed(source="data/thoughts/22.png")] protected var Img22:Class;
		[Embed(source="data/thoughts/23.png")] protected var Img23:Class;
		[Embed(source="data/thoughts/24.png")] protected var Img24:Class;
		[Embed(source="data/thoughts/25.png")] protected var Img25:Class;
		[Embed(source="data/thoughts/26.png")] protected var Img26:Class;
		[Embed(source="data/thoughts/27.png")] protected var Img27:Class;
		[Embed(source="data/thoughts/28.png")] protected var Img28:Class;
		[Embed(source="data/thoughts/29.png")] protected var Img29:Class;
		[Embed(source="data/thoughts/30.png")] protected var Img30:Class;
		[Embed(source="data/thoughts/31.png")] protected var Img31:Class;
		[Embed(source="data/thoughts/32.png")] protected var Img32:Class;
		[Embed(source="data/thoughts/33.png")] protected var Img33:Class;
		[Embed(source="data/thoughts/34.png")] protected var Img34:Class;
		[Embed(source="data/thoughts/35.png")] protected var Img35:Class;
		[Embed(source="data/thoughts/36.png")] protected var Img36:Class;
		[Embed(source="data/thoughts/37.png")] protected var Img37:Class;
		[Embed(source="data/thoughts/38.png")] protected var Img38:Class;
		[Embed(source="data/thoughts/39.png")] protected var Img39:Class;
		[Embed(source="data/thoughts/40.png")] protected var Img40:Class;
		[Embed(source="data/thoughts/41.png")] protected var Img41:Class;
		[Embed(source="data/thoughts/42.png")] protected var Img42:Class;
		[Embed(source="data/thoughts/43.png")] protected var Img43:Class;
		[Embed(source="data/thoughts/44.png")] protected var Img44:Class;
		[Embed(source="data/thoughts/45.png")] protected var Img45:Class;
		[Embed(source="data/thoughts/46.png")] protected var Img46:Class;
		[Embed(source="data/thoughts/47.png")] protected var Img47:Class;
		[Embed(source="data/thoughts/48.png")] protected var Img48:Class;
		[Embed(source="data/thoughts/49.png")] protected var Img49:Class;
		[Embed(source="data/thoughts/50.png")] protected var Img50:Class;
		[Embed(source="data/thoughts/51.png")] protected var Img51:Class;
		[Embed(source="data/thoughts/52.png")] protected var Img52:Class;
		[Embed(source="data/thoughts/53.png")] protected var Img53:Class;
		[Embed(source="data/thoughts/54.png")] protected var Img54:Class;
		[Embed(source="data/thoughts/55.png")] protected var Img55:Class;
		
		public var player:Player;
		public var speed:Number;
		
		public function Thought(Graphic:Class=null, Stretch:Number=1.0)
		{
			//TODO: shuffle these into a subset!
			var a:Array = [Img1,Img2,Img3,Img4,Img5,Img6,Img7,Img8,Img9,Img10,Img11,Img12,Img13,Img14,Img15,Img16,Img17,Img18,Img19,Img20,Img21,Img22,Img23,Img24,Img25,Img26,Img27,Img28,Img29,Img30,Img31,Img32,Img33,Img34,Img35,Img36,Img37,Img38,Img39,Img40,Img41,Img42,Img43,Img44,Img45,Img46,Img47,Img48,Img49,Img50,Img51,Img52,Img53,Img54,Img55];
			super(a[uint(FlxU.random()*a.length)]);
			
			speed = 200-width;
			if(speed < 40)
				speed = 40;
			
			player = (FlxG.state as PlayState).player;
		}
		
		override public function update():void
		{			
			var d:Number = getDistance(player);
			velocity.x = 0;
			velocity.y = 0;
			if((d < FlxG.height*0.35) || (d < width*2.5))
			{
				if(player.x > x)
					facing = RIGHT;
				else if(player.x < x)
					facing = LEFT;
				
				if(d < width*2.5)
				{
					velocity.x = player.x + player.origin.x - (x + origin.x);
					if(velocity.x > speed)
						velocity.x = speed;
					else if(velocity.x < -speed)
						velocity.x = -speed;
					velocity.y = player.y + player.origin.y - (y + origin.y);
					if(velocity.y > speed)
						velocity.y = speed;
					else if(velocity.y < -speed)
						velocity.y = -speed;
				}
			}				
			
			super.update();
		}
	}
}