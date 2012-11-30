package mvc
{
	import events.*;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import sprites.Bullet;
	import sprites.Player;
	import sprites.invaders.*;

	public class View extends Sprite
	{
		private var model:Model;
		private var controller:Controller;
		private var player:Player;
		private var background:Shape;
		
		public function View( model:Model , controller:Controller ):void
		{
			this.model = model;
			this.controller = controller;

			this.addEventListener(Event.ADDED_TO_STAGE,OnViewAddToStageHandler);
			this.model.addEventListener(PlayerEvent.PLAYER_MOVED,OnPlayerPositionChangeHandler);
			this.model.addEventListener(BulletEvent.BULLET_ADDED,OnBulletAddHandler);
			this.model.addEventListener(BulletEvent.BULLET_MOVED,OnBulletMoveHandler);
			this.model.addEventListener(BulletEvent.BULLET_MOVED_OUT,OnBulletMoveOutHandler);
			this.model.addEventListener(DetachmentEvent.DETACHMENT_ADDED,OnDetachmentAddHandler);
			this.model.addEventListener(DetachmentEvent.DETACHMENT_MOVED,OnDetachmentMoveHandler);
		}
		
		private function OnViewAddToStageHandler(event:Event):void
		{
			this.stage.stageWidth = 320;
			this.stage.stageHeight = 480;
			this.stage.frameRate = 120;

			// фон приложения
			this.background = new Shape();
			this.background.graphics.beginFill(0x333333,1);
			this.background.graphics.drawRect(0,0,stage.stageWidth,stage.stageHeight);
			this.background.graphics.endFill();
			this.addChild(this.background);
			
			// корабль игрока
			this.player = new Player();
			this.addChild(this.player);
			
			// bullet
			var bullet:Bullet = new Bullet();
			
			// invader
			var invader:Invader2 = new Invader2();
			
			this.controller.ModelInitiate(this.stage,this.player,bullet,invader);
			this.stage.addEventListener(MouseEvent.MOUSE_MOVE,OnMouseMoveHandler);
			this.stage.addEventListener(MouseEvent.CLICK,OnMouseClickHandler);
		}
		
		private function OnMouseMoveHandler(event:MouseEvent):void
		{
			var mouseX:Number = event.stageX;
			
			this.controller.PlayerMoveToMousePosition(mouseX);
		}
		
		private function OnMouseClickHandler(event:MouseEvent):void
		{
			this.controller.PlayerShoot();
		}
		
		private function OnPlayerPositionChangeHandler(event:Event):void
		{
			var playerX:Number = this.model.player['x'];
			var playerY:Number = this.model.player['y'];

			this.player.x = playerX;
			this.player.y = playerY;
		}
		
		private function OnBulletAddHandler(event:BulletEvent):void
		{
			var bulletData:Object = event.bulletData;
			var bulletX:Number = bulletData['x'];
			var bulletY:Number = bulletData['y'];
			var bulletName:String = bulletData['name'];
			var bullet:Bullet = new Bullet();
				bullet.x = bulletX;
				bullet.y = bulletY;
				bullet.name = bulletName;
			this.addChild(bullet);
		}
		
		private function OnBulletMoveHandler(event:BulletEvent):void
		{
			var bulletData:Object = event.bulletData;
			var bulletX:Number = bulletData['x'];
			var bulletY:Number = bulletData['y'];
			var bulletName:String = bulletData['name'];
			var bullet:DisplayObject = this.getChildByName(bulletName);
			
			bullet.x = bulletX;
			bullet.y = bulletY;
		}
		
		private function OnBulletMoveOutHandler(event:BulletEvent):void
		{
			var bulletData:Object = event.bulletData;
			var bulletName:String = bulletData['name'];
			var bullet:DisplayObject = this.getChildByName(bulletName);
			
			this.removeChild(bullet);
		}
		
		private function OnDetachmentAddHandler(event:DetachmentEvent):void
		{
			var invadersLineData:Object = event.detachmentData;
			var invadersLineName:String = invadersLineData['name'];
			var invaders:Array = invadersLineData['invaders'];
			var invadersLine:Sprite = new Sprite();
				invadersLine.name = invadersLineName;
			for ( var key:String in invaders )
			{
				var invaderData:Object = invaders[key];
				var invaderX:Number = invaderData['x'];
				var invaderY:Number = invaderData['y'];
				var invaderName:String = invaderData['name'];
				var invaderType:uint = invaderData['type'];
				var invader:Invader;
				
				switch(invaderType)
				{
					case 1: invader = new Invader1(); break;
					case 2: invader = new Invader2(); break;
					case 3: invader = new Invader3(); break;
				}
				invader.x = invaderX;
				invader.y = invaderY;
				invader.name = invaderName;
				invadersLine.addChild(invader);
			}
			this.addChild(invadersLine);
		}
		
		private function OnDetachmentMoveHandler(event:DetachmentEvent):void
		{
			var detachmentData:Object = event.detachmentData;
			var detachmentName:String = detachmentData['name'];
			var detachmentY:Number = detachmentData['y'];
			var detachment:DisplayObject = this.getChildByName(detachmentName);
			
			detachment.y = detachmentY;
		}
	}
}