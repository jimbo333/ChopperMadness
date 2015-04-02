package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.events.Event;
	
	
	public class Animation extends Sprite
	{
		private var _sourceData:BitmapData;
		private var _animBitmapData:BitmapData;
		private var _area:Rectangle;
		private var _rows:int;
		private var _cols:int;
		private var _frames:int;
		private var _frameWidth:int;
		private var _frameHeight:int;
		private var currentFrame:int;
		private var animating:Boolean;
		private var _startFrame:int;
		
		public function Animation(spriteSheet:Bitmap, rows:int, cols:int, frames:int, frameWidth:int, frameHeight:int, startFrame:int = 0) 
		{
			_sourceData = spriteSheet.bitmapData;
			_animBitmapData = new BitmapData(frameWidth, frameHeight);
			_area = new Rectangle(0, 0, frameWidth, frameHeight);
			
			var bmp:Bitmap = new Bitmap();
			bmp.bitmapData = _animBitmapData;
			addChild(bmp);
			
			_rows = rows;
			_cols = cols;
			_frames = frames;
			_frameWidth = frameWidth;
			_frameHeight = frameHeight;
			currentFrame = startFrame;
			addEventListener(Event.ENTER_FRAME, loop);
			animating = false;
			_startFrame = startFrame;			
		}		
		private function loop(e:Event):void 
		{
			if (animating)
			{
				showFrame(currentFrame);
				currentFrame++;
				if (currentFrame == _frames) currentFrame = _startFrame;
			}
		}		
		public function animate():void
		{
			animating = true;
		}
		private function showFrame(frame:int ):void
		{
			if (frame >= _frames)throw new Error("frame out of bounds");
			_area.x = frame % _cols * _frameWidth;
			_area.y = Math.floor(frame / _cols) * _frameHeight;			
			_animBitmapData.copyPixels(_sourceData, _area, new Point(0,0));	
		}
	}
}