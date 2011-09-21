package com.kerebus.gn.object
{
	import com.kerebus.gn.IKillListener;
	import com.kerebus.gn.IObjectLifecyleListener;
	import com.kerebus.gn.MathUtils;
	import com.kerebus.gn.ObjectFactory;
	import com.kerebus.gn.ResourceManager;
	import com.kerebus.gn.ZOrders;
	
	import flash.display.BitmapData;
	import flash.filters.BitmapFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.setTimeout;
	

	public class BigEnemy extends Enemy
	{		
		public function BigEnemy(listener:IObjectLifecyleListener, killListener:IKillListener, factory:ObjectFactory)
		{
			super(listener, killListener, factory);
			
			hitPoints = 3;
		}
	
	
		override public function collision(other:GameObject):void
		{	
			hitPoints--;
			
			var filter : BitmapFilter = new ColorMatrixFilter( [5,0,0,0,0, 1,0,0,0,0, 1,0,0,0,0, 1,0,0,0,0]);
			var drawRect:Rectangle = new Rectangle(0, 0, graphics.bitmap.width, graphics.bitmap.height);
			this.graphics.bitmap.applyFilter(this.graphics.bitmap, drawRect, new Point(0,0), filter);
			
			if (hitPoints > 0)
				return;
			
			for (var i : int = 0; i<8; i++) {	
				
				setTimeout(function() : void {
					var animatedGameObject:AnimatedGameObject = objectFactory.getAnimatedGameObject();
				
					animatedGameObject.startupAnimatedGameObject(
						ResourceManager.BigExplosionGraphics, 
						new Point(
							position.x + ResourceManager.BigExplosionGraphics.bitmap.width / ResourceManager.BigExplosionGraphics.frames / 2 + MathUtils.randomInteger(0, 50), 
							position.y + ResourceManager.BigExplosionGraphics.bitmap.height / 2 + MathUtils.randomInteger(0, 50)) , 
						ZOrders.PLAYERZORDER, 
						true);
						
						ResourceManager.ExplosionFX.play();
						
				}, MathUtils.randRange(0, 700));
				

			}
			
			killListener.enemyKilled(this);
			this.shutdown();
		}
		
		override public function copyToBackBuffer(db:BitmapData):void {
			super.copyToBackBuffer(db);
			
			var drawRect:Rectangle = new Rectangle(currentFrame * frameWidth, 0, frameWidth, graphics.bitmap.height);
			db.copyPixels(graphics.bitmap, drawRect, position, graphics.bitmapAlpha, new Point(drawRect.x, 0), true);			
		}
	}
}