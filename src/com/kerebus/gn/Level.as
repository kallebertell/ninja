package com.kerebus.gn
{
	public class Level
	{
		private var _name : String;
		private var _elements : Array = [];
		private var _background : LevelBackground; 
		private var _objectFactory : ObjectFactory;
		
		public function Level(name : String, objectFactory : ObjectFactory)
		{
			_name = name;
			_objectFactory = objectFactory;
		}
		
		public function addLevelEvent(element:LevelEvent) : void {				
			_elements.push(element);			
			_elements.sort(LevelEvent.sort);
		}
		
		public function getNextLevelDefinitionElements(lastTime:Number):Array
		{
			var returnArray:Array = new Array();
			var nextTime:Number = -1;
			
			for each (var levelDefElement:LevelEvent in _elements)
			{
				if (levelDefElement.time > lastTime && nextTime == -1)
				{
					returnArray.push(levelDefElement);
					nextTime = levelDefElement.time;
				}
				else if (levelDefElement.time == nextTime)
				{
					returnArray.push(levelDefElement);
				}
				else if (levelDefElement.time > nextTime && nextTime != -1)
					break;
			}			
			
			return returnArray.length == 0 ? null : returnArray;
		}
	
		public function get background () : LevelBackground {
			return _background;	
		}
		
		public function set background(value : LevelBackground) : void {
			_background = value;
		}
		
		protected function get objectFactory() : ObjectFactory {
			return _objectFactory;
		}
	
	}
}