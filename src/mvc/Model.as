package mvc
{
	import caurina.transitions.*;
	
	import events.BulletEvent;
	import events.DetachmentEvent;
	import events.InvaderEvent;
	import events.PlayerEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.ObjectEncoding;
		
	public class Model extends EventDispatcher
	{
		public var playerWallGapY:Number;
		public var playerWallGapX:Number;
		public var invadersGapX:Number;
		public var invadersGapY:Number;
		public var gunShootCooldown:Number;
		public var detachmentsMoveCooldown:Number;
		public var stage:Object;
		public var player:Object;
		public var bullet:Object;
		public var invader:Object;
		public var bullets:Array;
		public var invaders:Array;
		public var detachments:Array;
		public var gunReady:Boolean;
		
		public function Model():void
		{
			return void;
		}

		public function PlayerMoveTo	(	direction:String,value:Number,time:Number=0,transition:String='easeOutQuint'):void
		{
			if ( direction == 'x' )
			{
				Tweener.addTween(this.player,{x:value,time:time,transition:transition,onUpdate:OnPlayerPositionChangeHadler});
			}
			else if ( direction == 'y' )
			{
				Tweener.addTween(this.player,{y:value,time:time,transition:transition,onUpdate:OnPlayerPositionChangeHadler});
			}
		}
		
		public function PlayerMoveToCenter():void
		{
			var stageWidth:Number = this.stage['width'];
			var stageHeight:Number = this.stage['height'];
			var playerWidth:Number = this.player['width'];
			var playerHeight:Number = this.player['height'];
			var playerX:Number = stageWidth / 2 - playerWidth / 2;
			var playerY:Number = stageHeight - playerHeight - this.playerWallGapY;

			this.PlayerMoveTo('x',playerX);
			this.PlayerMoveTo('y',playerY);
		}
		
		public function BulletAdd(x:Number,y:Number):void
		{
			if (this.gunReady)
			{
				var bulletsCount:uint = this.bullets.length;
				var bulletName:String = 'bullet_'+bulletsCount.toString();
				var bulletHeight:Number = this.bullet['height'];
				var bulletYDestination:Number = -1 * bulletHeight;
				var bulletData:Object =	{name:bulletName,x:x,y:y};
				
				this.bullets.push(bulletData);
				this.dispatchEvent(new BulletEvent(BulletEvent.BULLET_ADDED,bulletData));
				Tweener.addTween(bulletData,{y:bulletYDestination,time:1,transition:'linear',onUpdate:OnBulletPositionChangeHandler,onUpdateParams:[bulletData],onComplete:OnBulletMoveOutHandler,onCompleteParams:[bulletData]});
			}
		}
		
		public function DetachmentLaunch(type:uint,length:uint):void
		{
			var key:uint = new uint();
			var invaderWidth:Number = this.invader['width'];
			var invaderHeight:Number = this.invader['height'];
			var invadersGapX:Number = this.invadersGapX;
			var detachmentsCount:uint = this.detachments.length;
			var detachmentName:String = 'invaderLine_' + detachmentsCount.toString();
			var detachment:Object = new Object();
				detachment['name'] = detachmentName;
				detachment['y'] = 0;
				detachment['invaders'] = new Array();
				
			for(key;key<length;key++)
			{
				var invaderX:Number = key * ( invaderWidth + invadersGapX );
				var invaderData:Object = this.InvaderLaunch(type,invaderX,0);
				
				detachment['invaders'].push(invaderData);
			}
			this.detachments.push(detachment);
			this.dispatchEvent(new DetachmentEvent(DetachmentEvent.DETACHMENT_ADDED,detachment));
		}
		
		public function DetachmentsMoveOneStep():void
		{
			for(var key:String in this.detachments)
			{
				var detachment:Object = this.detachments[key];
				var invaderHeight:Number = this.invader['height'];
				var detachmentY:Number = detachment['y'] + invaderHeight + this.invadersGapY;

				Tweener.addTween(detachment,{y:detachmentY,time:1,onUpdate:OnDetachmentMoveHandler,onUpdateParams:[detachment]});
				
			}
		}
			
		public function OnDetachmentMoveHandler(detachment:Object):void
		{
			this.dispatchEvent(new DetachmentEvent(DetachmentEvent.DETACHMENT_MOVED,detachment));	
		}
		
		public function InvaderLaunch(type:uint,x:Number,y:Number):Object
		{
			var invadersCount:uint = this.invaders.length;
			var invaderName:String = 'invader_'+invadersCount.toString();
			var invaderData:Object = {name:invaderName,type:type,x:x,y:y};
			
			return invaderData;
		}
		
		public function OnPlayerPositionChangeHadler():void
		{
			this.dispatchEvent(new Event(PlayerEvent.PLAYER_MOVED));	
		}
		
		public function OnBulletPositionChangeHandler(bulletData:Object):void
		{
			this.dispatchEvent(new BulletEvent(BulletEvent.BULLET_MOVED,bulletData));	
		}
		
		public function OnBulletMoveOutHandler(bulletData:Object):void
		{
			this.dispatchEvent(new BulletEvent(BulletEvent.BULLET_MOVED_OUT,bulletData));	
		}
	}
}