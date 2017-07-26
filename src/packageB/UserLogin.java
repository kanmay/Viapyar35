package packageB;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		String landingPage = request.getParameter("landingPage");
		
		
		
		
		
		
		
		BusinessFunctions bf = new BusinessFunctions();
		Customer c = new Customer();
		
		if(bf.checkUser(email,password)){
			
			  Customer cstmr = c.getCustomerDetails(email);
			  HttpSession session = request.getSession(true);
			  session.setAttribute("user", cstmr.getCustomerId());
			  session.setAttribute("email", email);
			  session.setAttribute("fname",cstmr.getFirstName());
			  session.setAttribute("customerId", cstmr.getCustomerId());
			  session.setAttribute("address", cstmr.getAddress());
			  
			 
			  
			   if(landingPage.equals("null")){
			      response.sendRedirect("Home.jsp");
			   }else{
				   response.sendRedirect("ProductDetailsFetch?productId="+landingPage);
			   }
				   
			
		}
		else{
			String message = "UserId and Password did not match.";
			request.setAttribute("message", message);
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}

}
}
