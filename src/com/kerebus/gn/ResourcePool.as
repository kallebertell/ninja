package com.kerebus.gn
{
	import com.kerebus.gn.object.BaseObject;
	
	import mx.collections.*;
	
	public class ResourcePool
	{
		protected var pool:ArrayCollection = new ArrayCollection();
		protected var newObjectFunc:Function = null;
		
		public function ResourcePool(newObjectFunc:Function)
		{
			this.newObjectFunc = newObjectFunc;
		}
		
		public function get ItemFromPool():BaseObject
		{
			for each (var item:BaseObject in pool)
			{
				if (!item.inuse)
					return item; 
			}
			
			var newItem : BaseObject = newObjectFunc();
			pool.addItem(newItem);
			
			return newItem;
		}
		
		public function get NumberOfActiveObjects():int
		{
			var count:int = 0;
			for each (var item:BaseObject in pool)
			{
				if (item.inuse)
					++count;
			}
			return count;
		}
	}
}