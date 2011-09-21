package com.kerebus.gn
{
	import com.kerebus.gn.object.BaseObject;
	import com.kerebus.gn.object.Enemy;
	import com.kerebus.gn.object.GameObject;
	
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	import mx.collections.*;
	import mx.core.*;
	
	public class GameObjectManager implements IObjectLifecyleListener, IKillListener
	{
		// double buffer
		public var backBuffer:BitmapData;
		// colour to use to clear backbuffer with 
		public var clearColor:uint = 0xFF849AA5;

		// the last frame time		 
		protected var lastFrameTimestamp : Number;
		
		// a collection of the BaseObjects 
		protected var baseObjects:ArrayCollection = new ArrayCollection();
		
		// a collection where new BaseObjects are placed, to avoid adding items 
		// to baseObjects while in the baseObjects collection while it is in a loop
		protected var newBaseObjects:ArrayCollection = new ArrayCollection();
		
		// a collection where removed BaseObjects are placed, to avoid removing items 
		// to baseObjects while in the baseObjects collection while it is in a loop
		protected var removedBaseObjects:ArrayCollection = new ArrayCollection();
		protected var collisionMap:Dictionary = new Dictionary();
		
		private var currentLevel : LevelEngine;
		
		private var scoreBoard : ScoreBoard;
		
		public function GameObjectManager(scoreBoard : ScoreBoard)
		{	
			this.scoreBoard = scoreBoard;
			backBuffer = new BitmapData(Application.application.width, Application.application.height, false);
		}
		
		public function startup(level : LevelEngine):void
		{
			scoreBoard.reset();
			lastFrameTimestamp = new Date().getTime();
			currentLevel = level;			
		}
		
		public function shutdown():void
		{
			shutdownAll();
		}
		
		public function enterFrame():void
		{
			// Calculate the time since the last frame
			var thisFrameTimestamp : Number = new Date().getTime();
			var secondsElapsed : Number = (thisFrameTimestamp - lastFrameTimestamp)/1000.0;
	    	
	    	lastFrameTimestamp = thisFrameTimestamp;
	    	
	    	removeDeletedBaseObjects();
	    	insertNewBaseObjects();
	    	
	    	currentLevel.enterFrame(secondsElapsed);
	    	
	    	checkCollisions();
	    	
	    	// now allow objects to update themselves
			for each (var gameObject:BaseObject in baseObjects)
				if (gameObject.inuse) 
					gameObject.enterFrame(secondsElapsed);
	    	
	    	drawObjects();
		}
		
		public function keyUp(event:KeyboardEvent) : void {
			for each (var gameObject:BaseObject in baseObjects)
				if (gameObject.inuse) 
					gameObject.keyUp(event);			
		}
		
		public function keyDown(event:KeyboardEvent) : void {
			for each (var gameObject:BaseObject in baseObjects)
				if (gameObject.inuse) 
					gameObject.keyDown(event);			
		}
		
		public function click(event:MouseEvent):void
		{
			for each (var gameObject:BaseObject in baseObjects)
				if (gameObject.inuse) 
					gameObject.click(event);
		}
		
		public function mouseDown(event:MouseEvent):void
		{
			for each (var gameObject:BaseObject in baseObjects)
				if (gameObject.inuse) 
					gameObject.mouseDown(event);
		}
		
		public function mouseUp(event:MouseEvent):void
		{
			for each (var gameObject:BaseObject in baseObjects)
				if (gameObject.inuse) 
					gameObject.mouseUp(event);
		}
		
		public function mouseMove(event:MouseEvent):void
		{
			for each (var gameObject:BaseObject in baseObjects)
				if (gameObject.inuse) 
					gameObject.mouseMove(event);
		}
		
		protected function drawObjects():void
		{
			backBuffer.fillRect(backBuffer.rect, clearColor);
			
			// draw the objects
			for each (var baseObject:BaseObject in baseObjects)
				if (baseObject.inuse)
					baseObject.copyToBackBuffer(backBuffer);
		}
		
		//-------------------------------------------------------------------
		// IObjectLifecycleListener implementation 
		
		public function objectAdded(baseObject:BaseObject):void
		{
			newBaseObjects.addItem(baseObject);
		}
		
		public function objectRemoved(baseObject:BaseObject):void
		{		
			removedBaseObjects.addItem(baseObject);
		}
		//-------------------------------------------------------------------
		
		//-------------------------------------------------------------------
		// IKillListener implementation 
		
		public function enemyKilled(enemy : Enemy):void
		{
			scoreBoard.addKill(enemy);
		}
		
		//-------------------------------------------------------------------
		
		protected function shutdownAll():void
		{
			// don't dispose objects twice
			for each (var baseObject:BaseObject in baseObjects)
			{
				var found:Boolean = false;
				for each (var removedObject:BaseObject in removedBaseObjects)
				{
					if (removedObject == baseObject)
					{
						found = true;
						break;
					}
				}
				
				if (!found)
					baseObject.shutdown();
			}
		}
		
		protected function insertNewBaseObjects():void
		{
			for each (var baseObject:BaseObject in newBaseObjects)
			{
				for (var i:int = 0; i < baseObjects.length; ++i)
				{
					var otherBaseObject:BaseObject = baseObjects.getItemAt(i) as BaseObject;
					
					if (otherBaseObject.zOrder > baseObject.zOrder ||
						otherBaseObject.zOrder == -1)
						break;
				}

				baseObjects.addItemAt(baseObject, i);
			}
			
			newBaseObjects.removeAll();
		}
		
		protected function removeDeletedBaseObjects():void
		{
			// insert the object acording to it's z position
			for each (var removedObject:BaseObject in removedBaseObjects)
			{
				var i:int = 0;
				for (i = 0; i < baseObjects.length; ++i)
				{
					if (baseObjects.getItemAt(i) == removedObject)
					{
						baseObjects.removeItemAt(i);
						break;
					}
				}
				
			}
			
			removedBaseObjects.removeAll();
		}
		
		public function addCollidingPair(collider1:String, collider2:String):void
		{
			if (collisionMap[collider1] == null)			
				collisionMap[collider1] = new Array();
				
			if (collisionMap[collider2] == null)
				collisionMap[collider2] = new Array();
								
			collisionMap[collider1].push(collider2);
			collisionMap[collider2].push(collider1);
		}
		
		protected function checkCollisions():void
		{
	    	for (var i:int = 0; i < baseObjects.length; ++i) {
	    		
				var gameObjectI:GameObject = baseObjects.getItemAt(i) as GameObject;
				
				if (gameObjectI == null)
					continue;
					
				for (var j:int = i + 1; j < baseObjects.length; ++j) {
					var gameObjectJ:GameObject = baseObjects.getItemAt(j) as GameObject;
					
					if (checkForCollision(gameObjectI, gameObjectJ)) {
						gameObjectI.collision(gameObjectJ);
						gameObjectJ.collision(gameObjectI);
					}					
				} 
				
			} 
			
		}

		private function checkForCollision(ob1 : GameObject, ob2 : GameObject) : Boolean {
			if (ob1 == null || ob2 == null)
				return false;
						
			// early out for non-colliders
			if (ob1.collisionName == CollisionIdentifiers.NONE)
				return false;
					
			// objects can still exist in the baseObjects collection after being disposed, so check
			if (!(ob1.inuse && ob2.inuse))
				return false;
					
			// make sure we have an entry in the collisionMap
			if (collisionMap[ ob1.collisionName ] == null)
				return false;
			
			// make sure the two objects are set to collide
			if (collisionMap[ ob1.collisionName ].indexOf(ob2.collisionName) == -1)
				return false;
			
			if (ob1.CollisionArea.intersects(ob2.CollisionArea))
				return true;
				
			return false;
		}
		
	}
}