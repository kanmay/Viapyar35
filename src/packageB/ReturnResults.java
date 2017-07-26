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
@WebServlet("/ReturnResults")
public class ReturnResults extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BusinessFunctions bf = new BusinessFunctions();
	Searcher s = new Searcher();
	Configuration c = new Configuration();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnResults() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String search = request.getParameter("search");
		String[] sortingFilters = new String[20];
		
	
		
		
		JSONObject jObjProductList=null;
		
		String x="";
		ArrayList<String> PArray=new ArrayList<String>();	
		int found=0;
		String CArray="";
		String match;
		int flag=0;
		int arraySize;
		
		
		
		
		  try{
			
			  JSONArray myFilterArray = new JSONArray(request.getParameter("myFilter"));
			  System.out.println(myFilterArray.length()+" "+myFilterArray);
			  System.out.println("worked");
			
			  for(int i=0;i<myFilterArray.length();i++){
				sortingFilters[i]=(String)myFilterArray.get(i);
				System.out.println(sortingFilters[i]);
			  }
			  
			  jObjProductList =  s.searchEngine(search,sortingFilters);
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
		writer.println(
			     
				
				 "<link rel='stylesheet' media='screen and (min-width: 768px) and (max-width: 2000px)' href='css/stylefilter.css' />"+
			     "<link rel='stylesheet' media='screen and (min-width: 0px) and (max-width: 767px)' href='css/filtermine.css' />"
                 
			     );
	    writer.println("</head>");
	    writer.println("<body>");
          
writer.println(
  
  "<div class='row rowcol'>");
for(int k=0;k<arraySize;k++){
	
	int p,f;
	float d;
	
	p=Integer.parseInt(((String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("price")));
	d=Float.parseFloat((String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("discount"));
	f=(int)(p-((d/100)*p));
	
	
writer.println("<div class='col-md-3 col-xs-6 extra thumbnai'>"+
  "<div>"+
    "<a class='searchres' href='ProductDetailsFetch?productId="+(String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("productId")+"'>"+
      "<img class='img-responsive' src='"+c.getImgLoc()+(String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("productImageName")+"'   style='height:230px;width:100%'>"+
      "<p style='  width : 100%;overflow:hidden; display:inline-block;text-overflow: ellipsis;white-space: nowrap;'><br> <b>"+(String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("productBrandName")+
      "&nbsp;"+(String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("productName")+
      "</b></p>"+
     "<p style='  width : 100%;overflow:hidden; display:inline-block;text-overflow: ellipsis;white-space: nowrap;'> <b><span style='color:grey'><del>&#8377 "+(String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("price")+
     "<del></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8377 "+f+" <i>("+(String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("discount")+" % Off)</i></b>"+
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
