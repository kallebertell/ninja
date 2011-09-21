package com.kerebus.gn
{
	import com.kerebus.gn.object.Enemy;
	
	public interface IKillListener
	{
		function enemyKilled(enemy : Enemy) : void;
	}
}