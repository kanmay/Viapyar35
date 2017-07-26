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
 * Servlet implementation class ReturnProductsStatsMonthWise
 */
@WebServlet("/ReturnProductsStatsMonthWise")
public class ReturnProductsStatsMonthWise extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BusinessFunctions bf=new BusinessFunctions();
	Statistics stats = new Statistics();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnProductsStatsMonthWise() {
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
		int year = Calendar.getInstance().get(Calendar.YEAR);
		JSONObject myStats = stats.getProductDataMonthWise(year);
		System.out.println(myStats);
		PrintWriter writer = response.getWriter();
		writer.println(myStats);
		writer.flush();
	}

}
