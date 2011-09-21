package com.kerebus.gn
{
	public class LevelEvent
	{
		public var time:Number = 0;
		public var func:Function = null;
		
		public function LevelEvent(time:Number, func:Function)
		{
			this.time = time;
			this.func = func;
		}
		
		static public function sort(objectA:LevelEvent, objectB:LevelEvent):int
		{
			if (objectA.time < objectB.time) 
				return -1;
				
			if (objectA.time == objectB.time) 
				return 0;
				
			return 1;
		}

	}
}