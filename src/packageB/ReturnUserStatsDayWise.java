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
 * Servlet implementation class ReturnUserStatsDayWise
 */
@WebServlet("/ReturnUserStatsDayWise")
public class ReturnUserStatsDayWise extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Statistics stats = new Statistics();
	BusinessFunctions bf = new BusinessFunctions();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnUserStatsDayWise() {
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

		int month = bf.getCurrentMonth();
		System.out.println(month);
		JSONObject myStats = stats.getDataOfCurrentMonth(month);
		System.out.println(myStats);
		PrintWriter writer = response.getWriter();
		writer.println(myStats);
		writer.flush();
	}

}
