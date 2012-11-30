package sprites
{
	import sprites.ViewSprite;
		
	public class Player extends ViewSprite
	{
		public function Player()
		{
			var bricks:Array = new Array();
				bricks.push(new Array(3,2,3,5));
				bricks.push(new Array(4,0,1,2));
				bricks.push(new Array(0,4,1,3));
				bricks.push(new Array(8,4,1,3));
				bricks.push(new Array(2,3,1,3));
				bricks.push(new Array(6,3,1,3));
				bricks.push(new Array(1,5));
				bricks.push(new Array(7,5));
			
			super(bricks,3);
		}
	}
}