package packageB;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Servlet implementation class HandleOrder
 */
@WebServlet("/HandleOrder")
public class HandleOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Customer c = new Customer();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SendEmail se=new SendEmail();
		Random random = new Random(System.nanoTime());
		UtilityFunctions uf=new UtilityFunctions();
		SendSMS sms=new SendSMS();
		
		JSONObject ItemsOrdered=new JSONObject();
		JSONArray ItemsList=new JSONArray();
		JSONObject ItemProperty=null;
		
		
		int orderCount = Integer.parseInt(request.getParameter("ordercount"));
		int customerId=Integer.parseInt(request.getParameter("customerId"));
		int productId=0;
		int price=0;
		float discount=0;
		float cashback=0;
		int quantity=0;
		String product="";
		String RanOrderId="";
		int amount=0;
		int actualPrice=0;
		String EmailMessage="";
		
		String email="";
		String receiversName="";
		String receiversAddress="";
		String receiversPhone="";
		String orderStatus="";
		String promoCode="";
		String paymentMethod="";
		String paymentStatus="";
		
		String usersAddress="";
		String usersCity="";
		String usersState="";
		int usersZip=0;
		String usersPhone="";
		
		
		email=request.getParameter("email");
		receiversName=request.getParameter("RName");
		receiversAddress=request.getParameter("RAddress");
		receiversPhone=request.getParameter("RPhone");
		orderStatus="Received Successfully";
		promoCode="";
		paymentMethod="COD";
		paymentStatus="Pending";
		
		usersAddress=request.getParameter("UAddress");
		usersCity=request.getParameter("UCity");
		usersState=request.getParameter("UState");
		usersZip=Integer.parseInt(request.getParameter("UZip"));
		usersPhone=request.getParameter("UPhone");
		
		if(orderCount==0){
			
			try{
				productId=Integer.parseInt(request.getParameter("productId"));
				price=Integer.parseInt(request.getParameter("price"));
				discount=Float.parseFloat(request.getParameter("discount"));
				cashback=Float.parseFloat(request.getParameter("cashback"));
				quantity=Integer.parseInt(request.getParameter("quantity"));
				product=request.getParameter("product");
				
				System.out.println(product);
				amount=(int)((price-(discount/100)*price));
				actualPrice=amount;
				
				RanOrderId = String.format("%04d", random.nextInt(100000))+String.format("%04d", random.nextInt(100000));

				c.getOrder(RanOrderId,customerId, productId, price, discount, cashback, quantity, receiversName, 
						   receiversAddress, receiversPhone,orderStatus, promoCode, paymentMethod, paymentStatus);
				
				ItemProperty=new JSONObject();
				ItemProperty.put("RanOrderId",RanOrderId);
				ItemProperty.put("product",product);
				ItemProperty.put("quantity",String.valueOf(quantity));
				ItemProperty.put("actualPrice",actualPrice);
				ItemProperty.put("deliveryDate",uf.getDeliveryDate());
				
				ItemsList.put(ItemProperty);
				
				System.out.println("Mayu");
				
				ItemsOrdered.put("ItemsOrdered",ItemsList);
				EmailMessage=uf.EmailBuilder(ItemsOrdered, amount);
				
				se.sendEmail(email,EmailMessage);
				sms.sendSms(receiversPhone, ItemsOrdered, amount);

			}catch(Exception e){
				System.out.println(e.getMessage());
			}
			
		}else{
		
		     try{
		    	 for(int i=1;i<=orderCount;i++){
		 			
		 			productId=Integer.parseInt(request.getParameter("productId"+Integer.toString(i)));
		 			price=Integer.parseInt(request.getParameter("price"+Integer.toString(i)));
		 			discount=Float.parseFloat(request.getParameter("discount"+Integer.toString(i)));
		 			cashback=Float.parseFloat(request.getParameter("cashback"+Integer.toString(i)));
		 			quantity=Integer.parseInt(request.getParameter("quantity"+Integer.toString(i)));
		 			product=request.getParameter("product"+Integer.toString(i));
		 			
		 			actualPrice=(int)(price-((discount/100)*price))*quantity;
		 			
		 			RanOrderId = String.format("%04d", random.nextInt(100000))+String.format("%04d", random.nextInt(100000));
		 			
		 			amount+=actualPrice;
		 			
		 			ItemProperty=new JSONObject();
		 			
		 			ItemProperty.put("quantity",String.valueOf(quantity));
		 			ItemProperty.put("product",product);
		 			ItemProperty.put("RanOrderId",RanOrderId);
		 			ItemProperty.put("actualPrice",actualPrice);
		 			ItemProperty.put("deliveryDate",uf.getDeliveryDate());
		 			
		 			ItemsList.put(ItemProperty);

		 			
		 			c.getOrder(RanOrderId,customerId, productId, price, discount, cashback, quantity, receiversName, 
		 					   receiversAddress, receiversPhone,orderStatus, promoCode, paymentMethod, paymentStatus);
		 			c.DeleteFromCart(customerId, productId);
		 		  }
		    	    
		    	    ItemsOrdered.put("ItemsOrdered",ItemsList);
		    	    EmailMessage=uf.EmailBuilder(ItemsOrdered, amount);
		    	    System.out.println("items are:" +ItemsOrdered);
		    	    System.out.println(EmailMessage);
		 		    se.sendEmail(email,EmailMessage);
		 		    sms.sendSms(receiversPhone, ItemsOrdered, amount);
		 		

		       }catch(Exception E){
		    	 System.out.println(E.getMessage());
		       }
		} 
				
		    c.updateUserProfile(customerId,usersAddress,usersCity,usersZip,usersState,usersPhone);
		    response.sendRedirect("Thankyou.html");
		
	}
}
