package sprites
{
	import flash.display.Shape;

	public class ViewSprite extends Shape
	{
		
		private var brickSize:uint;
		
		public function ViewSprite(bricks:Array,brickSize:uint=1):void
		{
			this.brickSize = brickSize;
			SpriteDraw(bricks);
		}
		
		private function SpriteDraw(bricks:Array):void
		{
			for (var key:String in bricks)
			{
				var x:uint = bricks[key][0];
				var y:uint = bricks[key][1];
				var width:uint = bricks[key][2];
				var height:uint = bricks[key][3];
				var color:uint = bricks[key][4];

				// проверяем, заданы ли размер и цвет кирпича
				width==0 ? width=1 : false;
				height==0 ? height=1 : false;
				color==0 ? color=0xFFFFFF : false;
							
				// рисуем кирпич
				this.BrickDraw(x,y,width,height,color);
			}
		}

		private function BrickDraw(x:uint,y:uint,width:uint,height:uint,color:uint=0xFFFFFF):void
		{
			this.graphics.beginFill(color);
			this.graphics.drawRect(x*this.brickSize,y*this.brickSize,width*this.brickSize,height*this.brickSize);
			this.graphics.endFill();
		}
	}
}