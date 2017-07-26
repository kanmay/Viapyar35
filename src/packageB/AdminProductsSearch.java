package packageB;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class ReturnResults
 */
@WebServlet("/AdminProductsSearch")
public class AdminProductsSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BusinessFunctions bf = new BusinessFunctions();
	Searcher s = new Searcher();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductsSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String search = request.getParameter("search");
		
	
		
		
		JSONObject jObjProductList=null;
		
		String x="";
		ArrayList<String> PArray=new ArrayList<String>();	
		int found=0;
		String CArray="";
		String match;
		int flag=0;
		int arraySize;
		
		System.out.println("heyaaaaaaaa");
		
		
		
		  try{
			
			
			  
			  jObjProductList =  s.searchEngine(search);
			  System.out.println(jObjProductList);
			
		  }catch(Exception e){
			System.out.println("NOOT woeked  "+e.getMessage());
			e.printStackTrace();
		  }
		

		  
		
		
		
		
		
		
		
		
		
		
		response.setContentType("text/html");  
	    response.setCharacterEncoding("UTF-8"); 
	    
	  
	    
	   
	    
       
	    try{
		arraySize = jObjProductList.getJSONObject("productsList").getJSONArray("products").length();
		PrintWriter writer = response.getWriter();
		
	    writer.println("<html>");
	    writer.println("<head>");
		writer.println("<link href='bootstrap/css/bootstrap.min.css' rel='stylesheet'/>"+
			     
				
				 "<link rel='stylesheet' media='screen and (min-width: 768px) and (max-width: 2000px)' href='css/stylefilter.css' />"+
			     "<link rel='stylesheet' media='screen and (min-width: 0px) and (max-width: 767px)' href='css/filtermin.css' />"
                 
			     );
	    writer.println("</head>");
	    writer.println("<body>");
	    writer.println("<br><br><br>");   

    for(int k=0;k<arraySize;k++){
    writer.println("<div class='col-md-3 col-xs-6 no'>"+
      "<div class='extra thumbnai'>"+
        "<a href=''>"+
        "<img src='file:///D:/Kanmay/"+(String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("productImageName")+" 'height='150px' width='150px'>"+
         "<a href='EditProducts.jsp?productId="+(String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("productId")+
        "'><div class='topright'><span class='glyphicon glyphicon-pencil'></span></div></a>"+
          
          "<p> <b>"+(String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("productBrandName")+
          "&nbsp;"+(String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("productName")+
           "</b>"+
          "</p>"+
        "</a>"+
      "</div>"+
    "</div>");
    }
    
  writer.println("</div>"

);
  


          
	    
	    
	    
	  writer.println("</body>");
	    
      writer.println("</body>");
	  writer.println("</html>");
	    
	
		writer.flush();
		
	    }catch(Exception e){
	    	System.out.println("caught: "+e.getMessage());
	    	e.printStackTrace();
	    	
	    }
		
		
		
	}
			protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
