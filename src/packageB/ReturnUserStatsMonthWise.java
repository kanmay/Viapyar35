package packageB;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

/**
 * Servlet implementation class ReturnUserStatsMonthWise
 */
@WebServlet("/ReturnUserStatsMonthWise")
public class ReturnUserStatsMonthWise extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Statistics stats = new Statistics();
	BusinessFunctions bf = new BusinessFunctions();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnUserStatsMonthWise() {
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
		int year = Calendar.getInstance().get(Calendar.YEAR);
		JSONObject myStats = stats.getDataMonthWise(year);
		System.out.println(myStats);
		PrintWriter writer = response.getWriter();
		writer.println(myStats);
		writer.flush();
	}

}
