package events
{
	import flash.events.Event;

	public class InvaderEvent extends Event
	{
		public static const INVADER_ADDED:String = new String('INVADER_ADDED');
		
		public var invaderData:Object;
		
		public function InvaderEvent(type:String,invaderData:Object):void
		{
			this.invaderData = invaderData;
			super(type);
		}
	}
}