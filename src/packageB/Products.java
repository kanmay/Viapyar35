package packageB;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.nio.file.DirectoryNotEmptyException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import packageB.Configuration;
public class Products {
	Configuration c = new Configuration();
	
	
    int productId;
    String productImageName;
    String productCategory;
    String productBrandName;
    String productType;
    String productName;
    String variant1;
    String variant2;
    String variant3;
    String variant4;
    String variant5;
    String variant6;
    String variant7;
    String variant8;
    String variant9;
    String variant10;
    String prop1;
    String prop2;
    String prop3;
    String prop4;
    String prop5;
    String description;
    int price;
    float discount;
    float cashback;
    String availability;
    
    
    
    
    
    public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductImageName() {
		return productImageName;
	}

	public void setProductImageName(String productImageName) {
		this.productImageName = productImageName;
	}

	
	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getProductBrandName() {
		return productBrandName;
	}

	public void setProductBrandName(String productBrandName) {
		this.productBrandName = productBrandName;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}



	public String getVariant1() {
		return variant1;
	}

	public void setVariant1(String variant1) {
		this.variant1 = variant1;
	}

	public String getVariant2() {
		return variant2;
	}

	public void setVariant2(String variant2) {
		this.variant2 = variant2;
	}

	public String getVariant3() {
		return variant3;
	}

	public void setVariant3(String variant3) {
		this.variant3 = variant3;
	}

	public String getVariant4() {
		return variant4;
	}

	public void setVariant4(String variant4) {
		this.variant4 = variant4;
	}

	public String getVariant5() {
		return variant5;
	}

	public void setVariant5(String variant5) {
		this.variant5 = variant5;
	}

	public String getVariant6() {
		return variant6;
	}

	public void setVariant6(String variant6) {
		this.variant6 = variant6;
	}

	public String getVariant7() {
		return variant7;
	}

	public void setVariant7(String variant7) {
		this.variant7 = variant7;
	}

	public String getVariant8() {
		return variant8;
	}

	public void setVariant8(String variant8) {
		this.variant8 = variant8;
	}

	public String getVariant9() {
		return variant9;
	}

	public void setVariant9(String variant9) {
		this.variant9 = variant9;
	}

	public String getVariant10() {
		return variant10;
	}

	public void setVariant10(String variant10) {
		this.variant10 = variant10;
	}

	public String getProp1() {
		return prop1;
	}

	public void setProp1(String prop1) {
		this.prop1 = prop1;
	}

	public String getProp2() {
		return prop2;
	}

	public void setProp2(String prop2) {
		this.prop2 = prop2;
	}

	public String getProp3() {
		return prop3;
	}

	public void setProp3(String prop3) {
		this.prop3 = prop3;
	}

	public String getProp4() {
		return prop4;
	}

	public void setProp4(String prop4) {
		this.prop4 = prop4;
	}

	public String getProp5() {
		return prop5;
	}

	public void setProp5(String prop5) {
		this.prop5 = prop5;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public float getCashback() {
		return cashback;
	}

	public void setCashback(float cashback) {
		this.cashback = cashback;
	}

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}

	public int getProductId() {
		return productId;
	}

	

	BusinessFunctions bf = new BusinessFunctions();
	
	static Connection conn = null;
	static ResultSet rs = null;
	static PreparedStatement pst = null;
	static Statement smt = null;
	
	
	//This function is called while adding products
	
