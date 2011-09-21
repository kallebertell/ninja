package com.kerebus.gn
{
	import com.kerebus.gn.object.AnimatedGameObject;
	import com.kerebus.gn.object.BackgroundLevelElement;
	import com.kerebus.gn.object.BaseObject;
	import com.kerebus.gn.object.BigEnemy;
	import com.kerebus.gn.object.Enemy;
	import com.kerebus.gn.object.TiledBackground;
	import com.kerebus.gn.object.Weapon;
	
	public class ObjectFactory
	{
		private var enemyResourcePool : ResourcePool = new ResourcePool(newEnemy);
		private var bigEnemyResourcePool : ResourcePool = new ResourcePool(newBigEnemy);
		
		private var weaponResourcePool : ResourcePool = new ResourcePool(newWeapon);
		private var tiledBackgroundResourcePool : ResourcePool = new ResourcePool(newTiledBackground);
		private var backgroundLevelElementResourcePool : ResourcePool = new ResourcePool(newBackgroundLevelElement);
		private var animatedGameObjectResourcePool : ResourcePool = new ResourcePool(newAnimatedGameObject);
	
		private var objectLifecycleListener : IObjectLifecyleListener;
		private var killListener : IKillListener;
		
		public function ObjectFactory(listener : IObjectLifecyleListener, killListener : IKillListener)
		{
			this.objectLifecycleListener = listener;
			this.killListener = killListener;
		}

		public function getEnemy() : Enemy {
			return enemyResourcePool.ItemFromPool as Enemy
		}
		
		public function getBigEnemy() : BigEnemy {
			return bigEnemyResourcePool.ItemFromPool as BigEnemy;
		}
		
		public function getWeapon() : Weapon {
			return weaponResourcePool.ItemFromPool as Weapon;
		}
		
		public function getTiledBackground() : TiledBackground {
			return tiledBackgroundResourcePool.ItemFromPool as TiledBackground;
		}
		
		public function getBackgroundLevelElement() : BackgroundLevelElement {
			return backgroundLevelElementResourcePool.ItemFromPool as BackgroundLevelElement;
		}
		
		public function getAnimatedGameObject() : AnimatedGameObject {
			return animatedGameObjectResourcePool.ItemFromPool as AnimatedGameObject;
		}
		
		public function get NumberOfActiveEnemies():int
		{
			var count:int = 0;
			
			for each (var item:BaseObject in enemyResourcePool)
			{
				if (item.inuse)
					++count;
			}
			
			return count;
		}
		
		// -----------------------------------------------------------
		// Private factory methods
		
		private function newEnemy() : Enemy {
			return new Enemy(objectLifecycleListener, killListener, this);
		}
		
		private function newBigEnemy() : BigEnemy {
			return new BigEnemy(objectLifecycleListener, killListener, this);
		}
		
		private function newWeapon() : Weapon {
			return new Weapon(objectLifecycleListener);
		}
		
		private function newTiledBackground() : TiledBackground {
			return new TiledBackground(objectLifecycleListener);
		}
		
		private function newBackgroundLevelElement() : BackgroundLevelElement {
			return new BackgroundLevelElement(objectLifecycleListener);			
		}
		
		private function newAnimatedGameObject() : AnimatedGameObject {
			return new AnimatedGameObject(objectLifecycleListener);
		}

	}
}