package com.kerebus.gn.object
{
	import com.kerebus.gn.GraphicsResource;
	import com.kerebus.gn.IObjectLifecyleListener;
	
	import flash.display.*;
	import flash.geom.*;
	
	import mx.collections.*;

	/**
	 * A game object which runs an animation with clipping frames
	 */
	public class AnimatedGameObject extends GameObject
	{
		
		protected var frameTime:Number = 0;
		protected var currentFrame:int = 0;
		protected var frameWidth:int = 0;
		protected var playOnce:Boolean = false;
				
		public function AnimatedGameObject(listener : IObjectLifecyleListener) {
			super(listener);		
		}
		
		public function startupAnimatedGameObject(graphics:GraphicsResource, position:Point, z:int = 0, playOnce:Boolean = false):void {			
			this.playOnce = playOnce;			
			this.frameWidth = graphics.bitmap.width / graphics.frames;
			
			startupGameObject(graphics, position, z);
		}
		
		override public function enterFrame(dt:Number) : void	{
			if (!inuse)
				return;
				
			frameTime += dt;

			if (graphics.fps == -1)
				return;
				
			while (frameTime > 1/graphics.fps)
			{
				frameTime -= 1/graphics.fps;
				currentFrame = (currentFrame + 1) % graphics.frames;

				if (currentFrame == 0 && playOnce)
				{
					shutdown();
					break;
				}
			}
			
		}
		
		override public function copyToBackBuffer(db:BitmapData):void {
			if (!inuse)
				return;
				
			var drawRect:Rectangle = new Rectangle(currentFrame * frameWidth, 0, frameWidth, graphics.bitmap.height);
			db.copyPixels(graphics.bitmap, drawRect, position, graphics.bitmapAlpha, new Point(drawRect.x, 0), true);			
		}
		
		override protected function setupCollision() : void {
			collisionArea = new Rectangle(0, 0, frameWidth, graphics.bitmap.height);
		}
	}
	
}