		public void addProduct(String productImageName,String productCategory,String productBrandName,
				               String productType,String productName,String prop1,String prop2,String prop3,
				               String prop4,String prop5,String description,int price,float discount,float cashback
				               ,String availability){
			   
			   
			try{
				conn = bf.connect();
				String query = "INSERT INTO products(productImageName,productCategory,productBrandName,productType,productName,prop1,prop2,prop3,prop4,prop5,description,price,discount,cashback,availability)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
			    pst = conn.prepareStatement(query);
			    pst.setString(1,productImageName);
			    pst.setString(2,productCategory);
				pst.setString(3,productBrandName);
				pst.setString(4,productType);
				pst.setString(5,productName);
				pst.setString(6,prop1);
				pst.setString(7,prop2);
				pst.setString(8,prop3);
				pst.setString(9,prop4);
				pst.setString(10,prop5);
				pst.setString(11,description);
				pst.setInt(12,price);
				pst.setFloat(13,discount);
				pst.setFloat(14,cashback);
				pst.setString(15,availability);
				
				pst.executeUpdate();
				
				
			}catch(SQLException e){
				System.out.println(e.getMessage());
				e.printStackTrace();
				
			}catch(Exception e){
				System.out.println(e.getMessage());
				e.printStackTrace();
			}finally{
				    try { if (pst != null) pst.close(); } catch (Exception e) {};
				   
				    try { if (conn != null) conn.close(); } catch (Exception e) {};
				
			}
			
						
		}
		
		//This function is called while updating products
		
			public void updateProduct(int productId,String productCategory,String productBrandName,
					                  String productType,String productName,String prop1,String prop2,String prop3,String prop4,
					                  String prop5,String description,int price,float discount,float cashback,String availability){
				   
			//	UPDATE table_name
				//SET column1=value1,column2=value2,...
				//WHERE some_column=some_value;		   
				try{
					conn = bf.connect();
					String query = "UPDATE products SET productCategory=?,productBrandName=?,productType=?,"+
					                "productName=?,prop1=?,prop2=?,prop3=?,"+
							        "prop4=?,prop5=?,description=?,price=?,discount=?,cashback=?,availability=?"+
					                "WHERE productid=?;";
				    pst = conn.prepareStatement(query);
				    
				    pst.setString(1,productCategory);
				    pst.setString(2,productBrandName);
					pst.setString(3,productType);
					pst.setString(4,productName);
					pst.setString(5,prop1);
					pst.setString(6,prop2);
					pst.setString(7,prop3);
					pst.setString(8,prop4);
					pst.setString(9,prop5);
					pst.setString(10,description);
					pst.setInt(11,price);
					pst.setFloat(12,discount);
					pst.setFloat(13,cashback);
					pst.setString(14,availability);
					pst.setInt(15,productId);
					
					pst.executeUpdate();
					
					
				}catch(SQLException e){
					System.out.println(e.getMessage());
					e.printStackTrace();
					System.out.println("catch 1");
					
				}catch(Exception e){
					System.out.println(e.getMessage());
					e.printStackTrace();
					System.out.println("catch 2");
				}finally{
					    try { if (pst != null) pst.close(); } catch (Exception e) {};
					   
					    try { if (conn != null) conn.close(); } catch (Exception e) {};
					
				}
							
			}
			
			//This function delete products
			void deleteProduct(int productId)
			{
				
			/*	Path path = Paths.get(URI.create(c.getImgLoc()+productId+".jpg"));;
				
				try {
				    Files.delete(path);
				} catch (NoSuchFileException x) {
				    System.err.format("%s: no such" + " file or directory%n", path);
				} catch (DirectoryNotEmptyException x) {
				    System.err.format("%s not empty%n", path);
				} catch (IOException x) {
				    // File permission problems are caught here.
				    System.err.println(x);
				}*/
				
				
				try{
					conn = bf.connect();
					String query = "DELETE FROM products WHERE productid='"+productId+"'";
					smt = conn.createStatement();
					smt.executeUpdate(query);
					
				}catch(Exception e){
					System.out.println(e.getMessage());
					e.printStackTrace();
					
				}
				
			}
			
			
			//This function adds product to wishlist table
			void addProductToWishlist(int customerId, int productId){
				
				try{
					conn = bf.connect();
					String query = "INSERT INTO wishlist(customerId,productId) values (?,?);";
					pst = conn.prepareStatement(query);
					pst.setInt(1, customerId);
					pst.setInt(2,productId);
					pst.executeUpdate();
				}catch(Exception e){
					System.out.println(e.getMessage());
					e.printStackTrace();
					
				}finally{
					    try { if (pst != null) pst.close(); } catch (Exception e) {};
					   
					    try { if (conn != null) conn.close(); } catch (Exception e) {};
					
					
				}
				
			}
			
