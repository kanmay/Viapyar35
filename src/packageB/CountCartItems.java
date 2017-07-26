package packageB;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CountCartItems
 */
@WebServlet("/CountCartItems")
public class CountCartItems extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BusinessFunctions bf=new BusinessFunctions();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CountCartItems() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int customerId=Integer.parseInt(request.getParameter("customerId"));
		int itemsInCart = bf.getCountOfCartItems(customerId);
		
		response.setContentType("text/html;charset=UTF-8");
	     response.getWriter().write(itemsInCart);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
