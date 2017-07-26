package packageB;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddToWishlist
 */
@WebServlet("/AddToWishlist")
public class AddToWishlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToWishlist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 try {
			    String ScustomerId = request.getParameter("customerId");
			    String SproductId = request.getParameter("productId");
				
				
				System.out.println("Pro id is: "+ SproductId);
				System.out.println("Cust id is: "+ScustomerId);
				
				int customerId = Integer.parseInt(ScustomerId);
				int productId = Integer.parseInt(SproductId);
				
				Products p = new Products();
				p.addProductToWishlist(customerId, productId);
				response.setContentType("text/html;charset=UTF-8");
			    response.getWriter().write("Added To Wishlist");
				
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
