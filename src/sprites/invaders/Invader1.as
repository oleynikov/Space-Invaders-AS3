package sprites.invaders
{
	public class Invader1 extends Invader
	{
		public function Invader1()
		{
			var bricks:Array = new Array();
				bricks.push(new Array(2,0));
				bricks.push(new Array(8,0));
				bricks.push(new Array(3,1));
				bricks.push(new Array(7,1));
				bricks.push(new Array(2,2,7));
				bricks.push(new Array(1,3,2));
				bricks.push(new Array(4,3,3));
				bricks.push(new Array(8,3,2));
				bricks.push(new Array(0,4,11));
				bricks.push(new Array(0,5));
				bricks.push(new Array(2,5,7));
				bricks.push(new Array(10,5));
				bricks.push(new Array(0,6));
				bricks.push(new Array(2,6));
				bricks.push(new Array(8,6));
				bricks.push(new Array(10,6));
				bricks.push(new Array(3,7,2));
				bricks.push(new Array(6,7,2));
			
			super(bricks,100);
		}
	}
}