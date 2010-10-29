package
{
	import org.flixel.*;
	[SWF(width="640", height="480", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class GameCity5 extends FlxGame
	{
		public function GameCity5()
		{
			super(640,480,MenuState,1);
		}
	}
}
