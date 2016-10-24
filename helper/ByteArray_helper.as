package helper
{
	import flash.utils.ByteArray;

	/**
	 * Copyright 2016. All rights reserved.
	 *
	 * @author Sebastian Erb
	 *
	 */
	public class ByteArray_helper
	{

		/**
		 *
		 * @param p_byteArray
		 * @return
		 */
		public static function toArray(p_byteArray:ByteArray):Array
		{

			var arr:Array = new Array(), b:int = 0;
			p_byteArray.position = 0;

			while(p_byteArray.bytesAvailable)
			{
				b = p_byteArray.readUnsignedByte();
				arr.push(b);
			}

			return arr;
		}

		/**
		 *
		 * @param p_string
		 * @param p_delimiter
		 * @return
		 */
		public static function fromDelimitedString(p_string:String, p_delimiter:String = " "):ByteArray
		{
			return fromArray(p_string.split(p_delimiter));
		}

		/**
		 *
		 * @param p_array
		 * @return
		 */
		public static function fromArray(p_array:Array):ByteArray
		{
			var ba:ByteArray = new ByteArray(), //
				len:uint = p_array.length, //
				i:uint = 0;

			for(; i < len; i++)
			{
				ba.writeByte(p_array[i]);
			}

			return ba;
		}

		/**
		 *
		 */
		public function ByteArray_helper()
		{
		}
	}
}
