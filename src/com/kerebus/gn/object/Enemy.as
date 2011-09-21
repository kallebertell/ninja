package com.kerebus.gn.object
{
	import com.kerebus.gn.CollisionIdentifiers;
	import com.kerebus.gn.GraphicsResource;
	import com.kerebus.gn.IKillListener;
	import com.kerebus.gn.IObjectLifecyleListener;
	import com.kerebus.gn.MathUtils;
	import com.kerebus.gn.ObjectFactory;
	import com.kerebus.gn.ResourceManager;
	import com.kerebus.gn.ZOrders;
	
	import flash.geom.Point;
	
	import mx.core.*;
	
	public class Enemy extends AnimatedGameObject
	{
		protected var logic : Function = null;
		protected var speed : Number = 0;		
		protected var hitPoints : int = 1;
		
		private var swivel : int = 0;
		private var startX : int = 0;
		private var horizontalDirection : int = 1;
		
		
		
		protected var objectFactory : ObjectFactory;
		protected var killListener : IKillListener;
		
		public function Enemy(listener : IObjectLifecyleListener, killListener : IKillListener, factory : ObjectFactory)
		{
			this.objectFactory = factory;
			this.killListener = killListener;
				
			super(listener);
		}

		public function startupBasicEnemy(graphics:GraphicsResource, position:Point, speed:Number):void
		{
			super.startupAnimatedGameObject(graphics, position, ZOrders.PLAYERZORDER);
			this.collisionName = CollisionIdentifiers.ENEMY;
			logic = basicEnemyLogic;
			this.speed = speed;
			
		}
		
		public function startupSwivlingEnemy(graphics:GraphicsResource, position:Point, swivel : int) : void {
			super.startupAnimatedGameObject(graphics, position, ZOrders.PLAYERZORDER);
			this.collisionName = CollisionIdentifiers.ENEMY;
			logic = swivelkEnemyLogic;
			this.speed = 50 + MathUtils.randomInteger(0, 100);
			this.swivel = swivel;
			this.startX = position.x;
		}
		
		override public function shutdown():void
		{
			super.shutdown();
			logic = null;
		}
		
		override public function enterFrame(dt:Number):void
		{
			super.enterFrame(dt);
			
			if (logic != null)
				logic(dt);
		}
		
		protected function _basicEnemyLogic(dt:Number):void
		{
			if (position.y > Application.application.height + graphics.bitmap.height )
				this.shutdown();
			
			position.y += speed * dt;
		}
		
		protected function swivelkEnemyLogic(dt:Number) : void {
			if (position.y > Application.application.height + graphics.bitmap.height )
				this.shutdown();

			position.y += speed * dt;
			position.x += speed * dt * horizontalDirection;
			
			if (position.x - startX > swivel)
				horizontalDirection = -1;
				
			if (startX - position.x > swivel)
				horizontalDirection = 1; 
			
		}
		
		protected function basicEnemyLogic(dt:Number) : void {
			if (position.y > Application.application.height + graphics.bitmap.height )
				this.shutdown();

			position.y += speed * dt;
			position.x += Math.sin(speed * dt * horizontalDirection);
			
			if (position.x - startX > swivel)
				horizontalDirection = -1;
				
			if (startX - position.x > swivel)
				horizontalDirection = 1; 
			
		}
		
		override public function collision(other:GameObject):void
		{			
			var animatedGameObject:AnimatedGameObject = objectFactory.getAnimatedGameObject();
			
			animatedGameObject.startupAnimatedGameObject(
				ResourceManager.BigExplosionGraphics, 
				new Point(
					position.x + graphics.bitmap.width / graphics.frames / 2 - ResourceManager.BigExplosionGraphics.bitmap.width / ResourceManager.BigExplosionGraphics.frames / 2, 
					position.y + graphics.bitmap.height / 2 - ResourceManager.BigExplosionGraphics.bitmap.height / 2), 
				ZOrders.PLAYERZORDER, 
				true);
				
			killListener.enemyKilled(this);
			this.shutdown();
			
			ResourceManager.ExplosionFX.play();
		}

	}
}