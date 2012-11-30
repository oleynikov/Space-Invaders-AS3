package sprites.invaders
{
	import sprites.ViewSprite;

	public class Invader extends ViewSprite
	{
		public var score:uint;
		
		public function Invader(bricks:Array,score:uint,brickSize:uint=2):void
		{
			super(bricks,brickSize);
			
			this.score = score;
		}
	}
}