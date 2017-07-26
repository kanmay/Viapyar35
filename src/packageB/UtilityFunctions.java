package packageB;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.json.JSONObject;

public class UtilityFunctions {
	
	String mySearchString(String userQuery){
		
		String mySearch="";
		
		String[] s1=userQuery.split("\\~");
		String s2=s1[0].replaceAll("in ","");
		
		String[] words=s2.split("\\s");
		
		for(int i=0;i<=words.length-2;i++){  
			
			mySearch=mySearch+words[i]+" AND ";
			
			System.out.println("aaa");
		    System.out.println("aaaaahhhhhhh  "+s1);
			
		}  
		
		int size = words.length;
		System.out.println("my size is:"+size);
		
		System.out.println("hhhh");
	    System.out.println("bbbbbhhhhhhhhhhh  "+s1);
		
		mySearch= mySearch+" "+words[size-1];

		System.out.println(mySearch);
		
		
		return mySearch;
	}
	
	String getDeliveryDate(){
		Date date = new Date(Calendar.getInstance().getTimeInMillis()+86400000);
	    DateFormat formatter = new SimpleDateFormat("EEE, d MMM");
	    //System.out.println(formatter.format(date));
	    return formatter.format(date);
	}
	
	String EmailBuilder(JSONObject ItemsOrdered,int amount){
		
		try{
			int size;
			size=ItemsOrdered.getJSONArray("ItemsOrdered").length();
			
			String msg= "<html>"+
					"<head>"+
					"<style>"+
					"#whole"+
					"{"+
					"background-color:pink;"+
					"padding:10px;"+
					"}"+
					"div.card {"+
					"background-color:#F8F8F8;"+
					  "width: 97%;"+
					  
					  "box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);"+
					  "padding:5px;}#image1{width:40%;}"+
					"#success{color: green;}"+
			        "table, td, th {"+    
					    "border: 1px solid #ddd;"+
					    "text-align: left;"+
					    "}"+

					"table {"+
					    "border-collapse: collapse;"+
					    "width: 100%;"+
					"}"+

					"th, td {"+
					    "padding: 15px;"+
					"}"+
					"#regards{"+
					"color:white;}"+
					"#shoper{"+
					"color:white;}"+
					".button {"+
					"background-color: white;"+
					"border: none;"+
					"color: blue;"+
					"padding: 15px 32px;"+
					"text-align: center;"+
					"text-decoration: none;"+
					"display: inline-block;"+
					"font-size: 16px;"+
					"margin: 4px 2px;"+
					"cursor: pointer;"+
					"-webkit-transition-duration: 0.4s; /* Safari */"+
					    "transition-duration: 0.4s;"+
					"}"+
					".button1 {"+
					    "box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);"+
					"}"+
					"</style>"+
					"</head>"+
					"<body bgcolor='pink'>"+
					"<div id='whole'>"+
					"<img src='http://viapyarrr.tk/ViapyarLogo.png' id='image1'>"+
					"<center>"+

					"<div class='card'>"+
					"<center>"+
					"<i><h2 style='color:green' id='success'>Your order has been successfully placed.</h2></i>"+
				
					"</center>"+
					"<h3>Your Orders : </h3>"+

					"<table>"+
					  "<tr>"+
					    "<th>OrderId</th>"+
					    "<th>Product Name</th>"+
					    "<th>Quantity</th>"+
					    "<th>Amount</th>"+
					    "<th>Expected Delivery</th>"+
					  "</tr>";
					  //start loop here; 
			 
			for(int i=0;i<size;i++){
				msg+="<tr>"+
						"<td>#"+((JSONObject) ItemsOrdered.getJSONArray("ItemsOrdered").get(i)).get("RanOrderId")+"</td>"+
					    "<td>"+((JSONObject) ItemsOrdered.getJSONArray("ItemsOrdered").get(i)).get("product")+"</td>"+
					    "<td>"+((JSONObject) ItemsOrdered.getJSONArray("ItemsOrdered").get(i)).get("quantity")+"</td>"+
					    "<td>&#8377; "+((JSONObject) ItemsOrdered.getJSONArray("ItemsOrdered").get(i)).get("actualPrice")+"</td>"+
						"<td>"+((JSONObject) ItemsOrdered.getJSONArray("ItemsOrdered").get(i)).get("deliveryDate")+"</td>"+
					  "</tr>";
					  
			
				
		        }
					  
					 
						
					//end loop here;  
					  
				msg+=	"</table>"+

					"<h3>Amount To Be Paid: &#8377;"+amount+"</h3>"+

					"</div>"+
					"</center>"+
					"<div>"+
					"<h4 id='regards'>&nbsp;Regards,</h4>"+
					"<h3 id='shoper'>&nbsp;Sewaram sweets</h3>"+
					"</div>"+
					"<center>"+
					"<a href='http://www.sewaramsweets.com'><button class='button button1'>Go For Shopping &gt; &gt;</button></a>"+
					"</center>"+
					"</div>"+
					"</div></body>"+
					"</html>";

			
			return msg;

			
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}
		
				
	}
	
 static	String messageBuilder(JSONObject ItemsOrdered,int amount){
		
		try{
			int size=ItemsOrdered.getJSONArray("ItemsOrdered").length();
			
			String message="Dear Customer, Your order/s with ";
			
			for(int i=0;i<size;i++){
				message+=",Order Id: "+((JSONObject) ItemsOrdered.getJSONArray("ItemsOrdered").get(i)).get("RanOrderId")+
						" referring to "+((JSONObject) ItemsOrdered.getJSONArray("ItemsOrdered").get(i)).get("product");
			}
			
			message+=" worth Rs."+amount+" has been Successfully placed and will be delivered by "+
			         ((JSONObject) ItemsOrdered.getJSONArray("ItemsOrdered").get(0)).get("deliveryDate");
			
			return message;
			
		}catch(Exception e){
			return "error";
		}
		
	}
	
	public static void main(String[] args){
		
		UtilityFunctions uf=new UtilityFunctions();
		uf.mySearchString("Apple in i watch ~appl");
	}

}
