package
{
	import org.flixel.*;
	
	public class BGElement extends FlxSprite
	{
		[Embed(source="data/bgbits/1.png")] static protected var Img1:Class;
		[Embed(source="data/bgbits/2.png")] static protected var Img2:Class;
		[Embed(source="data/bgbits/3.png")] static protected var Img3:Class;
		[Embed(source="data/bgbits/4.png")] static protected var Img4:Class;
		[Embed(source="data/bgbits/5.png")] static protected var Img5:Class;
		
		public var radius:Number;
		public var middle:FlxRect;
		public var player:Player;
		public var at:Number;
		public var timer:Number;
		
		public function BGElement()
		{
			var a:Array = [Img1,Img2,Img3,Img4,Img5];
			super(0,0,a[uint(FlxU.random()*a.length)]);
			radius = (FlxG.state as PlayState).radius;
			middle = (FlxG.state as PlayState).middle;
			player = (FlxG.state as PlayState).player;
			
			at = 0.3;
			
			super.kill();
		}
		
		override public function onEmit():void
		{
			dead = false;
			angle = FlxU.getAngle(x+origin.x,y+origin.y) + 180;
			var d:Number = getDistanceMidpoints(middle);
			thrust = -1000;
			scale.x = scale.y = 0.5 + (d/radius)*2;
			alpha = 0;
			timer = 0;
			
			d = player.getDistanceMidpoints(middle);
			color = 0x5f5f5f + ((0x9f*(1-(d/radius)))<<16) + (d/radius)*0x9f;
		}
		
		override public function update():void
		{
			if(dead)
			{
				alpha -= FlxG.elapsed*0.2;
				if(alpha <= 0)
					super.kill();
				super.update();
				return;
			}
			
			angle = FlxU.getAngle(x+origin.x,y+origin.y) + 180;
			
			var d:Number = getDistanceMidpoints(middle);
			scale.x = scale.y = 0.5 + (d/radius)*2;
			timer += FlxG.elapsed;
			if((scale.x < 0.6) || (timer > 3))
				kill();
			if(alpha < at)
				alpha += FlxG.elapsed*0.5;
			maxThrust = (1-d/radius);
			maxThrust *= maxThrust * 100;
			super.update();
		}
		
		override public function kill():void
		{
			dead = true;
		}
	}
}