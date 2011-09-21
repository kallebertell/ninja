package com.kerebus.gn.object
{
	import com.kerebus.gn.CollisionIdentifiers;
	import com.kerebus.gn.GraphicsResource;
	import com.kerebus.gn.IObjectLifecyleListener;
	import com.kerebus.gn.VectorDir;
	import com.kerebus.gn.ZOrders;
	
	import flash.geom.*;
	
	public class Weapon extends AnimatedGameObject
	{
		protected var logicFunc : Function = null;
		protected var speed : Number = 0;	
		protected var homingPoint : Point;
		protected var direction : VectorDir;
		 
		
		public function Weapon(listener : IObjectLifecyleListener) {
			super(listener);
		}
		
		public function startupBasicWeapon(graphics:GraphicsResource, position:Point, speed:Number, playerWeapon:Boolean):void {
			super.startupAnimatedGameObject(graphics, position, ZOrders.PLAYERZORDER);
			
			logicFunc = basicWeaponLogic;
			this.speed = speed;
			
			if (playerWeapon)
				this.collisionName = CollisionIdentifiers.PLAYERWEAPON;
			else
				this.collisionName = CollisionIdentifiers.ENEMYWEAPON;
		}
				
		
		public function startupDirectedWeapon(graphics:GraphicsResource, position:Point, targetPoint:Point, playerWeapon:Boolean):void {
			super.startupAnimatedGameObject(graphics, position, ZOrders.PLAYERZORDER);

			this.direction = getDirection(position, targetPoint);
			 
			logicFunc = directedWeaponLogic;
			this.speed = 150;
			
			if (playerWeapon)
				this.collisionName = CollisionIdentifiers.PLAYERWEAPON;
			else
				this.collisionName = CollisionIdentifiers.ENEMYWEAPON;
		}
		
		private function getDirection(originalPosition : Point, targetPosition : Point) : VectorDir {
			var vectorX : int = targetPosition.x - originalPosition.x;
			var vectorY : int = targetPosition.y - originalPosition.y;
			
			var length : Number = Math.sqrt( vectorX * vectorX + vectorY * vectorY );
			
			return new VectorDir(vectorX/length, vectorY/length);			
		}
		
		override public function shutdown() : void {
			super.shutdown();
			logicFunc = null;
		}
		
		override public function enterFrame(dt:Number) : void {
			super.enterFrame(dt);
			
			if (logicFunc != null)
				logicFunc(dt);
		}
		
		protected function basicWeaponLogic(dt:Number) : void {
			if (position.y < -graphics.bitmap.height)
				this.shutdown();
			
			position.y -= speed * dt;
		}
	
		
		protected function directedWeaponLogic(dt:Number) : void {		
			position.y += speed * dt * direction.y;
			position.x += speed * dt * direction.x;
				
		}
		
		override public function collision(other:GameObject):void {
			this.shutdown();
		}
		
	}
}