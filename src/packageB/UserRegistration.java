package packageB;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import packageB.BusinessFunctions;

/**
 * Servlet implementation class UserRegistration
 */
@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String OAuthProvider = "MayankSinghal";
		String fname = request.getParameter("firstname");
		String lname = request.getParameter("lastname");
		String password = request.getParameter("password");
		String address = "";
		String city = "";
		String zip = "";
		String state = "";
		String email = request.getParameter("email");
		String phone= "";
		String promo= "";
		String verificationStatus = "verified";
		
	    Customer cst = new Customer();
		cst.insertIntoCustomer(fname, lname, password, address, city, zip, state, email, phone, promo);
		
		BusinessFunctions bf = new BusinessFunctions();
		Customer c = new Customer();
		
		if(bf.checkUser(email,password)){
			  
			
			  Customer cstmr = c.getCustomerDetails(email);
			  HttpSession session = request.getSession(true);
			  session.setAttribute("user", cstmr.getCustomerId());
			  session.setAttribute("email", email);
			  session.setAttribute("fname",cstmr.getFirstName());
			  session.setAttribute("customerId", cstmr.getCustomerId());
			  response.sendRedirect("Home.jsp");
			  
			
		}
		else
			System.out.println("dont exist");
		
	}
		
		
	

}
