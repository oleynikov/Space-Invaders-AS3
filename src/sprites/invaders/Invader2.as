package sprites.invaders
{
	public class Invader2 extends Invader
	{
		public function Invader2()
		{
			var bricks:Array = new Array();
				bricks.push(new Array(4,0,4,3));
				bricks.push(new Array(0,2,3,3));
				bricks.push(new Array(9,2,3,3));
				bricks.push(new Array(1,1,3,1));
				bricks.push(new Array(3,2,1,1));
				bricks.push(new Array(8,1,3,1));
				bricks.push(new Array(8,2,1,1));
				bricks.push(new Array(5,3,2,2));
				bricks.push(new Array(3,4,2,2));
				bricks.push(new Array(7,4,2,2));
				bricks.push(new Array(2,6,2,1));
				bricks.push(new Array(5,6,2,1));
				bricks.push(new Array(8,6,2,1));
				bricks.push(new Array(0,7,2,1));
				bricks.push(new Array(10,7,2,1));			
			
			super(bricks,200);
		}
	}
}