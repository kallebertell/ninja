package com.kerebus.gn
{
	import com.kerebus.gn.object.Enemy;
	
	import flash.display.Graphics;
	
	import mx.controls.Text;
	
	public class ScoreBoard extends Text
	{
		private var killCounter : int = 0;
		
		public function ScoreBoard()
		{
		}
		

		public function drawScore(graphics : Graphics) : void {
		}

		public function addKill(enemy : Enemy) : void {
			killCounter++;
			this.text = ""+killCounter;
		}
		
		public function reset() : void {
			killCounter = 0;
			this.text = ""+killCounter;
		}
	}
}