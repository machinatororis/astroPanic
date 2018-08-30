package
{
	import flash.display.*;
	import flash.filters.GlowFilter;
	
	public class Bullet extends Sprite
	{
		public function Bullet()
		{
			var bullet:Sprite = new Sprite();
			addChild(bullet);
			
			bullet.graphics.lineStyle(2, 0xB22222, 1);
			bullet.graphics.drawCircle(0, 0, 4);
			bullet.graphics.endFill();
			var glow:GlowFilter=new GlowFilter(0xFF0000,1,6,6,2,2);
			bullet.filters=new Array(glow);
			this.addChild(bullet);
		}
	}
}