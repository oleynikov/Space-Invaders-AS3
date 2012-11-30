package events
{
	import flash.events.Event;

	public class BulletEvent extends Event
	{
		public static const BULLET_ADDED:String = new String('BULLET_ADDED');
		public static const BULLET_MOVED:String = new String('BULLET_MOVED');
		public static const BULLET_MOVED_OUT:String = new String('BULLET_MOVED_OUT');
		
		public var bulletData:Object;
		
		public function BulletEvent(type:String,bulletData:Object):void
		{
			super(type);
			this.bulletData = bulletData;
		}
	}
}