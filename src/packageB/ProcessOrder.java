package packageB;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProcessOrder
 */
@WebServlet("/ProcessOrder")
public class ProcessOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Customer c = new Customer();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProcessOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int customerId= Integer.parseInt(request.getParameter("customerId"));
		int productId = Integer.parseInt(request.getParameter("productId"));
		int price = Integer.parseInt(request.getParameter("price"));
		float discount = Float.parseFloat(request.getParameter("discount"));
		float cashback = Float.parseFloat(request.getParameter("cashback"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String receiversName = request.getParameter("receiversName");
		String receiversAddress = request.getParameter("receiversAddress");
		String receiversPhone ="868886";
		String promoCode = request.getParameter("promocode");
		String orderStatus = "Received SuccessFully";
		String paymentMethod = "COD";
		String paymentStatus = "Pending";
		String RanOrderId="";
		
		
			c.getOrder(RanOrderId,customerId, productId, price, discount, cashback, quantity, receiversName, 
					   receiversAddress, receiversPhone,orderStatus, promoCode, paymentMethod, paymentStatus);	
		
	}

}
