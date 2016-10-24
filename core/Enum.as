package core
{
	import flash.utils.describeType;

	/**
	 * Copyright 2016. All rights reserved.
	 *
	 * @author Sebastian Erb
	 *
	 * <br /><br />USAGE:<br />
	 * <code>package myProject.constants {<br />
	 * import utils.types.Enum;<br />
	 * public class ScreenIdEnum {<br />
	 * {Enum.init(ScreenIdEnum);}<br />
	 * public static const START:Enum = new Enum();<br />
	 * }<br />
	 * }</code>
	 *
	 */
	public class Enum
	{

		/**
		 *
		 * @param enumClass
		 */
		public static function init(enumClass:Class):void
		{
			var type:XML = describeType(enumClass);

			for each(var constant:XML in type.constant)
			{
				enumClass[constant.@name].enumName = constant.@name;
			}
		}

		public var enumName:String = "Add  '{Enum.initEnumConstants(<class>);}' to you Enum class."

		/**
		 *
		 * @return
		 */
		public function toString():String
		{
			return enumName;
		}
	}
}
