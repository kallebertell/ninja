package com.kerebus.gn.object
{
	import com.kerebus.gn.CollisionIdentifiers;
	import com.kerebus.gn.GraphicsResource;
	import com.kerebus.gn.IObjectLifecyleListener;
	
	import flash.display.*;
	import flash.geom.*;
	
	/*
		The base class for all objects in the game.
	*/
	public class GameObject extends BaseObject
	{
		// object position
		public var position:Point = new Point(0, 0);
		// the bitmap data to display	
		public var graphics:GraphicsResource = null;
		public var collisionArea:Rectangle;
		public var collisionName:String = CollisionIdentifiers.NONE;	
		
		public function get CollisionArea():Rectangle
		{
			return new Rectangle(position.x, position.y, collisionArea.width, collisionArea.height);
		}	
		
		public function GameObject(listener : IObjectLifecyleListener)
		{
			super(listener);
		}
		
		public function startupGameObject(graphics:GraphicsResource, position:Point, zOrder:int = 0):void
		{
			if (inuse)
				return;
			
			super.startupBaseObject(zOrder);			
			this.graphics = graphics;
			this.position = position.clone();				
			setupCollision();
		}
		
		override public function shutdown():void
		{
			if (!inuse)
				return;
							
			super.shutdown();
			graphics = null;							
		}
		
		override public function copyToBackBuffer(db:BitmapData):void
		{
			db.copyPixels(graphics.bitmap, graphics.bitmap.rect, position, graphics.bitmapAlpha, new Point(0, 0), true);
		}				
		
		protected function setupCollision():void
		{
			collisionArea = graphics.bitmap.rect;
		}
	}
}