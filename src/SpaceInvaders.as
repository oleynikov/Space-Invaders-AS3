package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import mvc.Controller;
	import mvc.Model;
	import mvc.View;
	
	public class SpaceInvaders extends Sprite
	{
		
		private var model:Model;
		private var controller:Controller;
		private var view:View;
		
		public function SpaceInvaders()
		{
			// поддержка autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			// собираем MVC
			this.model = new Model();
			this.controller = new Controller (this.model);
			this.view = new View (this.model,this.controller);
			
			// добавляем вид на сцену
			this.addChild(this.view);
		}
	}
}