			//This function adds product to cart Table
             boolean addProductToCart(int customerId, int productId){
				
			     	try{
					  	conn = bf.connect();
						String query = "INSERT INTO cart(customerId,productId) values (?,?);";
						pst = conn.prepareStatement(query);
						pst.setInt(1, customerId);
						pst.setInt(2,productId);
						pst.executeUpdate();
						
						return true;
					}catch(Exception e){
						System.out.println(e.getMessage());
						e.printStackTrace();
						
						return false;
						
					}finally{
						    try { if (pst != null) pst.close(); } catch (Exception e) {};
						   
						    try { if (conn != null) conn.close(); } catch (Exception e) {};
						
						
					}
					
		    }
             
             //This function fetches product details
    		 public Products getProductDetails(String productId){
    			 Products product = new Products();
    			 
    			 try{
    				 conn = bf.connect();
    				 String query = "SELECT * FROM products where productId= (?)";
    				 pst = conn.prepareStatement(query);
    				 pst.setString(1,productId);
    				 rs = pst.executeQuery();
    				 while(rs.next()){
    					 
    					product.setProductId(rs.getInt("productId")); 
    					product.setProductImageName(rs.getString("productImageName"));
    					product.setProductCategory(rs.getString("productCategory"));
    					product.setProductBrandName(rs.getString("productBrandName"));
    					product.setProductType(rs.getString("productType"));
    					product.setProductName(rs.getString("productName"));
    					try{
    						Connection iconn=bf.connect();
    						String query1="SELECT * FROM productvariants where productId=?";
    						PreparedStatement ipst = iconn.prepareStatement(query1);
    						ipst.setString(1,productId);
    						ResultSet irs = ipst.executeQuery();
    						while(irs.next()){
    							product.setVariant1(irs.getString("variant1"));
    							product.setVariant2(irs.getString("variant2"));
    							product.setVariant3(irs.getString("variant3"));
    							product.setVariant4(irs.getString("variant4"));
    							product.setVariant5(irs.getString("variant5"));
    							product.setVariant6(irs.getString("variant6"));
    							product.setVariant7(irs.getString("variant7"));
    							product.setVariant8(irs.getString("variant8"));
    							product.setVariant9(irs.getString("variant9"));
    							product.setVariant10(irs.getString("variant10"));
    						}
    						
    						try { if (ipst != null) ipst.close(); } catch (Exception e) {};
    					    try { if (iconn != null) iconn.close(); } catch (Exception e) {};
    					    try { if (irs != null) irs.close(); } catch (Exception e) {};
    						
    						
    						
    					}catch(Exception e){
    						 System.out.println(e.getMessage());
    	    				 e.printStackTrace();
    					}
    	                product.setProp1(rs.getString("prop1"));
    	                product.setProp2(rs.getString("prop2"));
    	                product.setProp3(rs.getString("prop3"));
    	                product.setProp4(rs.getString("prop4"));
    	                product.setProp5(rs.getString("prop5"));
    	                product.setDescription(rs.getString("description"));
    	                product.setPrice(rs.getInt("price"));
    	                product.setDiscount(rs.getFloat("discount"));
    	                product.setCashback(rs.getFloat("cashback"));
    	                product.setAvailability(rs.getString("availability"));
    	                
    	              
    	                
    	                
    					 
    				 }
    				 return product;
    				 
    				 
    			 }catch(Exception e){
    				 System.out.println(e.getMessage());
    				 e.printStackTrace();
    				 return null;
    			 }finally{
    				 
    				try { if (rs != null) rs.close(); } catch (Exception e) {};
 				    try { if (conn != null) conn.close(); } catch (Exception e) {};
    			 }
    		 
    		 }
    		 
    		 
             
}
