package com.kerebus.gn.object
{
	import com.kerebus.gn.CollisionIdentifiers;
	import com.kerebus.gn.IObjectLifecyleListener;
	import com.kerebus.gn.LevelEngine;
	import com.kerebus.gn.MousePosition;
	import com.kerebus.gn.ObjectFactory;
	import com.kerebus.gn.ResourceManager;
	import com.kerebus.gn.ZOrders;
	
	import flash.events.*;
	import flash.geom.*;
	import flash.media.*;
	
	import mx.core.*;

	public class Ninja extends AnimatedGameObject
	{
		protected static const TimeBetweenShots:Number = 0.25;
		protected var shooting:Boolean = false;
		protected var timeToNextShot:Number = 0;
		
		private var horizontalMovingDirection : int = 0;
		private var verticalMovingDirection : int = 0;
		private var speed : int = 90;
		
		private var level : LevelEngine;
		
		private var objectFactory : ObjectFactory;
		
		public function Ninja(listener : IObjectLifecyleListener, objectFactory : ObjectFactory)
		{			
			this.objectFactory = objectFactory;
			
			super(listener);
		}
		
		public function startupNinja(level : LevelEngine):void
		{
			super.startupAnimatedGameObject(ResourceManager.NinjaGraphics, new Point(Application.application.width / 2, Application.application.height - 60), ZOrders.PLAYERZORDER);
			this.level = level;
			
			shooting = false;
			timeToNextShot = 0;
			this.collisionName = CollisionIdentifiers.PLAYER;
		}
		
		override public function shutdown():void
		{
			super.shutdown();
		}
		
		override public function enterFrame(dt:Number):void
		{
			super.enterFrame(dt);
			
			this.position.x += horizontalMovingDirection * speed * dt;
			this.position.y += verticalMovingDirection * speed * dt;
			
			if (this.position.x > Application.application.width) 
				this.position.x = Application.application.width;
				
			if (this.position.y > Application.application.height)
				this.position.y = Application.application.height;
				
			if (this.position.x < 0) this.position.x = 0;
			if (this.position.y < 0) this.position.y = 0;
			
			timeToNextShot -= dt;
			
			if (timeToNextShot <= 0 && shooting)
			{
				timeToNextShot = TimeBetweenShots;
				
				var weapon:Weapon = objectFactory.getWeapon();
			
				weapon.startupDirectedWeapon(
					ResourceManager.ShurikenGraphics,
					new Point(	
						position.x + graphics.bitmap.width / graphics.frames / 2 - ResourceManager.TwoBulletsGraphics.bitmap.width / 2, 
						position.y),
					new Point(MousePosition.x, MousePosition.y),
					true);
				
				ResourceManager.Gun1FX.play();
			}	
		}
		
		override public function mouseMove(event:MouseEvent):void
		{
		}
		
		override public function mouseDown(event:MouseEvent):void
		{
			shooting = true;
		}
		
		override public function mouseUp(event:MouseEvent):void
		{
			shooting = false;
		}
		
		private var upKeyCode : int = 119;
		private var downKeyCode : int = 115;
		private var leftKeyCode : int = 97;
		private var rightKeyCode : int = 100;

		override public function keyDown(event:KeyboardEvent):void {
			
			if (event.charCode == leftKeyCode) {
				horizontalMovingDirection = -1;
			} 
			
			if (event.charCode == rightKeyCode) {
				horizontalMovingDirection = 1;			
			}
			
			if (event.charCode == upKeyCode) {
				verticalMovingDirection = -1;
			}
			
			if (event.charCode == downKeyCode) {
				verticalMovingDirection = 1;			
			}
		}
		
		override public function keyUp(event:KeyboardEvent):void {
			if (event.charCode == leftKeyCode && horizontalMovingDirection == -1) {
				horizontalMovingDirection = 0;
			} 
			
			if (event.charCode == rightKeyCode && horizontalMovingDirection == 1) {
				horizontalMovingDirection = 0;
			}
			
			if (event.charCode == downKeyCode && verticalMovingDirection == 1) {
				verticalMovingDirection = 0;			
			}
			
			if (event.charCode == upKeyCode && verticalMovingDirection == -1) {
				verticalMovingDirection = 0;
			}
		}
		
		override public function collision(other:GameObject):void
		{	
			level.levelEnd = true;
			
			var animatedGameObject:AnimatedGameObject = objectFactory.getAnimatedGameObject();
			
			animatedGameObject.startupAnimatedGameObject(
				ResourceManager.BigExplosionGraphics, 
				new Point(
					position.x + graphics.bitmap.width / graphics.frames / 2 - ResourceManager.BigExplosionGraphics.bitmap.width / ResourceManager.BigExplosionGraphics.frames / 2, 
					position.y + graphics.bitmap.height / 2 - ResourceManager.BigExplosionGraphics.bitmap.height / 2), 
				ZOrders.PLAYERZORDER, 
				true);			
			
			this.shutdown();
			
			// only play the sound if we didn't crash into an enemy, because an
			// enemy is already playing an explosion sound
			if (other as Enemy == null)
				ResourceManager.ExplosionFX.play();
		}
	}
}