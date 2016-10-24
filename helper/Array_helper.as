package helper
{
	import flash.utils.ByteArray;

	/**
	 * Copyright 2016. All rights reserved.
	 *
	 * @author Sebastian Erb
	 *
	 */
	public final class Array_helper
	{

		/**
		 *
		 * @param p_arrays
		 * @return
		 */
		public static function flatten(p_arrays:Array):Array
		{
			var result:Array = [];

			for(var i:int = 0; i < p_arrays.length; i++)
			{
				result = result.concat(p_arrays[i]);
			}
			return result;
		}

		/**
		 *
		 * @param p_arrays
		 * @return
		 */
		public static function merge(p_arrays:Array):Array
		{
			var result:Array = [];

			for(var i:int = 0; i < p_arrays.length; i++)
			{
				result = result.concat(p_arrays[i]);
			}
			return result;
		}

		/**
		 *
		 * @param p_object
		 * @param p_array
		 * @return
		 */
		public static function push_from_object(p_object:Object, p_array:Array):Array
		{

			if(!p_object)
				return p_array;

			var newObject:Object;

			for each(var i:String in p_object)
			{
				newObject = {i: p_object[i]};
				p_array.push(newObject);
			}

			return p_array;
		}

		/**
		 *
		 * @param p_byteArray
		 * @return
		 */
		public static function fromByteArray(p_byteArray:ByteArray):Array
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
		 * @param array
		 * @param element
		 * @return
		 */
		public static function inArray(array:Array, element:*):Boolean
		{
			return (array.indexOf(element) >= 0);
		}

		/**
		 *
		 * @param p_hex
		 * @return
		 */
		public static function hexArrayToIntArray(p_hex:Array):Array
		{
			var intArray:Array;

			for(var i:uint = 0; i < p_hex.length; i++)
			{
				intArray.push(int(parseInt(p_hex[i], 16)));
			}
			return intArray;

		}

		/**
		 *
		 * @param p_int
		 * @return
		 */
		public static function intArraytoHexArray(p_int:Array):Array
		{
			var hexArray:Array;

			for(var i:uint = 0; i < p_int.length; i++)
			{
				hexArray.push((p_int[i] as int).toString(16));
			}
			return hexArray;

		}

		/**
		 * Geeignet bspw. für Vektoren
		 */
		public static function toArray(iterable:*):Array
		{
			var ret:Array = [];

			for each(var elem:Object in iterable)
			{
				ret.push(elem);
			}
			return ret;
		}
	}

}

