package packageB;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UploadProducts
 */
@WebServlet("/UploadProducts")
@MultipartConfig
public class UploadProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		BusinessFunctions bf = new BusinessFunctions();
		Configuration c=new Configuration();
		Products  p = new Products();
		int proId = bf.getLastRowValue()+1;
		String productImageName = "product"+Integer.toString(proId)+".jpg";
		
		String productCategory = "";
		String productBrandName = "";
		String productType = "";
		String productName = "";
		String productVariant = "";
		String prop1 = "";
		String prop2 = "";
		String prop3 = "";
		String prop4 = "";
		String prop5 = "";
		String description ="";
		int price = 0;
		float discount = 0;
		float cashback =0;
		String availability = "";
		
		
		try{
			Part productImagePart = request.getPart("file");
			InputStream is = productImagePart.getInputStream();
			
			//String outputfile = "/opt/tomcat/webapps/viapyarr/productImages/"+productImageName;  // get path on the server
			String outputfile = c.getOutputImageLocation()+productImageName;
			System.out.println(outputfile);
            FileOutputStream os = new FileOutputStream (outputfile);
            
            // write bytes taken from uploaded file to target file
            int ch = is.read();
            while (ch != -1) {
                 os.write(ch);
                 ch = is.read();
            }
            os.close();
			
			{
				
			  Part productCategoryPart  = request.getPart("productCategory");
	          Scanner s = new Scanner(productCategoryPart.getInputStream());
	          productCategory = s.nextLine();    // read filename from stream
	          System.out.println(productCategory);	
			}	
				
			{	
		      Part productBrandNamePart  = request.getPart("productBrandName");
	          Scanner s = new Scanner(productBrandNamePart.getInputStream());
	          productBrandName = s.nextLine();    // read filename from stream
	          System.out.println(productBrandName);
			}
			
			{
	          Part productTypePart  = request.getPart("productType");
              Scanner s = new Scanner(productTypePart.getInputStream());
              productType = s.nextLine();    // read filename from stream
              System.out.println(productType);
			} 
			
			{
		       Part productNamePart  = request.getPart("productName");
	           Scanner s = new Scanner(productNamePart.getInputStream());
	           productName = s.nextLine();    // read filename from stream
	           System.out.println(productName);
			} 
			
			
			
			{
	          Part prop1Part  = request.getPart("prop1");
              Scanner s = new Scanner(prop1Part.getInputStream());
              if(s.hasNextLine()){// read filename from stream
                prop1 = s.nextLine();
              }else{
            	prop1="";  
              }
              System.out.println(prop1);
			} 
			
			{
	          Part prop2Part  = request.getPart("prop2");
              Scanner s = new Scanner(prop2Part.getInputStream());
              if(s.hasNextLine()){// read filename from stream
                  prop2 = s.nextLine();
              }else{
              	prop2="";  
              }
              System.out.println(prop2);
			} 
			
			{
	          Part prop3Part  = request.getPart("prop3");
              Scanner s = new Scanner(prop3Part.getInputStream());
              if(s.hasNextLine()){// read filename from stream
                  prop3 = s.nextLine();
              }else{
              	prop3="";  
              }
              System.out.println(prop3);
			} 
			
			{
	          Part prop4Part  = request.getPart("prop4");
              Scanner s = new Scanner(prop4Part.getInputStream());
              if(s.hasNextLine()){// read filename from stream
                  prop4 = s.nextLine();
              }else{
              	prop4="";  
              }
              System.out.println(prop4);
			} 
			
			{
	          Part prop5Part  = request.getPart("prop5");
              Scanner s = new Scanner(prop5Part.getInputStream());
              if(s.hasNextLine()){// read filename from stream
                  prop5 = s.nextLine();
              }else{
              	prop5="";  
              }
              System.out.println(prop5);
			} 
			
			{
	          Part descriptionPart  = request.getPart("description");
              Scanner s = new Scanner(descriptionPart.getInputStream());
              description = s.nextLine();    // read filename from stream
              System.out.println("hie "+description);
			} 
			
			{
	          Part pricePart  = request.getPart("price");
              Scanner s = new Scanner(pricePart.getInputStream());
              String priceString = s.nextLine();    // read filename from stream
              price = Integer.parseInt(priceString);
              System.out.println(price);
			} 
			
			{
	          Part discountPart  = request.getPart("discount");
              Scanner s = new Scanner(discountPart.getInputStream());
              String discountString  = s.nextLine();    // read filename from stream
             // System.out.println(discountString);
              discount = Float.parseFloat(discountString);
			} 
			
			{
	          Part cashbackPart  = request.getPart("cashback");
              Scanner s = new Scanner(cashbackPart.getInputStream());
              String cashbackString = s.nextLine();    // read filename from stream
              cashback = Float.parseFloat(cashbackString);
              System.out.println(cashback);
			} 
			
			{
	          Part availabilityPart  = request.getPart("availability");
              Scanner s = new Scanner(availabilityPart.getInputStream());
              availability = s.nextLine();    // read filename from stream
              // System.out.println(availability);
             
			} 
			
		
			
		   
				
			
			
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace();
			
		}
		
		
		
		p.addProduct(productImageName,productCategory,productBrandName,
				     productType, productName,prop1, prop2, prop3,prop4,prop5,description,
				     price, discount, cashback, availability);
		
		response.sendRedirect("ModifyProducts.jsp");
	}

}
