package
{	
	import flash.display.*;
	
	public class Background extends Sprite
	{
		[Embed(source="img/bg.png")] private const pictureBg: Class;
		
		public function Background()
		{
			var bgSprite:Sprite = new Sprite();
			var bg:Bitmap = new pictureBg() as Bitmap;	
			bg.x = 0;
			bg.y = 0;
			this.addChild(bg);
		}
	}
}