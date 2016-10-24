package helper
{
	import flash.system.Capabilities;

	/**
	 * Copyright 2016. All rights reserved.
	 *
	 * @author Sebastian Erb
	 *
	 */
	public final class Capabilities_helper
	{

		/**
		 *
		 * @return
		 */
		public static function get APPNAME():String
		{
			if(_appname == null)
				_appname = appXml.ns::name;

			return _appname;
		}

		/**
		 *
		 * @return
		 */
		public static function get APPVERSION():String
		{
			if(_appversion == null)
				_appversion = appXml.ns::versionNumber

			return _appversion;
		}

		/**
		 *
		 * @return
		 */
		public static function get DEVICE():String
		{
			if(_platform.indexOf("ios") > -1)
			{
				return DEVICE_IOS;
			}
			else if(_platform.indexOf("and") > -1)
			{
				return DEVICE_ANDROID;
			}
			else if(_platform.indexOf("win") > -1)
			{
				return DEVICE_WINDOWS;
			}
			else if(_platform.indexOf("mac") > -1)
			{
				return DEVICE_OSX;
			}

			return DEVICE_UNDEFINED;
		}

		public static const DEVICE_ANDROID:String = "ANDROID";

		public static const DEVICE_IOS:String = "IOS";

		public static const DEVICE_OSX:String = "MACOSX";

		public static const DEVICE_UNDEFINED:String = "UNDEFINED";

		public static const DEVICE_WINDOWS:String = "WINDOWS";

		/**
		 *
		 * @param p_xml
		 */
		public static function set appXML(p_xml:XML):void
		{
			_appxml = p_xml;
		}

		private static var _appname:String;

		private static var _appversion:String;

		private static var _appxml:XML;

		private static var _operatingSystem:String = Capabilities.os.toLowerCase();

		private static var _platform:String = Capabilities.version.toLowerCase();

		/**
		 *
		 * @return
		 */
		private static function get appXml():XML
		{
			return _appxml
		}

		private static var _ns:Namespace;

		/**
		 *
		 * @return
		 */
		private static function get ns():Namespace
		{
			if(_ns == null)
				_ns = appXml.namespace();

			return _ns;
		}

		/**
		 *
		 * @return
		 */
		public static function isAndroid():Boolean
		{
			return DEVICE == DEVICE_ANDROID;
		}

		/**
		 *
		 * @return
		 */
		public static function isWindows():Boolean
		{
			return DEVICE == DEVICE_WINDOWS;
		}

		/**
		 *
		 * @return
		 */
		public static function isMobile():Boolean
		{
			return DEVICE == DEVICE_ANDROID || DEVICE == DEVICE_IOS;
		}

		/**
		 *
		 * @return
		 */
		public static function isMac():Boolean
		{
			return DEVICE == DEVICE_OSX;
		}

		/**
		 *
		 * @return
		 */
		public static function isIOS():Boolean
		{
			return DEVICE == DEVICE_IOS;
		}

		/**
		 *
		 * @return
		 */
		public static function isDesktop():Boolean
		{
			return isWindows() || isMac();
		}

		public static function isSimulator():Boolean
		{
			return isMobile() && (_operatingSystem.indexOf("windows") != -1 || _operatingSystem.indexOf("mac os") != -1);
		}
	}
}

