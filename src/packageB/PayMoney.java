package packageB;

import razorpay.Payment;
import razorpay.RazorpayClient;
import razorpay.RazorpayException;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class PayMoney
 */
@WebServlet("/PayMoney")
public class PayMoney extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayMoney() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String amount=request.getParameter("amount");
		String pid=request.getParameter("razorpay_payment_id");
		try {
			System.out.println("heyaaaaww");
		RazorpayClient razorpay = new RazorpayClient("rzp_test_rnvkmntp1h2a79","SaraevsIkzhkpy04yNHWPOdz");
		
		  JSONObject captureRequest = new JSONObject();
		  captureRequest.put("amount", 200); // Amount should be in paise 
		  Payment payment = razorpay.Payments.capture(pid, captureRequest);
		  System.out.println(captureRequest);
		  
		  response.sendRedirect("Thankyou.html");
		} catch (RazorpayException e) {
		  // Handle Exception 
			response.sendRedirect("index.jsp");
			System.out.println("heyaaaa");
		  System.out.println(e.getMessage());
		  
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
