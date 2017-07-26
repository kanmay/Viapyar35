package packageB;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateOrderStatus
 */
@WebServlet("/UpdateOrderStatus")
public class UpdateOrderStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BusinessFunctions bf = new BusinessFunctions();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOrderStatus() {
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
		int orderId= Integer.parseInt(request.getParameter("orderId"));
		String currentOrderStatus=request.getParameter("currentOrderStatus");
		
		if(currentOrderStatus.equals("Received Successfully")){
			bf.updateProductStatusToShipped(orderId);
			response.setContentType("text/html;charset=UTF-8");
		     response.getWriter().write("Shipped");
			
		}else if(currentOrderStatus.equals("Shipped")){
			bf.updateProductStatusToDelivered(orderId);
			response.setContentType("text/html;charset=UTF-8");
		     response.getWriter().write("Delivered");
		}
				
	}

}
