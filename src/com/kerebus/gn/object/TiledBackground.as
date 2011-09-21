package com.kerebus.gn.object
{
	import com.kerebus.gn.GraphicsResource;
	import com.kerebus.gn.IObjectLifecyleListener;
	import com.kerebus.gn.LevelBackground;
	import com.kerebus.gn.ZOrders;
	
	import flash.display.*;
	import flash.geom.*;
	
	import mx.collections.*;
	import mx.core.*;
	
	public class TiledBackground extends BaseObject
	{
		public var scrolling:Boolean = true;
		protected var yOffset:Number = 0;
		protected var definition:LevelBackground = null;

		
		public function TiledBackground(listener : IObjectLifecyleListener)
		{
			super(listener);
		}
		
		public function startupTiledBackground(definition:LevelBackground):void
		{
			super.startupBaseObject(ZOrders.BACKGROUNDZORDER);
			this.definition = definition;
			this.yOffset = 0;
			this.scrolling = true;
		}
		
		override public function shutdown():void
		{
			super.shutdown();
		}
		
		override public function enterFrame(dt:Number):void
		{
			if (scrolling)
			{	
				var mapHeight:int = definition.tiles[0].length * definition.tileHeight;
				var mapOverlap:int = mapHeight - Application.application.height;
				yOffset += definition.tileScrollRate * dt;
				if (yOffset > mapOverlap)
				{
					scrolling = false;
					yOffset =  mapOverlap;
				}
			}
		}
		
		override public function copyToBackBuffer(db:BitmapData):void
		{
		 	var startRow:int = yOffset / definition.tileHeight;
		 	var startRowNumber:Number = yOffset / definition.tileHeight;
		 	var startRowHeight:int = definition.tileHeight * (startRowNumber - startRow);
		 	
		 	var drawnHeight:int = 0;
		 	var drawnWidth:int = 0;	
		 	
		 	var layer:int = 0;
		 	var row:int = startRow;
		 	var col:int = 0;
		 	
			// loop through each layer
			for (layer = 0; layer < definition.tiles.length; ++layer)
			{
				// loop through each row
				var count:int = 0;
				for (row = (definition.tiles[layer] as Array).length - 1 - startRow; row >= 0 ; --row)
				{
			 		// loop through each column of the current row
			 		for (col = 0; col < (definition.tiles[layer][row] as Array).length; ++col)
			 		{
			 			var graphics:GraphicsResource = definition.tiles[layer][row][col] as GraphicsResource;
			 			var top:int = Application.application.height - drawnHeight - definition.tileHeight + startRowHeight;
			 			
			 			if (graphics != null)
			 			{			 							 			
				 			db.copyPixels(
				 				graphics.bitmap,
				 				graphics.drawRect, 
				 				new Point(
				 					col * definition.tileWidth, 
				 					top),
				 				graphics.bitmapAlpha, 
				 				new Point(
				 					graphics.drawRect.x, 
				 					graphics.drawRect.y), 
				 				true);
			 			}
			 				
			 			drawnWidth += definition.tileWidth;
			 			if (drawnWidth >= Application.application.width)
			 				break;
			 		}
			 		
			 		drawnWidth = 0;
			 		drawnHeight += definition.tileHeight;
			 		
			 		if (drawnHeight >= Application.application.height + definition.tileHeight)
			 			break;			 		
			 	}
			 	
			 	drawnHeight = 0;
		 	}
		}
	}
}