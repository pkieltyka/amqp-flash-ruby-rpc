package
{
	import com.adobe.serialization.json.JSON;
  
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;

	import org.amqp.patterns.Serializer;
	
	
	public class JSONSerializer implements Serializer
	{
		
		public function serialize(o:*, stream:IDataOutput):void {
			stream.writeUTFBytes(JSON.encode(o));
			//stream.writeUTFBytes(o);
		}
	    
		public function deserialize(stream:IDataInput):* {
			return JSON.decode(stream.readUTFBytes(stream.bytesAvailable));
			//return stream.readUTFBytes(stream.bytesAvailable);
		}

	}
}
