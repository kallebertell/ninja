package com.kerebus.gn.object
{
	import com.kerebus.gn.GraphicsResource;
	import com.kerebus.gn.IObjectLifecyleListener;
	
	import flash.geom.Point;
	
	import mx.collections.*;
	import mx.core.*;

	public class BackgroundLevelElement extends GameObject
	{
	
		protected var scrollRate:Number = 0;
		
		public function BackgroundLevelElement(listener : IObjectLifecyleListener)
		{
			super(listener);
		}
		
		public function startupBackgroundLevelElement(bitmap:GraphicsResource, position:Point, z:int, scrollRate:Number):void
		{
			startupGameObject(bitmap, position, z);
			this.scrollRate = scrollRate; 
		}
		
		public override function enterFrame(dt:Number):void
		{
			if (position.y > Application.application.height + graphics.bitmap.height )
				this.shutdown();
			
			position.y += scrollRate * dt;
		}
	}
}