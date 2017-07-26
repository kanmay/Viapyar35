package packageB;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import packageB.Customer;

import java.util.UUID;





public class BusinessFunctions {
	
	Configuration c = new Configuration();
	
	static Connection conn = null;
	static ResultSet rs = null;
	static PreparedStatement pst = null;
	static Statement smt = null;
	
	String JDBC_DRIVER = c.JDBC_DRIVER;
	String DB_URL = c.DB_URL;
	
	String USER = c.USER;
	String PASS = c.PASS;
	
	//function that creates connection to database
	public Connection connect(){
      
		try{
			//Registering jdbc driver
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver Loading...");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			System.out.println("Successfully Connected to Database");
			return conn;
		}catch(SQLException se){
			se.printStackTrace();
			System.out.println("Error in connecting: "+se.getMessage());
			return null;
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("error "+e.getMessage());
			return null;
		}
	}
	
	
	
	//Checks if user exist
	public boolean checkUser(String userid,String password){
		
		
		try{
			conn = connect();
			String query = "SELECT * FROM customer WHERE email = '"+userid +"' AND password = '"+password+"';"; 
			
			smt = conn.createStatement();
			
			rs = smt.executeQuery(query);
			
			rs.last();
			if(rs.getRow()==1){
				
				return true;
			}
			else return false;
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
			return false;
			
		}finally{
		    try { if (rs != null) rs.close(); } catch (Exception e) {};
			   
		    try { if (conn != null) conn.close(); } catch (Exception e) {};
		    
		    try{ if (smt != null) smt.close();} catch(Exception e){}
		
	}
		
	}
	
	//Function to get last row values(productid mainly)
	
	 public  int getLastRowValue() {
		
		
		
		int pid=0;
	 try{
		 conn = connect();
		 String query = "SELECT * FROM products ORDER BY productId DESC LIMIT 1";
		 smt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		 rs = smt.executeQuery(query);
		 rs.afterLast();
		 while(rs.previous()){
			  
			 pid = rs.getInt("productId");
			 if(!(pid>=1)){
				 pid=0;
			 }
			 
			 
		 }
		// System.out.println(pid+"we");
		 
		 return pid;
		 
	 }catch(Exception e){
		 System.out.println("heya");
		 System.out.println("Error "+e.getMessage());
		 e.printStackTrace();
		 return 404;
		 
		 
		 
	 }finally {
			    try { if (rs != null) rs.close(); } catch (Exception e) {};
			    try { if (smt != null) smt.close(); } catch (Exception e) {};
			    try { if (conn != null) conn.close(); } catch (Exception e) {};
			}
	}
	
	 
	public boolean OAuserExists(String email){
		
		int count=0;
		
		try{
			conn=connect();
			String query = "SELECT * FROM customer WHERE email=?";
			pst=conn.prepareStatement(query);
			pst.setString(1, email);
			rs=pst.executeQuery();
			while(rs.next()){
				++count;
				
			}
			
			if(count==1){
				return true;
			}
			else{
				return false;
			}
		}catch(Exception e){
			System.out.println("Error is: "+e.getMessage());
			e.printStackTrace();
			return false;
		}finally{
			
			try { if (rs != null) rs.close(); } catch (Exception e) {};
		    try { if (pst != null) pst.close(); } catch (Exception e) {};
		    try { if (conn != null) conn.close(); } catch (Exception e) {};
			
		}
		
	}
	
	//This generates a random 32 digit password for OAuthUsers
   String randomPassword(){
	String uuid = UUID.randomUUID().toString().replaceAll("-","");
	System.out.println("uuid = " + uuid);
	return uuid;
	}
	 
	 //This returns current Month
   int getCurrentMonth(){
	   
	    java.util.Date date= new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int month = cal.get(Calendar.MONTH)+1;
		System.out.println("month is "+month);
	    return month;
	    
   }
   
   //This function changes Order Status to Shipped
   void updateProductStatusToShipped(int orderId){
		
		try{
			conn = connect();
			String query = "UPDATE orderdetails SET orderStatus='Shipped' WHERE orderId=?";
			pst = conn.prepareStatement(query);
			pst.setInt(1,orderId);
			pst.executeUpdate();
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace();
			
		}finally{
			    try { if (pst != null) pst.close(); } catch (Exception e) {};
			   
			    try { if (conn != null) conn.close(); } catch (Exception e) {};
			
			
		}
		
	}
   
   //this function changes Order Status to Delivered
   void updateProductStatusToDelivered(int orderId){
		
		try{
			conn = connect();
			String query = "UPDATE orderdetails SET orderStatus='Delivered' WHERE orderId=?";
			pst = conn.prepareStatement(query);
			pst.setInt(1,orderId);
			pst.executeUpdate();
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace();
			
		}finally{
			    try { if (pst != null) pst.close(); } catch (Exception e) {};
			   
			    try { if (conn != null) conn.close(); } catch (Exception e) {};
			
			
		}
		
	}
   
   //get items in Cart
   
   int getCountOfCartItems(int customerId){
	   
	   int itemsInCart=0;
	   try{
			 conn = connect();
			 String query = "SELECT Count(*) AS items FROM cart INNER JOIN products "+
                            "ON products.productId = cart.productId AND "+
					        "cart.customerId = ?;";
			 pst = conn.prepareStatement(query);
			 pst.setInt(1,customerId);
			 rs=pst.executeQuery();
			 
			 while(rs.next()){
				  
				 itemsInCart=rs.getInt("items");
				 
				 System.out.println("num is:" +itemsInCart);
				 
			 }
			// System.out.println(pid+"we");
			 
			
			 
		 }catch(Exception e){
			 System.out.println("heya");
			 System.out.println("Error "+e.getMessage());
			 e.printStackTrace();
			
			 
			 
			 
		 }finally {
			 
				    try { if (rs != null) rs.close(); } catch (Exception e) {};
				    try { if (pst != null) pst.close(); } catch (Exception e) {};
				    try { if (conn != null) conn.close(); } catch (Exception e) {};
				    return itemsInCart;
				    
				}
	  
   }
   public void flush(){
		
		
	   try{
			conn = connect();
			String query = "flush hosts;";
			smt = conn.createStatement();
		
			smt.execute(query);
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace();
			
		}finally{
			    try { if (pst != null) pst.close(); } catch (Exception e) {};
			   
			    try { if (conn != null) conn.close(); } catch (Exception e) {};
			
			
		}
		
	}
	
	
	
	public static void main(String args[]){
		
	 BusinessFunctions bf=new BusinessFunctions();
	 bf.getCountOfCartItems(99);
	 bf.flush();
	}

	
	
}
