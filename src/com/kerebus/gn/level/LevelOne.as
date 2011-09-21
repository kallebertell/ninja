package com.kerebus.gn.level
{
	import com.kerebus.gn.Level;
	import com.kerebus.gn.LevelBackground;
	import com.kerebus.gn.LevelEvent;
	import com.kerebus.gn.MathUtils;
	import com.kerebus.gn.ObjectFactory;
	import com.kerebus.gn.ResourceManager;
	import com.kerebus.gn.ZOrders;
	
	import flash.geom.Point;

	public class LevelOne extends Level
	{
		public function LevelOne(objectFactory : ObjectFactory)
		{
			super("Attaxx of the airplanes", objectFactory);
			
			setupLevel();	
		}
		
		private function setupLevel() : void {
			background = new LevelBackground();			
			
			background.tileScrollRate = 25;
			background.tileHeight = 40;
			background.tileWidth = 40;
			background.tiles = 
				[
					[
						[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID2, ResourceManager.GreenGraphicsID3, ResourceManager.GreenGraphicsID3, ResourceManager.GreenGraphicsID4, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID5, ResourceManager.GreenGraphicsID6, ResourceManager.GreenGraphicsID6, ResourceManager.GreenGraphicsID7, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID5, ResourceManager.GreenGraphicsID6, ResourceManager.GreenGraphicsID6, ResourceManager.GreenGraphicsID7, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID5, ResourceManager.GreenGraphicsID6, ResourceManager.GreenGraphicsID6, ResourceManager.GreenGraphicsID7, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID8, ResourceManager.GreenGraphicsID9, ResourceManager.GreenGraphicsID9, ResourceManager.GreenGraphicsID10, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
						,[ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1, ResourceManager.GreenGraphicsID1]
					]
					,[
						[null, null, null, null, null, null, null, null, null, null, null, null, null, null, null]
						,[null, null, null, null, null, null, null, null, null, null, null, null, null, null, null]
						,[null, ResourceManager.GreenGraphicsID11, ResourceManager.GreenGraphicsID12, ResourceManager.GreenGraphicsID13, ResourceManager.GreenGraphicsID14, ResourceManager.GreenGraphicsID15, ResourceManager.GreenGraphicsID16, null, null, null, null, null, null, null, null]
						,[null, ResourceManager.GreenGraphicsID17, ResourceManager.GreenGraphicsID18, ResourceManager.GreenGraphicsID19, ResourceManager.GreenGraphicsID20, ResourceManager.GreenGraphicsID21, ResourceManager.GreenGraphicsID22, null, null, null, null, null, null, null, null]
						,[null, ResourceManager.GreenGraphicsID23, ResourceManager.GreenGraphicsID24, ResourceManager.GreenGraphicsID25, ResourceManager.GreenGraphicsID25, ResourceManager.GreenGraphicsID26, ResourceManager.GreenGraphicsID27, null, null, null, null, null, null, null, null]
						,[null, ResourceManager.GreenGraphicsID28, ResourceManager.GreenGraphicsID29, ResourceManager.GreenGraphicsID25, ResourceManager.GreenGraphicsID25, ResourceManager.GreenGraphicsID30, ResourceManager.GreenGraphicsID31, null, null, null, null, null, null, ResourceManager.GreenGraphicsID32, ResourceManager.GreenGraphicsID33]
						,[null, ResourceManager.GreenGraphicsID34, ResourceManager.GreenGraphicsID35, ResourceManager.GreenGraphicsID36, ResourceManager.GreenGraphicsID37, ResourceManager.GreenGraphicsID38, ResourceManager.GreenGraphicsID39, null, null, null, null, null, null, ResourceManager.GreenGraphicsID40, ResourceManager.GreenGraphicsID41]
						,[null, ResourceManager.GreenGraphicsID42, ResourceManager.GreenGraphicsID43, ResourceManager.GreenGraphicsID44, ResourceManager.GreenGraphicsID45, ResourceManager.GreenGraphicsID46, ResourceManager.GreenGraphicsID47, ResourceManager.GreenGraphicsID11, ResourceManager.GreenGraphicsID12, ResourceManager.GreenGraphicsID13, ResourceManager.GreenGraphicsID14, ResourceManager.GreenGraphicsID15, ResourceManager.GreenGraphicsID16, ResourceManager.GreenGraphicsID48, ResourceManager.GreenGraphicsID49]
						,[null, ResourceManager.GreenGraphicsID50, ResourceManager.GreenGraphicsID51, ResourceManager.GreenGraphicsID52, ResourceManager.GreenGraphicsID53, ResourceManager.GreenGraphicsID54, ResourceManager.GreenGraphicsID55, ResourceManager.GreenGraphicsID17, ResourceManager.GreenGraphicsID18, ResourceManager.GreenGraphicsID19, ResourceManager.GreenGraphicsID20, ResourceManager.GreenGraphicsID21, ResourceManager.GreenGraphicsID22, null, null]
						,[null, null, null, null, null, null, null, ResourceManager.GreenGraphicsID23, ResourceManager.GreenGraphicsID24, ResourceManager.GreenGraphicsID25, ResourceManager.GreenGraphicsID25, ResourceManager.GreenGraphicsID26, ResourceManager.GreenGraphicsID27, null, null]
						,[null, null, ResourceManager.GreenGraphicsID32, ResourceManager.GreenGraphicsID33, null, null, null, ResourceManager.GreenGraphicsID28, ResourceManager.GreenGraphicsID29, ResourceManager.GreenGraphicsID25, ResourceManager.GreenGraphicsID25, ResourceManager.GreenGraphicsID30, ResourceManager.GreenGraphicsID31, null, null]
						,[null, null, ResourceManager.GreenGraphicsID40, ResourceManager.GreenGraphicsID41, null, null, null, ResourceManager.GreenGraphicsID34, ResourceManager.GreenGraphicsID35, ResourceManager.GreenGraphicsID36, ResourceManager.GreenGraphicsID37, ResourceManager.GreenGraphicsID38, ResourceManager.GreenGraphicsID39, null, null]
						,[null, null, ResourceManager.GreenGraphicsID48, ResourceManager.GreenGraphicsID49, null, null, null, ResourceManager.GreenGraphicsID42, ResourceManager.GreenGraphicsID43, ResourceManager.GreenGraphicsID44, ResourceManager.GreenGraphicsID45, ResourceManager.GreenGraphicsID46, ResourceManager.GreenGraphicsID47, null, null]
						,[null, null, null, null, null, null, null, ResourceManager.GreenGraphicsID50, ResourceManager.GreenGraphicsID51, ResourceManager.GreenGraphicsID52, ResourceManager.GreenGraphicsID53, ResourceManager.GreenGraphicsID54, ResourceManager.GreenGraphicsID55, null, null]
						,[null, ResourceManager.GreenGraphicsID11, ResourceManager.GreenGraphicsID12, ResourceManager.GreenGraphicsID13, ResourceManager.GreenGraphicsID14, ResourceManager.GreenGraphicsID15, ResourceManager.GreenGraphicsID16, null, null, null, null, null, ResourceManager.GreenGraphicsID32, ResourceManager.GreenGraphicsID33, null]
						,[null, ResourceManager.GreenGraphicsID17, ResourceManager.GreenGraphicsID18, ResourceManager.GreenGraphicsID19, ResourceManager.GreenGraphicsID20, ResourceManager.GreenGraphicsID21, ResourceManager.GreenGraphicsID22, null, null, null, null, null, ResourceManager.GreenGraphicsID40, ResourceManager.GreenGraphicsID41, null]
						,[null, ResourceManager.GreenGraphicsID23, ResourceManager.GreenGraphicsID24, ResourceManager.GreenGraphicsID25, ResourceManager.GreenGraphicsID25, ResourceManager.GreenGraphicsID26, ResourceManager.GreenGraphicsID27, null, null, null, null, null, ResourceManager.GreenGraphicsID48, ResourceManager.GreenGraphicsID49, null]
						,[null, ResourceManager.GreenGraphicsID28, ResourceManager.GreenGraphicsID29, ResourceManager.GreenGraphicsID25, ResourceManager.GreenGraphicsID25, ResourceManager.GreenGraphicsID30, ResourceManager.GreenGraphicsID31, null, null, null, null, null, null, null, null]
						,[null, ResourceManager.GreenGraphicsID34, ResourceManager.GreenGraphicsID35, ResourceManager.GreenGraphicsID36, ResourceManager.GreenGraphicsID37, ResourceManager.GreenGraphicsID38, ResourceManager.GreenGraphicsID39, null, ResourceManager.GreenGraphicsID11, ResourceManager.GreenGraphicsID12, ResourceManager.GreenGraphicsID13, ResourceManager.GreenGraphicsID14, ResourceManager.GreenGraphicsID15, ResourceManager.GreenGraphicsID16, null]
						,[null, ResourceManager.GreenGraphicsID42, ResourceManager.GreenGraphicsID43, ResourceManager.GreenGraphicsID44, ResourceManager.GreenGraphicsID45, ResourceManager.GreenGraphicsID46, ResourceManager.GreenGraphicsID47, null, ResourceManager.GreenGraphicsID17, ResourceManager.GreenGraphicsID18, ResourceManager.GreenGraphicsID19, ResourceManager.GreenGraphicsID20, ResourceManager.GreenGraphicsID21, ResourceManager.GreenGraphicsID22, null]
						,[null, ResourceManager.GreenGraphicsID50, ResourceManager.GreenGraphicsID51, ResourceManager.GreenGraphicsID52, ResourceManager.GreenGraphicsID53, ResourceManager.GreenGraphicsID54, ResourceManager.GreenGraphicsID55, null, ResourceManager.GreenGraphicsID23, ResourceManager.GreenGraphicsID24, ResourceManager.GreenGraphicsID25, ResourceManager.GreenGraphicsID25, ResourceManager.GreenGraphicsID26, ResourceManager.GreenGraphicsID27, null]
						,[null, null, null, null, null, null, null, null, ResourceManager.GreenGraphicsID28, ResourceManager.GreenGraphicsID29, ResourceManager.GreenGraphicsID25, ResourceManager.GreenGraphicsID25, ResourceManager.GreenGraphicsID30, ResourceManager.GreenGraphicsID31, null]
						,[null, null, null, null, null, null, null, null, ResourceManager.GreenGraphicsID34, ResourceManager.GreenGraphicsID35, ResourceManager.GreenGraphicsID36, ResourceManager.GreenGraphicsID37, ResourceManager.GreenGraphicsID38, ResourceManager.GreenGraphicsID39, null]
						,[null, null, ResourceManager.GreenGraphicsID32, ResourceManager.GreenGraphicsID33, null, null, null, null, ResourceManager.GreenGraphicsID42, ResourceManager.GreenGraphicsID43, ResourceManager.GreenGraphicsID44, ResourceManager.GreenGraphicsID45, ResourceManager.GreenGraphicsID46, ResourceManager.GreenGraphicsID47, null]
						,[null, null, ResourceManager.GreenGraphicsID40, ResourceManager.GreenGraphicsID41, null, null, null, null, ResourceManager.GreenGraphicsID50, ResourceManager.GreenGraphicsID51, ResourceManager.GreenGraphicsID52, ResourceManager.GreenGraphicsID53, ResourceManager.GreenGraphicsID54, ResourceManager.GreenGraphicsID55, null]
						,[null, null, ResourceManager.GreenGraphicsID48, ResourceManager.GreenGraphicsID49, ResourceManager.GreenGraphicsID56, ResourceManager.GreenGraphicsID57, ResourceManager.GreenGraphicsID58, null, null, null, null, null, null, null, null]
						,[null, null, null, null, ResourceManager.GreenGraphicsID59, ResourceManager.GreenGraphicsID60, ResourceManager.GreenGraphicsID61, null, null, null, ResourceManager.GreenGraphicsID32, ResourceManager.GreenGraphicsID33, null, null, null]
						,[null, null, null, null, ResourceManager.GreenGraphicsID62, ResourceManager.GreenGraphicsID63, ResourceManager.GreenGraphicsID64, null, null, null, ResourceManager.GreenGraphicsID40, ResourceManager.GreenGraphicsID41, null, null, null]
						,[null, null, null, null, ResourceManager.GreenGraphicsID11, ResourceManager.GreenGraphicsID12, ResourceManager.GreenGraphicsID15, ResourceManager.GreenGraphicsID16, null, null, ResourceManager.GreenGraphicsID48, ResourceManager.GreenGraphicsID49, null, null, null]
						,[null, ResourceManager.GreenGraphicsID56, ResourceManager.GreenGraphicsID57, ResourceManager.GreenGraphicsID58, ResourceManager.GreenGraphicsID17, ResourceManager.GreenGraphicsID18, ResourceManager.GreenGraphicsID21, ResourceManager.GreenGraphicsID22, null, null, null, null, null, null, null]
						,[null, ResourceManager.GreenGraphicsID59, ResourceManager.GreenGraphicsID60, ResourceManager.GreenGraphicsID61, ResourceManager.GreenGraphicsID23, ResourceManager.GreenGraphicsID24, ResourceManager.GreenGraphicsID30, ResourceManager.GreenGraphicsID31, null, null, null, null, null, null, null]
						,[null, ResourceManager.GreenGraphicsID62, ResourceManager.GreenGraphicsID63, ResourceManager.GreenGraphicsID64, ResourceManager.GreenGraphicsID34, ResourceManager.GreenGraphicsID35, ResourceManager.GreenGraphicsID38, ResourceManager.GreenGraphicsID39, null, ResourceManager.GreenGraphicsID11, ResourceManager.GreenGraphicsID12, ResourceManager.GreenGraphicsID15, ResourceManager.GreenGraphicsID16, null, null]
						,[null, null, null, null, ResourceManager.GreenGraphicsID42, ResourceManager.GreenGraphicsID43, ResourceManager.GreenGraphicsID46, ResourceManager.GreenGraphicsID47, null, ResourceManager.GreenGraphicsID17, ResourceManager.GreenGraphicsID18, ResourceManager.GreenGraphicsID21, ResourceManager.GreenGraphicsID22, null, null]
						,[null, null, null, null, ResourceManager.GreenGraphicsID50, ResourceManager.GreenGraphicsID51, ResourceManager.GreenGraphicsID54, ResourceManager.GreenGraphicsID55, null, ResourceManager.GreenGraphicsID23, ResourceManager.GreenGraphicsID24, ResourceManager.GreenGraphicsID30, ResourceManager.GreenGraphicsID31, null, null]
						,[null, null, null, ResourceManager.GreenGraphicsID32, ResourceManager.GreenGraphicsID33, null, null, null, null, ResourceManager.GreenGraphicsID34, ResourceManager.GreenGraphicsID35, ResourceManager.GreenGraphicsID38, ResourceManager.GreenGraphicsID39, null, null]
						,[null, null, null, ResourceManager.GreenGraphicsID40, ResourceManager.GreenGraphicsID41, null, null, null, null, ResourceManager.GreenGraphicsID42, ResourceManager.GreenGraphicsID43, ResourceManager.GreenGraphicsID46, ResourceManager.GreenGraphicsID47, null, null]
						,[null, null, null, ResourceManager.GreenGraphicsID48, ResourceManager.GreenGraphicsID49, null, ResourceManager.GreenGraphicsID32, ResourceManager.GreenGraphicsID33, null, ResourceManager.GreenGraphicsID50, ResourceManager.GreenGraphicsID51, ResourceManager.GreenGraphicsID54, ResourceManager.GreenGraphicsID55, null, null]
						,[null, ResourceManager.GreenGraphicsID11, ResourceManager.GreenGraphicsID12, ResourceManager.GreenGraphicsID15, ResourceManager.GreenGraphicsID16, null, ResourceManager.GreenGraphicsID40, ResourceManager.GreenGraphicsID41, null, null, null, null, null, null, null]
						,[null, ResourceManager.GreenGraphicsID17, ResourceManager.GreenGraphicsID18, ResourceManager.GreenGraphicsID21, ResourceManager.GreenGraphicsID22, null, ResourceManager.GreenGraphicsID48, ResourceManager.GreenGraphicsID49, null, ResourceManager.GreenGraphicsID32, ResourceManager.GreenGraphicsID33, null, null, null, null]
						,[null, ResourceManager.GreenGraphicsID23, ResourceManager.GreenGraphicsID24, ResourceManager.GreenGraphicsID30, ResourceManager.GreenGraphicsID31, null, null, null, null, ResourceManager.GreenGraphicsID40, ResourceManager.GreenGraphicsID41, null, null, null, null]
						,[null, ResourceManager.GreenGraphicsID34, ResourceManager.GreenGraphicsID35, ResourceManager.GreenGraphicsID38, ResourceManager.GreenGraphicsID39, null, null, null, null, ResourceManager.GreenGraphicsID48, ResourceManager.GreenGraphicsID49, null, null, null, null]
						,[null, ResourceManager.GreenGraphicsID42, ResourceManager.GreenGraphicsID43, ResourceManager.GreenGraphicsID46, ResourceManager.GreenGraphicsID47, null, null, null, null, null, null, ResourceManager.GreenGraphicsID32, ResourceManager.GreenGraphicsID33, null, null]
						,[null, ResourceManager.GreenGraphicsID50, ResourceManager.GreenGraphicsID51, ResourceManager.GreenGraphicsID54, ResourceManager.GreenGraphicsID55, null, null, null, null, null, null, ResourceManager.GreenGraphicsID40, ResourceManager.GreenGraphicsID41, null, null]
						,[null, null, null, null, null, null, null, null, null, null, null, ResourceManager.GreenGraphicsID48, ResourceManager.GreenGraphicsID49, null, null]
						,[null, null, null, null, null, null, null, null, ResourceManager.GreenGraphicsID56, ResourceManager.GreenGraphicsID57, ResourceManager.GreenGraphicsID58, null, null, null, null]
						,[null, null, null, null, null, null, null, null, ResourceManager.GreenGraphicsID59, ResourceManager.GreenGraphicsID60, ResourceManager.GreenGraphicsID61, null, null, null, null]
						,[null, ResourceManager.GreenGraphicsID56, ResourceManager.GreenGraphicsID57, ResourceManager.GreenGraphicsID58, null, ResourceManager.GreenGraphicsID32, ResourceManager.GreenGraphicsID33, null, ResourceManager.GreenGraphicsID62, ResourceManager.GreenGraphicsID63, ResourceManager.GreenGraphicsID64, null, null, null, null]
						,[null, ResourceManager.GreenGraphicsID59, ResourceManager.GreenGraphicsID60, ResourceManager.GreenGraphicsID61, null, ResourceManager.GreenGraphicsID40, ResourceManager.GreenGraphicsID41, null, null, null, null, null, null, null, null]
						,[null, ResourceManager.GreenGraphicsID62, ResourceManager.GreenGraphicsID63, ResourceManager.GreenGraphicsID64, null, ResourceManager.GreenGraphicsID48, ResourceManager.GreenGraphicsID49, null, null, null, null, null, null, null, null]
					]
				];
			
			addLevelEvent(
				new LevelEvent(
					2,
					function() : void {
						objectFactory.getBigEnemy().startupBasicEnemy(
							ResourceManager.BrownPlaneGraphics,
							new Point(200, -ResourceManager.BrownPlaneGraphics.bitmap.height),
							50 + MathUtils.randomInteger(0, 100));
					}
				));

			addLevelEvent(
				new LevelEvent(
					4,
					function():void 
					{
						for each (var xPos:int in [150, 350])
						{
							
							objectFactory.getEnemy().startupSwivlingEnemy(
								ResourceManager.SmallWhitePlaneGraphics,
								new Point(xPos, -ResourceManager.SmallWhitePlaneGraphics.bitmap.height),
								50 + MathUtils.randomInteger(0, 100));
						}
					}
				));
			
			addLevelEvent(
				new LevelEvent(
					5,
					function():void 
					{
						objectFactory.getEnemy().startupSwivlingEnemy(
							ResourceManager.SmallWhitePlaneGraphics,
							new Point(500, -ResourceManager.SmallBluePlaneGraphics.bitmap.height),
							50 + MathUtils.randomInteger(0, 100)); 
					}));
			
			addLevelEvent( 
				new LevelEvent(
					7,
					function():void 
					{
						for each (var xPos:int in [30, 60, 90, 120, 150])
						{
							objectFactory.getEnemy().startupSwivlingEnemy(
								ResourceManager.SmallBluePlaneGraphics,
								new Point(xPos, -ResourceManager.SmallBluePlaneGraphics.bitmap.height),
								10 + MathUtils.randomInteger(0, 20));
						}
					}));
			
			addLevelEvent( 
				new LevelEvent(
					12,
					function():void 
					{
						for each (var xPos:int in [120, 150, 180, 210, 240])
						{
							objectFactory.getEnemy().startupBasicEnemy(
								ResourceManager.SmallBluePlaneGraphics,
								new Point(xPos, -ResourceManager.SmallBluePlaneGraphics.bitmap.height),
								50 + MathUtils.randomInteger(0, 100));
						}
					}));
			
			addLevelEvent(
				new LevelEvent(
					17,
					function():void 
					{
						for each (var xPos:int in [240, 270, 300, 330, 360])
						{
							objectFactory.getEnemy().startupBasicEnemy(
								ResourceManager.SmallBluePlaneGraphics,
								new Point(xPos, -ResourceManager.SmallBluePlaneGraphics.bitmap.height),
								50 + MathUtils.randomInteger(0, 100));
						}
					}));
			
			addLevelEvent( 
				new LevelEvent(
					23,
					function():void 
					{
						for each (var xPos:int in [360, 390, 420, 450, 480])
						{
							objectFactory.getEnemy().startupBasicEnemy(
								ResourceManager.SmallBluePlaneGraphics,
								new Point(xPos, -ResourceManager.SmallBluePlaneGraphics.bitmap.height),
								50 + MathUtils.randomInteger(0, 100));
						}
					}));
			
			addLevelEvent(
				new LevelEvent(
					25,
					function() : void {
						objectFactory.getBigEnemy().startupSwivlingEnemy(
							ResourceManager.BrownPlaneGraphics,
							new Point(200, -ResourceManager.BrownPlaneGraphics.bitmap.height),
							50 + MathUtils.randomInteger(0, 100));
					}
				));
			
			addLevelEvent(
				new LevelEvent(
					28,
					function():void 
					{
						for each (var xPos:int in [480, 510, 540, 570])
						{
							objectFactory.getEnemy().startupBasicEnemy(
								ResourceManager.SmallBluePlaneGraphics,
								new Point(xPos, -ResourceManager.SmallBluePlaneGraphics.bitmap.height),
								50 + MathUtils.randomInteger(0, 100));
						}
					}));	
			
			addLevelEvent(
				new LevelEvent(
					35,
					function():void 
					{
						for each (var xPos:int in [50, 80, 110, 140, 170, 200, 230, 480, 510, 540, 570])
						{
							objectFactory.getEnemy().startupBasicEnemy(
								ResourceManager.SmallBluePlaneGraphics,
								new Point(xPos, -ResourceManager.SmallBluePlaneGraphics.bitmap.height),
								50 + MathUtils.randomInteger(0, 100));
						}
					}));
					
			addLevelEvent(
				new LevelEvent(
					58,
					function():void 
					{
						for each (var xPos:int in [250, 350, 450, 550])
						{
							objectFactory.getEnemy().startupBasicEnemy(
								ResourceManager.SmallBluePlaneGraphics,
								new Point(xPos, -ResourceManager.SmallBluePlaneGraphics.bitmap.height),
								50 + MathUtils.randomInteger(0, 100));
						}
					}));
					
			addLevelEvent(
				new LevelEvent(
					65,
					function():void 
					{
						for (var i:int=0; i<20; i++) {
							objectFactory.getEnemy().startupSwivlingEnemy(
								ResourceManager.SmallWhitePlaneGraphics,
								new Point(i*30, -ResourceManager.SmallBluePlaneGraphics.bitmap.height),
								50 + MathUtils.randomInteger(0, 100));
						}
					}));
					
			addLevelEvent(new LevelEvent(73,
					function():void 
					{ }));		
		
		}
	}
}