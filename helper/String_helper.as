package helper
{

	public class String_helper
	{
		public static function getValidFileNameString(p_string:String):String
		{
			// folgende Sonderzeichen in Dateinamen nicht erlauben:
			var validChars:Array = p_string.match(/[^!¡?¿ "¨#$%&'´()*+.,;:=\^\\\/{}[]|<>~¢©®ª£¤¥¦§«»¬¯°º±¹²³µ¶·×Ø÷-]+/g);
			return validChars.join("");
		}
	}
}
