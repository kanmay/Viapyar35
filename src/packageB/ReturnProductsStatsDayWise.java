package packageB;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

/**
 * Servlet implementation class ReturnProductsStatsDayWise
 */
@WebServlet("/ReturnProductsStatsDayWise")
public class ReturnProductsStatsDayWise extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BusinessFunctions bf = new BusinessFunctions();
	Statistics stats = new Statistics();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnProductsStatsDayWise() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int month = bf.getCurrentMonth();
		System.out.println(month);
		JSONObject myStats = stats.getProductStatsDayWise(2);
		System.out.println(myStats);
		PrintWriter writer = response.getWriter();
		writer.println(myStats);
		System.out.println(myStats);
		writer.flush();
	}

}
