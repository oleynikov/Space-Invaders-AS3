package sprites
{
	import sprites.ViewSprite;

	public class Bullet extends ViewSprite
	{
		public function Bullet()
		{
			var bricks:Array = new Array();
				bricks.push(new Array(0,1));
				
			super(bricks,3);
		}
	}
}