package helper
{
	import flash.globalization.DateTimeFormatter;
	import flash.globalization.DateTimeStyle;
	import flash.globalization.LocaleID;

	/**
	 * Copyright 2016. All rights reserved.
	 *
	 * @author Sebastian Erb
	 *
	 */
	public final class DateTime_helper
	{
		/**
		 *
		 * @default
		 */
		public static const DATE:String = "DATE";

		/**
		 *
		 * @default
		 */
		public static const DATENORMAL:String = "DATENORMAL";

		/**
		 *
		 * @default
		 */
		public static const DATETIME:String = "DATETIME";

		/**
		 *
		 * @default
		 */
		public static const LONGTIME:String = "LONGTIME";

		/**
		 *
		 * @default
		 */
		public static const SQLFORMAT:String = "SQLFORMAT";

		/**
		 *
		 * @default
		 */
		public static const TIME:String = "TIME";

		/**
		 *
		 * @param p_date
		 * @param p_type
		 * @return
		 */
		public static function formatDate(p_date:Date = null, p_type:String = SQLFORMAT):String
		{
			var formatter:DateTimeFormatter = new DateTimeFormatter(LocaleID.DEFAULT, DateTimeStyle.SHORT, DateTimeStyle.NONE);
			var formatpattern:String = "";
			var formattedstring:String = "";

			switch(p_type)
			{
				case DATE:
					formatpattern = "yyyy-MM-dd";
					break;
				case TIME:
					formatpattern = "HH:mm";
					break;
				case LONGTIME:
					formatpattern = "HH:mm:ss";
					break;
				case DATETIME:
				case SQLFORMAT:
					formatpattern = "yyyy-MM-dd HH:mm:ss";
					break;
				case DATENORMAL:
					formatpattern = "dd.MM.yyyy";
					break;
				default:
					formatpattern = "yyyy-MM-dd HH:mm:ss";
					break;
			}

			if(p_date == null)
			{
				p_date = new Date;
			}

			formatter.setDateTimePattern(formatpattern);
			formattedstring = formatter.format(p_date);

			return formattedstring;
		}

		/**
		 *
		 * @param p_date
		 * @return
		 */
		public static function dateFromMySqlFormat(p_date:String):Date
		{
			var date:Date;
			var sp:Array = p_date.split(" ");

			if(sp.length == 2)
			{
				var d:Array = sp[0].toString().split("-");
				var t:Array = sp[1].toString().split(":");

				if(d.length == 3 && t.length == 3)
				{
					date = new Date();
					date.setFullYear(d[0], int(d[1] - 1), int(d[2]));
					date.setHours(int(t[0]), int(t[1]), int(t[2]), 0);
				}
			}
			else
			{
				date = new Date(Date.parse(p_date));
			}

			return date;
		}
	}

}

