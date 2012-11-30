package events
{
	import flash.events.Event;

	public class PlayerEvent extends Event
	{
		public static const PLAYER_MOVED:String = new String('PLAYER_MOVED');
		
		public function PlayerEvent(type:String,bulletData:Object):void
		{
			super(type);
		}
	}
}