package packageB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Customer {
	
	
	
	int customerId;
	String OAuthProvider;
	String firstName;
	String lastName;
	String password;
	String address;
	String city;
	String zip;
	String state;
	String email;
	String phone;
	String rdate;
	String promo;
	String verificationStatus;
	
	
	
	
	public String getOAuthProvider() {
		return OAuthProvider;
	}




	public void setOAuthProvider(String oAuthProvider) {
		OAuthProvider = oAuthProvider;
	}




	public int getCustomerId() {
		return customerId;
	}




	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}




	public String getFirstName() {
		return firstName;
	}




	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}




	public String getLastName() {
		return lastName;
	}




	public void setLastName(String lastName) {
		this.lastName = lastName;
	}




	public String getPassword() {
		return password;
	}




	public void setPassword(String password) {
		this.password = password;
	}




	public String getAddress() {
		return address;
	}




	public void setAddress(String address) {
		this.address = address;
	}




	public String getCity() {
		return city;
	}




	public void setCity(String city) {
		this.city = city;
	}




	public String getZip() {
		return zip;
	}




	public void setZip(String zip) {
		this.zip = zip;
	}




	public String getState() {
		return state;
	}




	public void setState(String state) {
		this.state = state;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public String getPhone() {
		return phone;
	}




	public void setPhone(String phone) {
		this.phone = phone;
	}




	public String getRdate() {
		return rdate;
	}




	public void setRdate(String rdate) {
		this.rdate = rdate;
	}




	public String getPromo() {
		return promo;
	}




	public void setPromo(String promo) {
		this.promo = promo;
	}

    


	public String getVerificationStatus() {
		return verificationStatus;
	}




	public void setVerificationStatus(String verificationStatus) {
		this.verificationStatus = verificationStatus;
	}




	BusinessFunctions bf = new BusinessFunctions();
	
	static Connection conn = null;
	static ResultSet rs = null;
	static PreparedStatement pst = null;
	static Statement smt = null;
	
	
	
	
	//Inserts customer details in database
		public void insertIntoCustomer(String fname,String lname,String password,String address,String city,
				                       String zip,String state,String email,String phone,String promo){
			
		 try{	
			conn = bf.connect(); 
			String query = "Insert into customer(oauthprovider,fname,lname,password,address,city,zip,"+
			               "state,email,phone,promo,verificationstatus)values(?,?,?,?,?,?,?,?,?,?,?,?)";
			pst = conn.prepareStatement(query);
			pst.setString(1,"MyOrganization");
			pst.setString(2,fname);
			pst.setString(3,lname);
			pst.setString(4,password);
			pst.setString(5,address);
			pst.setString(6,city);
			pst.setString(7,zip);
			pst.setString(8,state);
			pst.setString(9,email);
			pst.setString(10,phone);
			pst.setString(11,promo);
			pst.setString(12,"verified");
			
			pst.executeUpdate();
			
		    }catch(SQLException se){
		    	System.out.println(se.getMessage());
		    	se.printStackTrace();
		    	
		    }catch(Exception e){
		    	System.out.println(e.getMessage());
		    	e.printStackTrace();
		    }finally{
			    try { if (pst != null) pst.close(); } catch (Exception e) {};
				   
			    try { if (conn != null) conn.close(); } catch (Exception e) {};
			
		    }
		 
		 }
		
		 //fetches CustomerDetails
		 public Customer getCustomerDetails(String email){
			 Customer cstmr = new Customer();
			 
			 try{
				 conn = bf.connect();
				 String query = "SELECT * FROM customer where email= (?)";
				 pst = conn.prepareStatement(query);
				 pst.setString(1,email);
				 rs = pst.executeQuery();
				 while(rs.next()){
					cstmr.setOAuthProvider(rs.getString("oauthprovider")); 
					cstmr.setCustomerId(rs.getInt("customerid")); 
					cstmr.setFirstName(rs.getString("fname"));
					cstmr.setLastName(rs.getString("lname"));
					cstmr.setPassword(rs.getString("password"));
					cstmr.setAddress(rs.getString("address"));
					cstmr.setCity(rs.getString("city"));
	                cstmr.setZip(rs.getString("zip"));
	                cstmr.setState(rs.getString("state"));
	                cstmr.setEmail(rs.getString("email"));
	                cstmr.setPhone(rs.getString("phone"));
	                cstmr.setRdate(rs.getString("rdate"));
	                cstmr.setPromo(rs.getString("promo"));
	                cstmr.setVerificationStatus(rs.getString("verificationstatus"));
	                
	              
	                System.out.println(cstmr.getEmail());
	                
					 
				 }
				 return cstmr;
				 
				 
			 }catch(Exception e){
				 System.out.println(e.getMessage());
				 e.printStackTrace();
				 return null;
			 }finally{
				    try { if (rs != null) rs.close(); } catch (Exception e) {};
				    try { if (pst != null) pst.close(); } catch (Exception e) {};
				    try { if (conn != null) conn.close(); } catch (Exception e) {};
			 }
		 
		 
		 }
		 
		 //This code adds userdetails to database who login via Facebook
		 public void addOAuser(String OAuthProvider,String fname,String lname,String email){
			 
			 try{	
					conn = bf.connect(); 
					String query = "Insert into customer(oauthprovider,fname,lname,password,address,city,zip,"+
					               "state,email,phone,promo,verificationstatus)values(?,?,?,?,?,?,?,?,?,?,?,?)";
					pst = conn.prepareStatement(query);
					pst.setString(1,OAuthProvider);
					pst.setString(2,fname);
					pst.setString(3,lname);
					pst.setString(4,bf.randomPassword());
					pst.setString(5,address);
					pst.setString(6,city);
					pst.setString(7,zip);
					pst.setString(8,state);
					pst.setString(9,email);
					pst.setString(10,phone);
					pst.setString(11,promo);
					pst.setString(12,"verified");
					
					pst.executeUpdate();
					
				    }catch(SQLException se){
				    	System.out.println(se.getMessage());
				    	se.printStackTrace();
				    	
				    }catch(Exception e){
				    	System.out.println(e.getMessage());
				    	e.printStackTrace();
				    }finally{
					    try { if (pst != null) pst.close(); } catch (Exception e) {};
						   
					    try { if (conn != null) conn.close(); } catch (Exception e) {};
					
				    }
				 }

		 
				public void updateCart(int customerId,int productId,int quantity){
							 
							 try{	
									conn = bf.connect(); 
									String query = "UPDATE cart SET quantity=? WHERE customerId=? AND productId=?;";
									pst = conn.prepareStatement(query);
									pst.setInt(1,quantity);
									pst.setInt(2,customerId);
									pst.setInt(3,productId);
									
									
									pst.executeUpdate();
									
								    }catch(SQLException se){
								    	System.out.println(se.getMessage());
								    	se.printStackTrace();
								    	
								    }catch(Exception e){
								    	System.out.println(e.getMessage());
								    	e.printStackTrace();
								    }finally{
									    try { if (pst != null) pst.close(); } catch (Exception e) {};
										   
									    try { if (conn != null) conn.close(); } catch (Exception e) {};
									
								    }
								 }
                           
				
				public void DeleteFromCart(int customerId,int productId){
					 
					 try{	
							conn = bf.connect(); 
							String query = "DELETE FROM cart WHERE customerId=? AND productId=?;";
							pst = conn.prepareStatement(query);
							pst.setInt(1,customerId);
							pst.setInt(2,productId);
							
							
							pst.executeUpdate();
							
						    }catch(SQLException se){
						    	System.out.println(se.getMessage());
						    	se.printStackTrace();
						    	
						    }catch(Exception e){
						    	System.out.println(e.getMessage());
						    	e.printStackTrace();
						    }finally{
							    try { if (pst != null) pst.close(); } catch (Exception e) {};
								   
							    try { if (conn != null) conn.close(); } catch (Exception e) {};
							
						    }
						 }
                  
				//This function is called when customer orders products
	    		 void getOrder(String RanOrderId,int customerId,int productId,int price,float discount,float cashback,int quantity,
	    				       String receiversName,String receiversAddress,String receiversPhone,String orderStatus,String promoCode,String paymentMethod,
	    				       String paymentStatus){
	    			int amount=price*quantity;
	    			 try{
	    				 conn=bf.connect();
	    				 String query = "INSERT INTO orderdetails(RanOrderId,customerId,productId,price,discount,cashback,"+
	    				                "quantity,amount,receiversName,receiversAddress,receiversPhone,orderStatus,promocode,"+
	    						        "paymentMethod,paymentStatus) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	    				 pst=conn.prepareStatement(query);
	    				 pst.setString(1, RanOrderId);
	    				 pst.setInt(2, customerId);
	    				 pst.setInt(3, productId);
	    				 pst.setInt(4, price);
	    				 pst.setFloat(5, discount);
	    				 pst.setFloat(6, cashback);
	    				 pst.setInt(7, quantity);
	    				 pst.setInt(8, amount);
	    				 pst.setString(9, receiversName);
	    				 pst.setString(10, receiversAddress);
	    				 pst.setString(11,receiversPhone);
	    				 pst.setString(12,orderStatus);
	    				 pst.setString(13, promoCode);
	    				 pst.setString(14, paymentMethod);
	    				 pst.setString(15, paymentStatus);
	    				 
	    				 pst.executeUpdate();
	    				 
	    				 
	    			 }catch(Exception e){
	    				 System.out.println(e.getMessage());
	    				 e.printStackTrace();
	    				 
	    			 }finally{
	    				 try { if (pst != null) pst.close(); } catch (Exception e) {};
						   
						    try { if (conn != null) conn.close(); } catch (Exception e) {};
	    				 
	    			 }
	    			 
	    			 
	    		 }
	    		 
	    		 //This code updates user profile after each purchase
	    		 
	    		 void updateUserProfile(int customerId,String usersAddress,String usersCity,int usersZip,String usersState,String usersPhone){
	    			 
	    			 try{
	    				 conn=bf.connect();
	    				 String query = "UPDATE customer SET address=?,city=?,zip=?,state=?,phone=? WHERE customerId=?";
	    				 pst=conn.prepareStatement(query);
	    				 pst.setString(1, usersAddress);
	    				 pst.setString(2, usersCity);
	    				 pst.setInt(3, usersZip);
	    				 pst.setString(4, usersState);
	    				 pst.setString(5, usersPhone);
	    				 pst.setInt(6, customerId);
	    				 
	    				 
	    				 pst.executeUpdate();
	    				 
	    				 
	    			 }catch(Exception e){
	    				 System.out.println(e.getMessage());
	    				 e.printStackTrace();
	    				 
	    			 }finally{
	    				 try { if (pst != null) pst.close(); } catch (Exception e) {};
						   
						    try { if (conn != null) conn.close(); } catch (Exception e) {};
	    				 
	    			 }
	    			 
	    		 }
			 
		 
		
		
		

}
