package events
{
	import flash.events.Event;

	public class DetachmentEvent extends Event
	{
		public static const DETACHMENT_ADDED:String = new String('DETACHMENT_ADDED');
		public static const DETACHMENT_MOVED:String = new String('DETACHMENT_MOVED');
		
		public var detachmentData:Object;
		
		public function DetachmentEvent(type:String,detachmentData:Object):void
		{
			this.detachmentData = detachmentData;
			super(type);
		}
	}
}