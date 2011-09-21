package com.kerebus.gn.object
{
	import com.kerebus.gn.IObjectLifecyleListener;
	
	import flash.display.*;
	import flash.events.*;
	
	public class BaseObject
	{
		public var inuse:Boolean = false;
		public var zOrder:int = 0;
		
		private var lifecycleListener : IObjectLifecyleListener;
		
		public function BaseObject(listener : IObjectLifecyleListener)
		{
			if (listener == null)
				throw new Error("Null listener received");
				
			this.lifecycleListener = listener;
		}
		
		public function startupBaseObject(zOrder:int):void
		{
			if (this.inuse)
				return;
				
			this.inuse = true;
			this.zOrder = zOrder;
			this.lifecycleListener.objectAdded(this);			
		}
		
		public function shutdown():void
		{
			if (!this.inuse)
				return;
				
			this.inuse = false;
			this.lifecycleListener.objectRemoved(this);
		}
		
		public function enterFrame(dt:Number):void
		{
		
		}
		
		public function click(event:MouseEvent):void
		{
		
		}
		
		public function mouseDown(event:MouseEvent):void
		{
		
		}
		
		public function mouseUp(event:MouseEvent):void
		{
		
		}
		
		public function mouseMove(event:MouseEvent):void
		{
		
		}
		
		public function keyUp(event:KeyboardEvent) : void {
			
		}
		
		public function keyDown(event:KeyboardEvent) : void {
			
		}
		
		public function collision(other:GameObject):void
		{
		
		}
		
		public function copyToBackBuffer(db:BitmapData):void
		{
		
		}

	}
}