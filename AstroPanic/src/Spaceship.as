package
{
	import flash.display.*;
		
	public class Spaceship extends Sprite
	{
		[Embed(source="img/rocket.png")] private const pictureRocket: Class;
		
		public function Spaceship()
		{
			var rocketSprite:Sprite = new Sprite();
			var rocket:Bitmap = new pictureRocket() as Bitmap;	
			rocket.x = 0;
			rocket.y = 0;
			this.addChild(rocket);
		}
	}
}