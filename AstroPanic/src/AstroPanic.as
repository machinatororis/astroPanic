package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flashx.textLayout.formats.BackgroundColor;

	public class AstroPanic extends Sprite
	{
		private const BULLET_SPEED:uint = 10;		// кол-во пикселей, которые пуля будет летeть на каждом кадре
		
		private var baseWidth:Number = 800;
		private var baseHeight:Number = 600;
		private var WIDTH: int = stage.stageWidth;	// ширина сцены
		private var HEIGHT: int = stage.stageHeight;// высота сцены
		
		private var commonSprite: Sprite;			// общий слой
		private var bgSprite: Sprite;				// слой для бекграунда
		private var fieldSprite: Sprite;			// слой для игрового поля
		private var interfaceSprite: Sprite;		// слой для интерфейса
		private var spaceshipSprite: Sprite;		// спрайт spaceship
		
		private var background:Background;
		private var spaceship:Spaceship;
		private var bullet:Bullet;
		
		private var isFiring:Boolean = false;		// стреляет ли корабль
		
		public function AstroPanic() 
		{
			commonSprite = new Sprite();
			fieldSprite = new Sprite();
			spaceshipSprite = new Sprite();
			bgSprite = new Sprite();

			spaceship = new Spaceship();
			//bullet = new Bullet();
			background = new Background();
			addChild(commonSprite);
			stage.addEventListener(Event.RESIZE, onResize);
			commonSprite.addChild(bgSprite);
			bgSprite.addChild(background);
			commonSprite.addChild(fieldSprite);
			fieldSprite.addChild(spaceshipSprite);
			spaceshipSprite.addChild(spaceship);
			//spaceshipSprite.addChild(bullet);
			placeSpaceship();
			placeBullet();
			spaceshipSprite.addEventListener(Event.ENTER_FRAME, onEnterFrm);
			addEventListener(MouseEvent.CLICK, onMouseClick);
		}
		

		
		private function placeSpaceship():void		// начальное размещение корабля
		{
			spaceshipSprite.x = ((WIDTH / 2) - (spaceship.width / 2));
			spaceshipSprite.y = (HEIGHT - (spaceship.height));
		}
		
		private function placeBullet():void		// начальное размещение пули
		{
			bullet = new Bullet();
			bullet.x = spaceship.width / 2;
			bullet.y = 0;
			spaceshipSprite.addChild(bullet);
		}
		
		protected function onResize(event:Event):void
		{
			var realWidth:Number = stage.stageWidth;
			var realHeight:Number = stage.stageHeight;
			var sx:Number = realWidth / this.baseWidth;
			var sy:Number = realHeight / this.baseHeight;
			trace("resize");
			
			if (baseWidth / baseHeight >= realWidth / realHeight)
			{//landscape
				commonSprite.scaleX = commonSprite.scaleY = sx;
				bgSprite.scaleX = sx;
				bgSprite.scaleY = sy;
				commonSprite.x = Math.floor((realWidth - this.baseWidth * sx) / 2);
				commonSprite.y = Math.floor((realHeight - this.baseHeight * sx) / 2);
			}
			else 
			{//portrait
				commonSprite.scaleX = commonSprite.scaleY = sy;
				bgSprite.scaleX = sx;
				bgSprite.scaleY = sy;
				commonSprite.x = Math.floor((realWidth - this.baseWidth * sy) / 2);
				commonSprite.y = Math.floor((realHeight - this.baseHeight * sy) / 2);
			}
		}

		private function onEnterFrm(e:Event):void 
		{
			spaceshipSprite.x = mouseX;
			if (spaceshipSprite.x < 0) 
			{
				spaceshipSprite.x = spaceship.width / 2;
			}
			
			if (spaceshipSprite.x > WIDTH - spaceshipSprite.width) 
			{
				spaceshipSprite.x = WIDTH - spaceshipSprite.width;
			}
			
			if (isFiring) 
			{
				bullet.y -= BULLET_SPEED;
				
				if (bullet.y < -(HEIGHT - (spaceship.height))) 
				{
					spaceshipSprite.removeChild(bullet);
					isFiring = false;
					placeBullet();
				}
			}
		}
		
		protected function onMouseClick(event:MouseEvent):void
		{
			if (isFiring)	return;
			{
				isFiring = true;
			}
		}
		

	}
}