package helper
{
	import flash.display.BitmapData;
	import flash.display.JPEGEncoderOptions;
	import flash.display.PNGEncoderOptions;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import flash.utils.getTimer;

	/**
	 * Copyright 2016. All rights reserved.
	 *
	 * @author Sebastian Erb
	 *
	 */
	public final class Image_helper
	{
		private static const DEFAULT_QUALITY:uint = 80;

		/**
		 *
		 * @param p_bitmapdata
		 * @return
		 */
		public static function jpeg(p_bitmapdata:BitmapData):ByteArray
		{
			var t:int = getTimer();
			var ba:ByteArray = p_bitmapdata.encode(new Rectangle(0, 0, p_bitmapdata.width, p_bitmapdata.height), new JPEGEncoderOptions(DEFAULT_QUALITY), ba);
			return ba;
		}

		/**
		 *
		 * @param p_bitmapdata
		 * @return
		 */
		public static function png(p_bitmapdata:BitmapData):ByteArray
		{
			var t:int = getTimer();
			var ba:ByteArray = p_bitmapdata.encode(new Rectangle(0, 0, p_bitmapdata.width, p_bitmapdata.height), new PNGEncoderOptions(true), ba);
			return ba;
		}
	}
}
