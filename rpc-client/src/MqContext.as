package
{
	import flash.utils.ByteArray;
  
	[Embed(source="/mqContext.xml", mimeType="application/octet-stream")]
	public class MqContext extends ByteArray
	{
		public function getXML():XML
		{
			var xml:XML = new XML(readUTFBytes(length));
			return xml;
		}
	}
}
