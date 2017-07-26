package packageB;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateProducts
 */
@WebServlet("/UpdateProducts")
public class UpdateProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Products p = new Products();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProducts() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int productId=Integer.parseInt(request.getParameter("productId"));
		p.deleteProduct(productId);
		System.out.println("hieeeeeeeeeeeeeeeeeeeeeeeeeee");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int productId = Integer.parseInt(request.getParameter("productId"));
		
		String productCategory = request.getParameter("productCategory");
		
		String productBrandName = request.getParameter("productBrandName");
		
		String productName = request.getParameter("productName");
		String productType = request.getParameter("productType");
		String prop1 = request.getParameter("prop1");
		String prop2 = request.getParameter("prop2");
		String prop3 = request.getParameter("prop3");
		String prop4 = request.getParameter("prop4");
		String prop5 = request.getParameter("prop5");
		String description = request.getParameter("description");
		int price = Integer.parseInt(request.getParameter("price"));
		float discount = Float.parseFloat(request.getParameter("discount"));
		float cashback = Float.parseFloat(request.getParameter("cashback"));
		String availability = request.getParameter("availability");
		
	
		
		
		

		
	    p.updateProduct(productId,productCategory,productBrandName,productType, productName,
	    		        prop1, prop2, prop3, prop4, prop5, description, price, discount, cashback, availability);
        response.sendRedirect("ModifyProducts.jsp");
	}
	

}
