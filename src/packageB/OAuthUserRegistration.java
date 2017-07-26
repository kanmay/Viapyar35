package packageB;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class OAuthUserRegistration
 */
@WebServlet("/OAuthUserRegistration")
public class OAuthUserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BusinessFunctions bf= new BusinessFunctions();
	Customer cst = new Customer();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OAuthUserRegistration() {
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
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String OAuthProvider = request.getParameter("OAuthProvider");
		
		String landingPage = request.getParameter("landingPage");
		
		System.out.println("heya "+fname+" "+lname+" "+email+" "+OAuthProvider);
		
		if(bf.OAuserExists(email)){
			System.out.println("I exist");
			Customer cstmr = cst.getCustomerDetails(email);
			HttpSession session = request.getSession();
			session.setAttribute("user", cstmr.getCustomerId());
			session.setAttribute("userEmail",cstmr.getEmail());
			session.setAttribute("fname",cstmr.getFirstName());
			
			
			//System.out.println("Existing "+email+" ji");
			
		
		}else{
			cst.addOAuser(OAuthProvider,fname,lname,email);
			if(bf.OAuserExists(email)){
				System.out.println("I exist too");
				Customer cstmr = cst.getCustomerDetails(email);
				HttpSession session = request.getSession();
				session.setAttribute("user", cstmr.getCustomerId());
				session.setAttribute("userEmail",email);
				session.setAttribute("fname",fname);
				int itemsInCart = bf.getCountOfCartItems(cstmr.getCustomerId());
				  
				 
				
				 
			}		
			
		}
		
		
	}

}
