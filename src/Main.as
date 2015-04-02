package 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.ui.KeyboardType;
	
	/**
	 * ...
	 * @author erwin
	 */
	
	
	public class Main extends Sprite 
	{
		private var animations:Vector.<Animation>;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			
			
			animations = new Vector.<Animation>();
			for (var i:int = 0; i < 100; i++) 
			{
				//verander rows,frames,widht,height van de spritesheet waneer hij verandert wordt.
				var anim:Animation = new Animation(new SpriteSheet.TestSheet(),5,5, 25, 50, 50);
				addChild(anim);
				
				anim.x = Math.random() * stage.stageWidth;
				anim.y = Math.random() * stage.stageHeight;
				
				anim.animate();
				
				
			}
			
		}
		
		private var keyboard:KeyboardEvent;
		private var jumpPower:int;
		private var jumpStart:Number;
		private var jumping:Boolean;
		public var player:Object;
		
		private function OnKeyDown(event:KeyboardEvent):void {
			
			if (event.keyCode == Keyboard.SPACE)
			{
				if (!jumping)
				{
					//rotationSpeed = 0;
					jumpPower = 40;
					jumpStart = player.y;
					jumping = true;
				}
			}
		}
		private var gravity:Number;
		
		private function onUpdate (e:Event) :void 
		{
			player.y += gravity;
			
			if (jumping)
			{
				player.y -= jumpPower;
				jumpPower -= 2;
			}
			if (player.y + gravity < jumpStart)
			{
				player.y += gravity;
			}
			else
			{
				//player.y = ground.y - 50;
				jumping = false;
			}
			
		}

		
	}
	
}