package sprites.invaders
{
	public class Invader3 extends Invader
	{
		public function Invader3()
		{
			var bricks:Array = new Array();
				bricks.push(new Array(3,0,2,5));
				bricks.push(new Array(0,3,2,2));
				bricks.push(new Array(6,3,2,2));
				bricks.push(new Array(2,1,1,1));
				bricks.push(new Array(5,1,1,1));
				bricks.push(new Array(1,2,2,1));
				bricks.push(new Array(5,2,2,1));
				bricks.push(new Array(2,4,1,1));
				bricks.push(new Array(5,4,1,1));
				bricks.push(new Array(3,5,2,1));
				bricks.push(new Array(1,5,1,1));
				bricks.push(new Array(6,5,1,1));
				bricks.push(new Array(0,6,1,1));
				bricks.push(new Array(7,6,1,1));
				bricks.push(new Array(1,7,1,1));
				bricks.push(new Array(6,7,1,1));
			
			super(bricks,300);
		}
	}
}