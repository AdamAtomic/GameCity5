package
{
	import org.flixel.*;
	
	public class Thought extends SquashSprite
	{
		[Embed(source="data/thoughts/1.png")] static protected var Img1:Class;
		[Embed(source="data/thoughts/2.png")] static protected var Img2:Class;
		[Embed(source="data/thoughts/3.png")] static protected var Img3:Class;
		[Embed(source="data/thoughts/4.png")] static protected var Img4:Class;
		[Embed(source="data/thoughts/5.png")] static protected var Img5:Class;
		[Embed(source="data/thoughts/6.png")] static protected var Img6:Class;
		[Embed(source="data/thoughts/7.png")] static protected var Img7:Class;
		[Embed(source="data/thoughts/8.png")] static protected var Img8:Class;
		[Embed(source="data/thoughts/9.png")] static protected var Img9:Class;
		[Embed(source="data/thoughts/10.png")] static protected var Img10:Class;
		[Embed(source="data/thoughts/11.png")] static protected var Img11:Class;
		[Embed(source="data/thoughts/12.png")] static protected var Img12:Class;
		[Embed(source="data/thoughts/13.png")] static protected var Img13:Class;
		[Embed(source="data/thoughts/14.png")] static protected var Img14:Class;
		[Embed(source="data/thoughts/15.png")] static protected var Img15:Class;
		[Embed(source="data/thoughts/16.png")] static protected var Img16:Class;
		[Embed(source="data/thoughts/17.png")] static protected var Img17:Class;
		[Embed(source="data/thoughts/18.png")] static protected var Img18:Class;
		[Embed(source="data/thoughts/19.png")] static protected var Img19:Class;
		[Embed(source="data/thoughts/20.png")] static protected var Img20:Class;
		[Embed(source="data/thoughts/21.png")] static protected var Img21:Class;
		[Embed(source="data/thoughts/22.png")] static protected var Img22:Class;
		[Embed(source="data/thoughts/23.png")] static protected var Img23:Class;
		[Embed(source="data/thoughts/24.png")] static protected var Img24:Class;
		[Embed(source="data/thoughts/25.png")] static protected var Img25:Class;
		[Embed(source="data/thoughts/26.png")] static protected var Img26:Class;
		[Embed(source="data/thoughts/27.png")] static protected var Img27:Class;
		[Embed(source="data/thoughts/28.png")] static protected var Img28:Class;
		[Embed(source="data/thoughts/29.png")] static protected var Img29:Class;
		[Embed(source="data/thoughts/30.png")] static protected var Img30:Class;
		[Embed(source="data/thoughts/31.png")] static protected var Img31:Class;
		[Embed(source="data/thoughts/32.png")] static protected var Img32:Class;
		[Embed(source="data/thoughts/33.png")] static protected var Img33:Class;
		[Embed(source="data/thoughts/34.png")] static protected var Img34:Class;
		[Embed(source="data/thoughts/35.png")] static protected var Img35:Class;
		[Embed(source="data/thoughts/36.png")] static protected var Img36:Class;
		[Embed(source="data/thoughts/37.png")] static protected var Img37:Class;
		[Embed(source="data/thoughts/38.png")] static protected var Img38:Class;
		[Embed(source="data/thoughts/39.png")] static protected var Img39:Class;
		[Embed(source="data/thoughts/40.png")] static protected var Img40:Class;
		[Embed(source="data/thoughts/41.png")] static protected var Img41:Class;
		[Embed(source="data/thoughts/42.png")] static protected var Img42:Class;
		[Embed(source="data/thoughts/43.png")] static protected var Img43:Class;
		[Embed(source="data/thoughts/44.png")] static protected var Img44:Class;
		[Embed(source="data/thoughts/45.png")] static protected var Img45:Class;
		[Embed(source="data/thoughts/46.png")] static protected var Img46:Class;
		[Embed(source="data/thoughts/47.png")] static protected var Img47:Class;
		[Embed(source="data/thoughts/48.png")] static protected var Img48:Class;
		[Embed(source="data/thoughts/49.png")] static protected var Img49:Class;
		[Embed(source="data/thoughts/50.png")] static protected var Img50:Class;
		[Embed(source="data/thoughts/51.png")] static protected var Img51:Class;
		[Embed(source="data/thoughts/52.png")] static protected var Img52:Class;
		[Embed(source="data/thoughts/53.png")] static protected var Img53:Class;
		[Embed(source="data/thoughts/54.png")] static protected var Img54:Class;
		[Embed(source="data/thoughts/55.png")] static protected var Img55:Class;
		[Embed(source="data/thoughts/56.png")] static protected var Img56:Class;
		[Embed(source="data/thoughts/57.png")] static protected var Img57:Class;
		[Embed(source="data/thoughts/58.png")] static protected var Img58:Class;
		[Embed(source="data/thoughts/59.png")] static protected var Img59:Class;
		[Embed(source="data/thoughts/60.png")] static protected var Img60:Class;
		[Embed(source="data/thoughts/61.png")] static protected var Img61:Class;
		[Embed(source="data/thoughts/62.png")] static protected var Img62:Class;
		[Embed(source="data/thoughts/63.png")] static protected var Img63:Class;
		[Embed(source="data/thoughts/64.png")] static protected var Img64:Class;
		[Embed(source="data/thoughts/65.png")] static protected var Img65:Class;
		[Embed(source="data/thoughts/66.png")] static protected var Img66:Class;
		[Embed(source="data/thoughts/67.png")] static protected var Img67:Class;
		[Embed(source="data/thoughts/68.png")] static protected var Img68:Class;
		[Embed(source="data/thoughts/69.png")] static protected var Img69:Class;
		[Embed(source="data/thoughts/70.png")] static protected var Img70:Class;
		[Embed(source="data/thoughts/71.png")] static protected var Img71:Class;
		[Embed(source="data/thoughts/72.png")] static protected var Img72:Class;
		[Embed(source="data/thoughts/73.png")] static protected var Img73:Class;
		[Embed(source="data/thoughts/74.png")] static protected var Img74:Class;
		[Embed(source="data/thoughts/75.png")] static protected var Img75:Class;
		[Embed(source="data/thoughts/76.png")] static protected var Img76:Class;
		[Embed(source="data/thoughts/77.png")] static protected var Img77:Class;
		[Embed(source="data/thoughts/78.png")] static protected var Img78:Class;
		[Embed(source="data/thoughts/79.png")] static protected var Img79:Class;
		[Embed(source="data/thoughts/80.png")] static protected var Img80:Class;
		[Embed(source="data/thoughts/81.png")] static protected var Img81:Class;
		[Embed(source="data/thoughts/82.png")] static protected var Img82:Class;
		[Embed(source="data/thoughts/83.png")] static protected var Img83:Class;
		[Embed(source="data/thoughts/84.png")] static protected var Img84:Class;
		[Embed(source="data/thoughts/85.png")] static protected var Img85:Class;
		[Embed(source="data/thoughts/86.png")] static protected var Img86:Class;
		[Embed(source="data/thoughts/87.png")] static protected var Img87:Class;
		[Embed(source="data/thoughts/88.png")] static protected var Img88:Class;
		[Embed(source="data/thoughts/89.png")] static protected var Img89:Class;
		[Embed(source="data/thoughts/90.png")] static protected var Img90:Class;
		[Embed(source="data/thoughts/91.png")] static protected var Img91:Class;
		[Embed(source="data/thoughts/92.png")] static protected var Img92:Class;
		[Embed(source="data/thoughts/93.png")] static protected var Img93:Class;
		[Embed(source="data/thoughts/94.png")] static protected var Img94:Class;
		[Embed(source="data/thoughts/95.png")] static protected var Img95:Class;
		[Embed(source="data/thoughts/96.png")] static protected var Img96:Class;
		[Embed(source="data/thoughts/97.png")] static protected var Img97:Class;
		[Embed(source="data/thoughts/98.png")] static protected var Img98:Class;
		[Embed(source="data/thoughts/99.png")] static protected var Img99:Class;
		[Embed(source="data/thoughts/100.png")] static protected var Img100:Class;
		[Embed(source="data/thoughts/101.png")] static protected var Img101:Class;
		[Embed(source="data/thoughts/102.png")] static protected var Img102:Class;
		[Embed(source="data/thoughts/103.png")] static protected var Img103:Class;
		[Embed(source="data/thoughts/104.png")] static protected var Img104:Class;
		[Embed(source="data/thoughts/105.png")] static protected var Img105:Class;
		[Embed(source="data/thoughts/106.png")] static protected var Img106:Class;
		[Embed(source="data/thoughts/107.png")] static protected var Img107:Class;
		[Embed(source="data/thoughts/108.png")] static protected var Img108:Class;
		[Embed(source="data/thoughts/109.png")] static protected var Img109:Class;
		[Embed(source="data/thoughts/110.png")] static protected var Img110:Class;
		
		static public var a:Array;
		static public var sub:Array;
		static public var player:Player;
		
		public var speed:Number;
		public var radius:Number;
		public var oLoc:FlxPoint;
		public var pLoc:FlxPoint;
		public var vh:FlxPoint;
		public var chasing:Boolean;
		public var toggle:Boolean;
		
		public function Thought(Graphic:Class=null, Stretch:Number=1.0)
		{
			super(sub[uint(FlxU.random()*sub.length)]);

			var size:Number = (width + height)/2;
			speed = 240-size;
			radius = size * 2.5;
			if(radius > FlxG.width*0.4)
				radius = FlxG.width*0.4;
			else if(radius < 120)
				radius = 120;
			oLoc = new FlxPoint();
			pLoc = new FlxPoint();
			vh = new FlxPoint();
			chasing = false;
			toggle = (FlxU.random()<0.5)?false:true;
		}
		
		static public function init():void
		{
			player = (FlxG.state as PlayState).player;
			
			if(a == null)
				a = [	Img1,Img2,Img3,Img4,Img5,Img6,Img7,Img8,Img9,Img10,
						Img11,Img12,Img13,Img14,Img15,Img16,Img17,Img18,Img19,Img20,
						Img21,Img22,Img23,Img24,Img25,Img26,Img27,Img28,Img29,Img30,
						Img31,Img32,Img33,Img34,Img35,Img36,Img37,Img38,Img39,Img40,
						Img41,Img42,Img43,Img44,Img45,Img46,Img47,Img48,Img49,Img50,
						Img51,Img52,Img53,Img54,Img55,Img56,Img57,Img58,Img59,Img60,
						Img61,Img62,Img63,Img64,Img65,Img66,Img67,Img68,Img69,Img70,
						Img71,Img72,Img73,Img74,Img75,Img76,Img77,Img78,Img79,Img80,
						Img81,Img82,Img83,Img84,Img85,Img86,Img87,Img88,Img89,Img90,
						Img91,Img92,Img93,Img94,Img95,Img96,Img97,Img98,Img99,Img100,
						Img101,Img102,Img103,Img104,Img105,Img106,Img107,Img108,Img109,Img110 ];
			
			if(sub == null)
				sub = new Array();
			for(var i:uint = 0; i < 7; i++)
				sub[i] = a[uint(FlxU.random()*a.length)];
		}
		
		override public function update():void
		{
			if(!onScreen())
				return;
			if(dead)
				return super.update();
			
			toggle = !toggle;
			if(chasing)
			{
				if( ((pLoc.x < oLoc.x) && (x+origin.x < pLoc.x)) ||
					((pLoc.x > oLoc.x) && (x+origin.x > pLoc.x)) ||
					((pLoc.y < oLoc.y) && (y+origin.y < pLoc.y)) ||
					((pLoc.y > oLoc.y) && (y+origin.y > pLoc.y)) )
				{
					chasing = false;
					velocity.x = 0;
					velocity.y = 0;
				}
			}
			else if(toggle)//detecting
			{
				//lookin around
				if(player.x + player.origin.x > x + origin.x)
					facing = RIGHT;
				else if(player.x + player.origin.x < x + origin.x)
					facing = LEFT;
				
				//decide to chase or not
				if(getDistance(player) < radius)
				{
					chasing = true;
					
					oLoc.x = x + origin.x;
					oLoc.y = y + origin.y;
					pLoc.x = player.x + player.origin.x;
					pLoc.y = player.y + player.origin.y;
					
					FlxU.rotatePoint(speed,0,0,0,FlxU.getAngle(pLoc.x-oLoc.x,pLoc.y-oLoc.y),vh);
					velocity.x = vh.x;
					velocity.y = vh.y;
				}
			}
			
			super.update();
		}
	}
}