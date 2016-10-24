package helper
{
	import flash.utils.ByteArray;
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	/**
	 * Copyright 2016. All rights reserved.
	 *
	 * @author Sebastian Erb
	 *
	 */
	public class Object_helper
	{

		/**
		 *
		 * @param p_source
		 * @return
		 */
		public static function clone(p_source:Object):*
		{
			var myBA:ByteArray = new ByteArray();
			myBA.writeObject(p_source);
			myBA.position = 0;
			return (myBA.readObject());
		}

		/**
		 * Returns clone of provided object.
		 * @param    source
		 * @return    Cloned object
		 */
		public static function clone2(source:Object):Object
		{
			var retVal:Object;

			if(source)
			{
				retVal = createEmptyClass(source);

				if(retVal)
				{
					copyData(source, retVal);
				}
			}
			return retVal;
		}

		/**
		 * Creates empty class of same type as provided object.
		 * @param    sourceObj    object to create empty class from.
		 * @return    new empty class.
		 */
		public static function createEmptyClass(sourceObj:Object):*
		{
			var retVal:*;

			if(sourceObj)
			{
				try
				{
					var classOfSourceObj:Class = getDefinitionByName(getQualifiedClassName(sourceObj)) as Class;
					retVal = new classOfSourceObj();
				}
				catch(error:Error)
				{
					trace("ObjectHelper ERROR !!! failed to create new empty class[type:" + classOfSourceObj + "] out of object.[object:" + sourceObj + "]");
				}
			}
			return retVal;
		}

		/**
		 * Copies data from one object to another.
		 * @param    source        copy data to this object.
		 * @param    destination    copy data from this object.
		 */
		// TODO : add neste object, arrays, vector support.
		/**
		 *
		 * @param source
		 * @param destination
		 */
		public static function copyData(source:Object, destination:Object):void
		{
			//copies data from commonly named properties and getter/setter pairs
			if((source) && (destination))
			{
				try
				{
					var sourceInfo:XML = describeType(source);
					var prop:XML;

					for each(prop in sourceInfo.variable)
					{

						if(destination.hasOwnProperty(prop.@name))
						{
							destination[prop.@name] = source[prop.@name];
						}
					}

					for each(prop in sourceInfo.accessor)
					{
						if(prop.@access == "readwrite")
						{
							if(destination.hasOwnProperty(prop.@name))
							{
								destination[prop.@name] = source[prop.@name];
							}

						}
					}
				}
				catch(error:Error)
				{
					trace("ObjectHelper ERROR !!! failed to copy data from[" + source + "] to [" + destination + "]. error:" + error);
				}
			}
		}

		/**
		 *
		 * @param obj
		 * @param useIndent
		 * @return
		 */
		public static function getTraceString(obj:Object, useIndent = false):String
		{
			return traceObject(obj, "", useIndent);
		}

		/**
		 *
		 * @param obj
		 * @param identStr
		 * @param useIndent
		 * @return
		 */
		private static function traceObject(obj:Object, identStr:String, useIndent:Boolean):String
		{
			var retVal:String = "";

			if(obj is String)
			{
				retVal = obj as String;
			}
			else if(obj is Boolean || obj is int || obj is uint || obj is Number)
			{
				retVal = obj.toString();
			}
			else
			{
				retVal += "{";
				var isFirst:Boolean = true;

				for(var id:String in obj)
				{
					if(isFirst)
					{
						isFirst = false;
					}
					else
					{
						retVal += ", ";
					}
					retVal += id + ":" + traceObject(obj[id], identStr, useIndent);
				}
				retVal += "}";
			}
			return retVal;
		}

		/**
		 *
		 */
		public function Object_helper()
		{
		}
	}
}
