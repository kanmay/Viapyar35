package packageB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.json.JSONArray;
import org.json.JSONObject;

public class Statistics {
	
	BusinessFunctions bf = new BusinessFunctions();
	Connection conn;
	ResultSet rs;
	PreparedStatement pst;
	Statement smt;
	
	//getData userdata daywise
	JSONObject getDataOfCurrentMonth(int month){
		JSONArray label = new JSONArray();
		JSONArray googleUsers = new JSONArray();
		JSONArray facebookUsers = new JSONArray();
		JSONArray myUsers = new JSONArray();
		JSONArray seriesArray = new JSONArray();
		JSONObject data = new JSONObject();
		JSONObject Data = new JSONObject();
		
		JSONObject Series = new JSONObject();
		try{
			conn=bf.connect();

			String query = "SELECT DAY(DATE(rdate)) as forDay,"+
					       "SUM(FIELD(oauthprovider,'Google')) AS GoogleUsers,"+
					       "SUM(FIELD(oauthprovider,'Facebook')) AS FacebookUsers,"+
					       "SUM(FIELD(oauthprovider,'MyOrganization')) AS MyUsers "+ 
					       "FROM customer WHERE MONTH(rdate)="+month+
					       " GROUP BY DATE(rdate) ORDER BY forDay";
			
			smt=conn.createStatement();
			rs=smt.executeQuery(query);
			System.out.println("hiee");
			while(rs.next()){
				label.put(rs.getString("forDay"));
				googleUsers.put(rs.getInt("GoogleUsers"));
				facebookUsers.put(rs.getInt("FacebookUsers"));
				myUsers.put(rs.getInt("MyUsers"));
				
				
			}
			seriesArray.put(googleUsers);
			seriesArray.put(facebookUsers);
			seriesArray.put(myUsers);
			data.put("series",seriesArray);
			data.put("label",label);
			
			
			
			System.out.println(data);
			
			Data.put("Data",data);
			
			System.out.println(Data);
			
			
        return Data;
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace();
			return null;
			
		}
		
		
	}
	
	
	//get user data monthwise
	
	JSONObject getDataMonthWise(int year){
		JSONArray label = new JSONArray();
		JSONArray googleUsers = new JSONArray();
		JSONArray facebookUsers = new JSONArray();
		JSONArray myUsers = new JSONArray();
		JSONArray seriesArray = new JSONArray();
		JSONObject data = new JSONObject();
		JSONObject Data = new JSONObject();
		
		JSONObject Series = new JSONObject();
		try{
			conn=bf.connect();
			
			String query = "SELECT  MONTH(rdate) AS 'Month',"+
			                "SUM(oauthprovider='google') GoogleUsers,"+
			                "SUM(oauthprovider='Facebook')FacebookUsers,"+
			                "SUM(oauthprovider='MyOrganization') MyUsers "+
			                "FROM customer GROUP BY MONTH(rdate) ORDER BY 'Month';";
			
			smt=conn.createStatement();
			rs=smt.executeQuery(query);
			System.out.println("hiee");
			while(rs.next()){
				label.put(rs.getString("Month"));
				googleUsers.put(rs.getInt("GoogleUsers"));
				facebookUsers.put(rs.getInt("FacebookUsers"));
				myUsers.put(rs.getInt("MyUsers"));
				
				
			}
			seriesArray.put(googleUsers);
			seriesArray.put(facebookUsers);
			seriesArray.put(myUsers);
			data.put("series",seriesArray);
			data.put("label",label);
			
			
			
			System.out.println(data);
			
			Data.put("Data",data);
			
			System.out.println(Data);
			
			
        return Data;
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace();
			return null;
			
		}
		
		
	}
	
	//This sends Products stats daywise
	JSONObject getProductStatsDayWise(int month){
		JSONArray nlabel = new JSONArray();
		JSONArray wlabel = new JSONArray();
		JSONArray nseries = new JSONArray();
		JSONArray wseries = new JSONArray();
		JSONArray seriesArray = new JSONArray();
		JSONObject data = new JSONObject();
		JSONObject Data = new JSONObject();
		
		JSONObject Series = new JSONObject();
		try{
			conn=bf.connect();

			String query = "SELECT DAY(DATE(orderdate)) as forDay,"+
					       "COUNT(orderid) AS NumOfOrders from orderdetails WHERE MONTH(orderdate)="+month+ 
					       " GROUP BY forDay";
			
			smt=conn.createStatement();
			rs=smt.executeQuery(query);
			System.out.println("hiee");
			while(rs.next()){
				nlabel.put(rs.getInt("forDay"));
				nseries.put(rs.getInt("NumOfOrders"));
		    }
		try{	
		    String iquery = "SELECT DAY(DATE(orderdate)) as forDay,"+
		    		        "SUM(amount) AS Amount FROM orderdetails WHERE month(orderdate)="+month+ " group by forDay;";
		   
		    smt=conn.createStatement();
			rs=smt.executeQuery(iquery);
			System.out.println("hiee");
			while(rs.next()){
				wlabel.put(rs.getInt("forDay"));
				wseries.put(rs.getInt("Amount"));
			}	
		   
		}catch(Exception e){
			
		}
			data.put("Wlabel",wlabel);
			data.put("Wseries",wseries);
			data.put("Nlabel", nlabel);
			data.put("Nseries", nseries);
			
			Data.put("Data", data);
			System.out.println(Data);
				
        return Data;
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace();
			return null;
			
		}
		
		
		
		
	}

	
	//get data month wise
	
	JSONObject getProductDataMonthWise(int year){
		
		JSONArray nlabel = new JSONArray();
		JSONArray wlabel = new JSONArray();
		JSONArray nseries = new JSONArray();
		JSONArray wseries = new JSONArray();
		JSONArray seriesArray = new JSONArray();
		JSONObject data = new JSONObject();
		JSONObject Data = new JSONObject();
		
		JSONObject Series = new JSONObject();
		try{
			conn=bf.connect();

			String query = "SELECT MONTH(orderdate) AS 'Month',"+
					       "COUNT(orderid) AS NumOfOrders FROM orderdetails WHERE YEAR(orderdate)="+year+
					       " GROUP BY MONTH(orderdate) ORDER BY 'Month';";
			
			smt=conn.createStatement();
			rs=smt.executeQuery(query);
			System.out.println("hiee");
			while(rs.next()){
				nlabel.put(rs.getInt("Month"));
				nseries.put(rs.getInt("NumOfOrders"));
		    }
		try{	
		    String iquery = "SELECT MONTH(orderdate) AS 'Month',"+
				            "SUM(amount) AS Amount FROM orderdetails WHERE YEAR(orderdate)="+year+
				            " GROUP BY MONTH(orderdate) ORDER BY 'Month';";
		   
		    smt=conn.createStatement();
			rs=smt.executeQuery(iquery);
			System.out.println("hiee");
			while(rs.next()){
				wlabel.put(rs.getInt("Month"));
				wseries.put(rs.getInt("Amount"));
			}	
		   
		}catch(Exception e){
			
		}
			data.put("Wlabel",wlabel);
			data.put("Wseries",wseries);
			data.put("Nlabel", nlabel);
			data.put("Nseries", nseries);
			
			Data.put("Data", data);
			System.out.println(Data);
				
        return Data;
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace();
			return null;
			
		}
		
	}
	
	public static void main(String[] args){
		Statistics st = new Statistics();
		System.out.println("hiee");
		st.getProductDataMonthWise(2017);
	}

}
