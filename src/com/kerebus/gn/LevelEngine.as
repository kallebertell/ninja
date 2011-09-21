package com.kerebus.gn
{
	import com.kerebus.gn.object.BackgroundLevelElement;
	import com.kerebus.gn.object.Ninja;
	
	import flash.events.*;
	import flash.geom.*;
	import flash.media.*;
	import flash.net.*;
	import flash.utils.*;
	
	import mx.core.*;
	
	public class LevelEngine
	{	
		protected static const TimeBetweenLevelElements:Number = 2;
		protected static const TimeBetweenClouds:Number = 2.5;
		protected static const TimeToLevelEnd:Number = 2;
		
		protected var nextDefinitions:Array = null;
		protected var levelID:int = 0;
		protected var totalTime:Number = 0;
		protected var timeToNextCloud:Number = 0;
		protected var timeToLevelEnd:Number = 0;
		protected var backgroundMusic:SoundChannel = null;
		public var levelEnd:Boolean = false;

		private var listener : IObjectLifecyleListener;
		private var objectFactory : ObjectFactory;

		private var currentLevel : Level;
		
		public function LevelEngine(factory : ObjectFactory, listener : IObjectLifecyleListener)
		{
			this.objectFactory = factory;
			this.listener = listener;
		}
		

		public function startup(level : Level):void
		{
			//new Player(listener, objectFactory).startupPlayer(this);
			new Ninja(listener, objectFactory).startupNinja(this);
			
			timeToLevelEnd = TimeToLevelEnd;
			levelEnd = false;
			backgroundMusic = ResourceManager.Track1FX.play(0, int.MAX_VALUE);
			
			this.totalTime = 0;
			//this.levelID = levelID;
			this.currentLevel = level;
			
			nextDefinitions = level.getNextLevelDefinitionElements(0);
			
			
			var tileDefinition : LevelBackground = level.background;
						
			if (tileDefinition != null)
				objectFactory.getTiledBackground().startupTiledBackground(tileDefinition);
		}
		
		public function shutdown():void
		{
			backgroundMusic.stop();
			backgroundMusic = null;
		}
		
		public function enterFrame(secondsElapsedSinceLastUpdate : Number):void
		{
			totalTime += secondsElapsedSinceLastUpdate;
			
			if (nextDefinitions == null)
			{
				if (objectFactory.NumberOfActiveEnemies == 0)
					levelEnd = true;
			}
			else
			{
				var nextLevelDefTime:Number = (nextDefinitions[0] as LevelEvent).time;
				if (totalTime >= nextLevelDefTime)
				{
					for each (var levelDefElement:LevelEvent in nextDefinitions)
						levelDefElement.func();
						
					nextDefinitions = currentLevel.getNextLevelDefinitionElements(nextLevelDefTime);
				}
			}
			
			// add cloud
			timeToNextCloud -= secondsElapsedSinceLastUpdate;
			
			if (timeToNextCloud <= secondsElapsedSinceLastUpdate)
			{
				timeToNextCloud = TimeBetweenClouds;
				var cloudBackgroundLevelElement:BackgroundLevelElement = objectFactory.getBackgroundLevelElement();
					
				cloudBackgroundLevelElement.startupBackgroundLevelElement(
					ResourceManager.CloudGraphics, 
					new Point(Math.random() * Application.application.width, -ResourceManager.CloudGraphics.bitmap.height),
					ZOrders.CLOUDSBELOWZORDER,
					75);
			}
			
			if (levelEnd)
			{
				timeToLevelEnd -= secondsElapsedSinceLastUpdate;
				var scale:Number = timeToLevelEnd / TimeToLevelEnd;				
				scale = Math.max(scale, 0);
					
				var transform:SoundTransform = backgroundMusic.soundTransform;
				transform.volume = scale;
				backgroundMusic.soundTransform = transform;
			}
				
			if (timeToLevelEnd <= 0)
				Application.application.currentState = "LevelEnd";	
		}
	}
}