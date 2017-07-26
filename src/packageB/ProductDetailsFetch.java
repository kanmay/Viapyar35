package packageB;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductDetailsFetch
 */
@WebServlet("/ProductDetailsFetch")
public class ProductDetailsFetch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			String proId = request.getParameter("productId");
			System.out.println("my id is "+proId);
			
			Products p = new Products();
			Products product=p.getProductDetails(proId);
			
	    		request.setAttribute("productId",product.getProductId());
	    		request.setAttribute("productImageName",product.getProductImageName());
	    		request.setAttribute("productCategory",product.getProductCategory());
	    		request.setAttribute("productBrandName",product.getProductBrandName());
	    		request.setAttribute("productType",product.getProductType());
	    		request.setAttribute("productName",product.getProductName());
	    		request.setAttribute("variant1",product.getVariant1());
	    		request.setAttribute("variant2",product.getVariant2());
	    		request.setAttribute("variant3",product.getVariant3());
	    		request.setAttribute("variant4",product.getVariant4());
	    		request.setAttribute("variant5",product.getVariant5());
	    		request.setAttribute("variant6",product.getVariant6());
	    		request.setAttribute("variant7",product.getVariant7());
	    		request.setAttribute("variant8",product.getVariant8());
	    		request.setAttribute("variant9",product.getVariant9());
	    		request.setAttribute("variant10",product.getVariant10());
	    		request.setAttribute("prop1",product.getProp1());
	    		request.setAttribute("prop2",product.getProp2());
	    		request.setAttribute("prop3",product.getProp3());
	    		request.setAttribute("prop4",product.getProp4());
	    		request.setAttribute("prop5",product.getProp5());
	    		request.setAttribute("description",product.getDescription());
	    		request.setAttribute("price",product.getPrice());
	    		request.setAttribute("discount",product.getDiscount());
	    		request.setAttribute("cashback",product.getCashback());
	    		request.setAttribute("availability",product.getAvailability());
	    
	 
	    		
	    		request.getServletContext().getRequestDispatcher("/ProductInformation.jsp").forward(request, response);
	    		 
	    		 

			
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
