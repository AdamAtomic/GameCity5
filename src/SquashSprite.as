package
{
	import org.flixel.*;
	
	public class SquashSprite extends FlxSprite
	{
		public var scaleYTarget:Number;
		public var scaleXTarget:Number;
		public var safe:Number;
		public var scaleYMin:Number;
		public var scaleYMax:Number;
		public var scaleXMin:Number;
		public var scaleXMax:Number;
		public var tweenSpeed:Number;
		public var angularMin:Number;
		public var angularMax:Number;
		public var angularToggle:Boolean;
		
		public var shadow:FlxSprite;
		
		public var alwaysBounce:Boolean;
		
		public function SquashSprite(Graphic:Class,Stretch:Number=1.0)
		{
			super();
			loadGraphic(Graphic,false,true);
			antialiasing = true;
			
			var ow:Number = width;
			var oh:Number = height;
			width = width * 0.65;
			height = height * 0.65;
			offset.x = (ow-width)/2;
			offset.y = (oh-height)/2;
			origin.x = width/2;
			origin.y = height/2;
			
			shadow = new FlxSprite().loadGraphic(Graphic,false,true);
			shadow.color = 0xff000000;
			shadow.alpha = 0.35;
			shadow.antialiasing = true;
			shadow.width = width;
			shadow.height = height;
			shadow.offset = offset;
			shadow.origin = origin;
			
			scaleXTarget = scaleYTarget = 1;
			safe = 0.05;
			var v:Number = 0.2 * Stretch;
			scaleYMin = 1.0-v;
			scaleYMax = 1.0+v;
			v *= 0.5;
			scaleXMin = 1.0-v;
			scaleXMax = 1.0+v;
			angularMin = 15;
			angularMax = -15;
			angularToggle = false;
			
			alwaysBounce = false;
		}
		
		override public function update():void
		{
			var v:Number = FlxU.abs(velocity.x) + FlxU.abs(velocity.y);
			if((v > 0) || alwaysBounce)
			{
				//bounce around whilst walking around
				if(scale.y == scaleYTarget)
				{
					if(scale.y > scaleYMin)
					{
						scaleYTarget = scaleYMin;
						angularToggle = !angularToggle;
					}
					else
						scaleYTarget = scaleYMax;
				}
			}
			else	//return to normal
				scaleYTarget = scaleXTarget = 1;
			tweenSpeed = v*0.001136;
			if(tweenSpeed < 0.1)
				tweenSpeed = 0.1;
			updateScale();
			
			super.update();
		}
		
		override public function render():void
		{
			if(!onScreen())
				return;
			
			shadow.x = x + 2;
			shadow.y = y + 3;
			shadow.scale.x = scale.x;
			shadow.scale.y = scale.y;
			shadow.angle = angle;
			shadow.facing = facing;
			shadow.render();
			super.render();
		}
		
		public function updateScale():void
		{
			if(scale.y != scaleYTarget)
			{
				if(FlxU.abs(scale.y - scaleYTarget) < safe)
					scale.y = scaleYTarget;
				scale.y += (scaleYTarget-scale.y)*tweenSpeed;
			}
			var progress:Number = (scale.y - scaleYMin)/(scaleYMax - scaleYMin);
			scale.x = scaleXMin + (1-progress) * (scaleXMax-scaleXMin);
			if(!alwaysBounce)
			{
				if(angularToggle)
					angle = (1-progress)*angularMax;
				else
					angle = (1-progress)*angularMin;
			}
		}
	}
}