package
{
	import flash.display.*;
	
	public class Enemy extends Sprite
	{
		[Embed(source="img/ufo.png")] private const pictureEnemy: Class;
		
		public function Enemy()
		{
			var enemySprite:Sprite = new Sprite();
			var enemy:Bitmap = new pictureEnemy() as Bitmap;	
			enemy.x = 0;
			enemy.y = 0;
			this.addChild(enemy);
		}
	}
}