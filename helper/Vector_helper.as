package helper
{

	/**
	 * Copyright 2016. All rights reserved.
	 *
	 * @author Sebastian Erb
	 *
	 */
	public final class Vector_helper
	{

		/**
		 *
		 * @default
		 */
		public static const DEFAULT_DELIMITER:String = "|";

		/**
		 *
		 * @param p_vector
		 * @param p_delimiter
		 * @return
		 */
		public static function stringify(p_vector:Vector.<int>, p_delimiter = DEFAULT_DELIMITER):String
		{

			if(!p_vector)
				return "";

			var string:String = "";
			var i:uint = 0;
			var length:uint = p_vector.length;

			for(i = 0; i < length; i++)
			{
				string += p_vector[i];

				if((i + 1) < length)
					string += "|";
			}
			return string;
		}

		/**
		 *
		 * @param p_string
		 * @param p_delimiter
		 * @return
		 */
		public static function unstringify(p_string:String, p_delimiter = DEFAULT_DELIMITER):Vector.<int>
		{

			if(!p_string)
				return new Vector.<int>();

			var vector:Vector.<int> = new Vector.<int>();
			var array:Array = p_string.split(p_delimiter);
			var i:uint = 0;
			var length:uint = array.length;

			for(i = 0; i < length; i++)
			{
				vector.push(array[i]);
			}

			return vector;
		}

		/**
		 *
		 * @param p_string
		 * @param p_filter
		 * @param p_delimiter
		 * @return
		 */
		public static function getIndicesByFilter(p_string:String, p_filter:String, p_delimiter = DEFAULT_DELIMITER):Vector.<int>
		{

			if(!p_string)
				return new Vector.<int>();

			var vector:Vector.<int> = new Vector.<int>();
			var array:Array = p_string.split(p_delimiter);
			var i:uint = 0;
			var length:uint = array.length;

			for(i = 0; i < length; i++)
			{
				if(array[i] == p_filter)
					vector.push(i);
			}

			return vector;

		}
	}

}

