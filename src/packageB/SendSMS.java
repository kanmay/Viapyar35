package packageB;
	import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import org.json.JSONObject;
	 
public class SendSMS {
	static UtilityFunctions uf=new UtilityFunctions();
	
		static public String sendSms(String phone,JSONObject ItemsOrdered,int amount) {
			try {
				// Construct data
				String apiKey = "apikey=" + "ZCf5DwVT9+Y-WS9q7ytYPlkxwjOXs10tA01yOoIiw5";
				String message = "&message=" + uf.messageBuilder(ItemsOrdered,amount) ;
				String sender = "&sender=" + "TXTLCL";
				String numbers = "&numbers=" + phone;
				
				// Send data
				HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
				String data = apiKey + numbers + message + sender;
				conn.setDoOutput(true);
				conn.setRequestMethod("POST");
				conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
				conn.getOutputStream().write(data.getBytes("UTF-8"));
				final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				final StringBuffer stringBuffer = new StringBuffer();
				String line;
				while ((line = rd.readLine()) != null) {
					stringBuffer.append(line);
				}
				rd.close();
				
				System.out.println("hie");
				
				return stringBuffer.toString();
			} catch (Exception e) {
				System.out.println("Error SMS "+e);
				return "Error "+e;
			}
		}
	
	
	
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
      
     // System.out.println(sendSms());
	}

}
