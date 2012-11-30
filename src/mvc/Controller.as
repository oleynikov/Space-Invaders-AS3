package mvc
{
	import events.BulletEvent;
	
	import flash.display.Stage;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import sprites.ViewSprite;

	public class Controller
	{
		private static const PlayerPositionChangeDelay:Number = 2;		// задержка движения коробля игрока
		
		private var model:Model;
		
		public function Controller(model:Model)
		{
			this.model = model;
			this.model.addEventListener(BulletEvent.BULLET_ADDED,OnBulletAddhandler);
		}
		
		public function ModelInitiate(stage:Stage,player:ViewSprite,bullet:ViewSprite,invader:ViewSprite):void
		{
			var stageWidth:Number = stage.stageWidth;
			var stageHeight:Number = stage.stageHeight;
			var playerWidth:Number = player.width;
			var playerHeight:Number = player.height;
			var bulletWidth:Number = bullet.width;
			var bulletHeight:Number = bullet.height;
			var invaderWidth:Number = invader.width;
			var invaderHeight:Number = invader.height;
			
			this.model.playerWallGapX = 3;
			this.model.playerWallGapY = 3;
			this.model.invadersGapX = 5;
			this.model.invadersGapY = 10;
			this.model.gunShootCooldown = 1000;
			this.model.detachmentsMoveCooldown = 1000;
			this.model.gunReady = true;
			this.model.stage = {width:stageWidth,height:stageHeight};
			this.model.player = {x:0,y:0,width:playerWidth,height:playerHeight};
			this.model.bullet = {width:bulletWidth,height:bulletHeight};
			this.model.invader = {width:invaderWidth,height:invaderHeight};
			this.model.bullets = new Array();
			this.model.invaders = new Array();
			this.model.detachments = new Array();
			this.model.PlayerMoveToCenter();
			
			this.model.DetachmentLaunch(1,9);
			
			var detachmentsMoveTimer:Timer = new Timer(this.model.detachmentsMoveCooldown);
				detachmentsMoveTimer.addEventListener(TimerEvent.TIMER,OnDetachmentsMoveTimerHandler);
				detachmentsMoveTimer.start();
		}
		
		private function OnDetachmentsMoveTimerHandler(event:TimerEvent):void
		{
			this.model.DetachmentsMoveOneStep();
		}
		
		public function PlayerMoveToMousePosition(mouseX:Number):void
		{
			var stageWidth:Number = this.model.stage['width'];
			var playerWidth:Number = this.model.player['width'];
			var playerXMin:Number = 0 + this.model.playerWallGapX;
			var playerXMax:Number = stageWidth - playerWidth - this.model.playerWallGapX;
			var playerX:Number = mouseX - playerWidth / 2;
			
			// проверяем, не выходит ли корабль за границы экрана
			playerX < playerXMin ? playerX = playerXMin : null;
			playerX > playerXMax ? playerX = playerXMax : null;
			
			// двигаем корабль
			this.model.PlayerMoveTo('x',playerX,2);
		}
		
		public function PlayerShoot():void
		{
			var playerX:Number = this.model.player.x;
			var playerY:Number = this.model.player.y;
			var playerWidth:Number = this.model.player['width'];
			var bulletWidth:Number = this.model.bullet['width'];
			var playerGunX:Number = playerX + playerWidth / 2;
			var playerGunY:Number = playerY;
			var bulletX:Number = playerGunX - bulletWidth / 2;
			var bulletY:Number = playerGunY;
			
			this.model.BulletAdd(bulletX,bulletY);
		}
		
		public function OnBulletAddhandler(event:BulletEvent):void
		{
			var gunCooldownTimer:Timer = new Timer(this.model.gunShootCooldown,1);
				gunCooldownTimer.addEventListener(TimerEvent.TIMER_COMPLETE,OnGunCooldownTimerHandler);
				gunCooldownTimer.start();
			
			this.model.gunReady = false;
		}
		
		private function OnGunCooldownTimerHandler(event:TimerEvent):void
		{
			this.model.gunReady = true;
		}
	}
}