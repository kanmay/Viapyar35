package packageB;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	   try{
			String SproductId = request.getParameter("productId");
			String ScustomerId = request.getParameter("customerId");
			
			Products p = new Products();
			Products product=p.getProductDetails(SproductId);
			
			
			
			int customerId = Integer.parseInt(ScustomerId);
			int productId = Integer.parseInt(SproductId);
			
			
			

			
			
			if(p.addProductToCart(customerId, productId)){
			 response.setContentType("text/html;charset=UTF-8");
		     response.getWriter().write("Added to Cart");
			}
			else{
				response.setContentType("text/html;charset=UTF-8");
			     response.getWriter().write("Go to cart");
				
			}
			
	    }catch(Exception e){
	    	System.out.println(e.getMessage());
	    	e.printStackTrace();
	    }
	    	
	 }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
