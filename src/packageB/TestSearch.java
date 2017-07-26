package packageB;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class TestSearch
 */
@WebServlet("/TestSearch")
public class TestSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BusinessFunctions bf = new BusinessFunctions();
	Searcher s = new Searcher();
	Configuration c=new Configuration();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestSearch() {
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
		
		String homeSearch = request.getParameter("myFilter1");
		
		
		JSONObject jObjProductList=null;
		
		String x="";
		ArrayList<String> PArray=new ArrayList<String>();	
		int found=0;
		String CArray="";
		String match;
		int flag=0;
		int arraySize;
		
		
		if(homeSearch.equals("viapyar")){
			
		 jObjProductList =  s.searchEngine(search);
		}
		
		else{
		
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
        		   "<br><br><br>"+
        		   "<div class='wrap'>"+
        		   
        		   "<main>"+
        		  
        		     "<aside id='aside'>"+
        		     

        		 "<div id='myButton' class='hidet'>"+
        		   
        		   
        		   "<h3 style='padding-left:2px'>Filters</h3>"+
        		   "<hr>"
        		   
        		   );
           
           
           CArray=(String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(0)).get("productType");
           match=CArray;
           
           for(int a=1;a<arraySize;a++){
        	   
        	   if(!((String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(a)).get("productType")).equals(match)){
        		   System.out.println((String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(a)).get("productType")+" "+match+"jjjjj");
        		   System.out.println("hoooooatttttttttt");
		     flag=1;
		     break;
	         }

           }

  if(flag==0){       
    
            PArray.add((String)((JSONObject)jObjProductList.getJSONObject("productsList").getJSONArray("products").get(0)).get("prop1"));
          for(int k=0;k<arraySize;k++){ 
              for(int j=0;j<=PArray.size()-1;j++){
         		  found=0;
         		  if(PArray.get(j).equals((String)((JSONObject)jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("prop1"))){
         			  found=1;
         			  break;
         		  }
         	    }   
         	   
         	    if (found==0){
         
         			   PArray.add((String)((JSONObject)jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("prop1"));
         	    
         	    }

         	  }
 
          if(PArray.size()>0)
          {
        	  if((PArray.size()==1)&&(PArray.get(0).equals("")))
        	  {
        		  
        	  }
        	  else
        	  {
        		  writer.println(
        		    		 "<div style='cursor:pointer' class='designtog' data-toggle='collapse' id='me' data-target='#demo1'>Property1<span style='float:right;' class='glyphicon glyphicon-chevron-down'></span></div>"+
        		    	       "<div id='demo1' class='collapse'>"+
        		    	       "<div style='margin-left:10px;'>");
        		  
        		  for(int s=0;s<PArray.size();s++){
                	  if(!PArray.get(s).equals("")){ 
                        writer.println( "<div class='checkbox'>"+
        	                     "<label><input type='checkbox' value='"+PArray.get(s)+"' name='prop1'>"+PArray.get(s)+"</label>"+
        	                     "</div>"
                        );
                	  }  
          		   }

        		  writer.println( "</div>"+
                          "</div>"+
                           "<hr>");
  
        	  }
          }
          
          
         


             
               
PArray.clear();
found=0;


     PArray.add((String)((JSONObject)jObjProductList.getJSONObject("productsList").getJSONArray("products").get(0)).get("prop2"));
      for(int k=0;k<arraySize;k++){ 
        for(int j=0;j<=PArray.size()-1;j++){
   		  found=0;
   		  if(PArray.get(j).equals((String)((JSONObject)jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("prop2"))){
   			  found=1;
   			  break;
   		  }
   	    }   
   	   
   	    if (found==0){
   	    	
 			   PArray.add((String)((JSONObject)jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("prop2"));
 			  
   	    }

   	  }
      
      if(PArray.size()>0)
      {
    	  if((PArray.size()==1)&&(PArray.get(0).equals("")))
    	  {
    		  
    	  }
    	  else
    	  {
    		  writer.println(
    		    		 "<div style='cursor:pointer' class='designtog' data-toggle='collapse' id='me' data-target='#demo2'>Property2<span style='float:right;' class='glyphicon glyphicon-chevron-down'></span></div>"+
    		    	       "<div id='demo2' class='collapse'>"+
    		    	       "<div style='margin-left:10px;'>");
    		  
    		  for(int s=0;s<PArray.size();s++){
            	  if(!PArray.get(s).equals("")){ 
                    writer.println( "<div class='checkbox'>"+
    	                     "<label><input type='checkbox' value='"+PArray.get(s)+"' name='prop2'>"+PArray.get(s)+"</label>"+
    	                     "</div>"
                    );
            	  }  
      		   }

    		  writer.println( "</div>"+
                      "</div>"+
                       "<hr>");

    	  }
      }
      
  
PArray.clear();
found=0;




     PArray.add((String)((JSONObject)jObjProductList.getJSONObject("productsList").getJSONArray("products").get(0)).get("prop3"));
     for(int k=0;k<arraySize;k++){ 
         for(int j=0;j<=PArray.size()-1;j++){
    		  found=0;
    		  if(PArray.get(j).equals((String)((JSONObject)jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("prop3"))){
    			  found=1;
    			  break;
    		  }
    	    }   
    	   
    	    if (found==0){
    	    
     			   PArray.add((String)((JSONObject)jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("prop3"));
     	    
    		}

    	  }

     if(PArray.size()>0)
     {
   	  if((PArray.size()==1)&&(PArray.get(0).equals("")))
   	  {
   		  
   	  }
   	  else
   	  {
   		  writer.println(
   		    		 "<div style='cursor:pointer' class='designtog' data-toggle='collapse' id='me' data-target='#demo3'>Property3<span style='float:right;' class='glyphicon glyphicon-chevron-down'></span></div>"+
   		    	       "<div id='demo3' class='collapse'>"+
   		    	       "<div style='margin-left:10px;'>");
   		  
   		  for(int s=0;s<PArray.size();s++){
           	  if(!PArray.get(s).equals("")){ 
                   writer.println( "<div class='checkbox'>"+
   	                     "<label><input type='checkbox' value='"+PArray.get(s)+"' name='prop3'>"+PArray.get(s)+"</label>"+
   	                     "</div>"
                   );
           	  }  
     		   }

   		  writer.println( "</div>"+
                     "</div>"+
                      "<hr>");

   	  }
     }
     

PArray.clear();
found=0;

     PArray.add((String)((JSONObject)jObjProductList.getJSONObject("productsList").getJSONArray("products").get(0)).get("prop4"));
     for(int k=0;k<arraySize;k++){ 
         for(int j=0;j<=PArray.size()-1;j++){
    		  found=0;
    		  if(PArray.get(j).equals((String)((JSONObject)jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("prop4"))){
    			  found=1;
    			  break;
    		  }
    	    }   
    	   
    	    if (found==0){
    	  
     			   PArray.add((String)((JSONObject)jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("prop4"));
     	   
    		}

    	  }
 
     if(PArray.size()>0)
     {
   	  if((PArray.size()==1)&&(PArray.get(0).equals("")))
   	  {
   		  
   	  }
   	  else
   	  {
   		  writer.println(
   		    		 "<div style='cursor:pointer' class='designtog' data-toggle='collapse' id='me' data-target='#demo4'>Property4<span style='float:right;' class='glyphicon glyphicon-chevron-down'></span></div>"+
   		    	       "<div id='demo4' class='collapse'>"+
   		    	       "<div style='margin-left:10px;'>");
   		  
   		  for(int s=0;s<PArray.size();s++){
           	  if(!PArray.get(s).equals("")){ 
                   writer.println( "<div class='checkbox'>"+
   	                     "<label><input type='checkbox' value='"+PArray.get(s)+"' name='prop4'>"+PArray.get(s)+"</label>"+
   	                     "</div>"
                   );
           	  }  
     		   }

   		  writer.println( "</div>"+
                     "</div>"+
                      "<hr>");

   	  }
     }
     

PArray.clear();
found=0;



     PArray.add((String)((JSONObject)jObjProductList.getJSONObject("productsList").getJSONArray("products").get(0)).get("prop5"));
     for(int k=0;k<arraySize;k++){ 
         for(int j=0;j<=PArray.size()-1;j++){
    		  found=0;
    		  if(PArray.get(j).equals((String)((JSONObject)jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("prop5"))){
    			  found=1;
    			  break;
    		  }
    	    }   
    	   
    	    if (found==0){
    	    	
     			   PArray.add((String)((JSONObject)jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("prop5"));
     	    	
    		}

    	  }
     if(PArray.size()>0)
     {
   	  if((PArray.size()==1)&&(PArray.get(0).equals("")))
   	  {
   		  
   	  }
   	  else
   	  {
   		  writer.println(
   		    		 "<div style='cursor:pointer' class='designtog' data-toggle='collapse' id='me' data-target='#demo5'>Property5<span style='float:right;' class='glyphicon glyphicon-chevron-down'></span></div>"+
   		    	       "<div id='demo5' class='collapse'>"+
   		    	       "<div style='margin-left:10px;'>");
   		  
   		  for(int s=0;s<PArray.size();s++){
           	  if(!PArray.get(s).equals("")){ 
                   writer.println( "<div class='checkbox'>"+
   	                     "<label><input type='checkbox' value='"+PArray.get(s)+"' name='prop5'>"+PArray.get(s)+"</label>"+
   	                     "</div>"
                   );
           	  }  
     		   }

   		  writer.println( "</div>"+
                     "</div>"+
                      "<hr>");

   	  }
     }
     
           
           writer.println("<input type='button' class='btn btn1 btn-lg hidet' id='mysearch'   value='Click Me'>");
           
           
           
   

PArray.clear();
found=0;



 	 }
 	 else{
 		 
 		writer.println( 
 		        "<div style='cursor:pointer' class='designtog' data-toggle='collapse' data-target='#demo6'>Sort By Type<span style='float:right;' class='glyphicon glyphicon-chevron-down'></span></div>"+
 		        "<div id='demo6' class='collapse'>"+
 		          "<div style='margin-left:10px;'>");

 		 PArray.add((String)((JSONObject)jObjProductList.getJSONObject("productsList").getJSONArray("products").get(0)).get("productType"));
 		for(int k=0;k<arraySize;k++){ 
 	        for(int j=0;j<=PArray.size()-1;j++){
 	   		  found=0;
 	   		  if(PArray.get(j).equals((String)((JSONObject)jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("productType"))){
 	   			  found=1;
 	   			  break;
 	   		  }
 	   	    }   
 	   	   
 	   	    if (found==0){
 	   	    
 			   PArray.add((String)((JSONObject)jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("productType"));
 	   
 	   		}

 	   	  }
 
 		 
 		                 for(int s=0;s<PArray.size();s++){
 		                	if(!PArray.get(s).equals("")){
 			                     writer.println( "<div class='checkbox'>"+
 				                     "<label><input type='checkbox' value='"+PArray.get(s)+"' name='productType'>"+PArray.get(s)+"</label>"+
 				                     "</div>"
 			                     );
 			   		          }
 		                 }


 		                 
 		                       writer.println( "</div>"+
 		                       "</div>"+
 		                       "<hr>");

 		 
 		                      writer.println("<input type='button' class='btn btn1 btn-lg hidet' id='searchbytype' onclick='applyTypeFilter();'  value='Click Me'>");
 		                      

								
								 	 }


    
    

writer.println(   "</div>"+
"</aside>");

writer.println( "<article id='article'>"+
  
  "<div class='row rowcol'>");
    for(int k=0;k<arraySize;k++){
    	
    	int p,f;
    	float d;
    	
    	p=Integer.parseInt(((String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("price")));
    	d=Float.parseFloat((String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("discount"));
    	f=(int)(p-((d/100)*p));
    	
    	
    writer.println("<div class='col-md-3 col-xs-6 thumbnai extra'>"+
      "<div>"+
        "<a class='searchres' href='ProductDetailsFetch?productId="+(String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("productId")+"'>"+
          "<img class='img-responsive' src='"+c.getImgLoc()+(String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("productImageName")+"'  style='height:230px;'>"+
          "<p style='  width : 100%;overflow:hidden; display:inline-block;text-overflow: ellipsis;white-space: nowrap;'><b>"+(String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("productBrandName")+
          "&nbsp;"+(String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("productName")+
          "</b></p>"+
         "<p style='  width : 100%;overflow:hidden; display:inline-block;text-overflow: ellipsis;white-space: nowrap;'> <b><span style='color:grey'><del>&#8377 "+(String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("price")+
         "<del></span>&nbsp;&nbsp;&#8377 "+f+" <i>("+(String)((JSONObject) jObjProductList.getJSONObject("productsList").getJSONArray("products").get(k)).get("discount")+" % Off)</i></b>"+
        "</p>"+
        "</a>"+
      "</div>"+
    "</div>");    
    }
    
  writer.println("</div>"+
"</article>"+
"</main>"+
"</div>");
  
 if(flag==0){
	 
			writer.println("<div  onclick='filterDiv();' id='wantFilter' class='small'>"+
			  		   
			  "<a href='#'>"+
			  "<div class='fixed'>"+
			  "<center>"+
			  "<h4 id='FilterText'>"+
			  "Want to apply Filters"+
			  "</h4>"+
			  "</center>"+
			  "</div>"+
			  "</a>"+
			"</div>");
			 
			 writer.println("<div style='display:none' onclick='applyFilter();' id='applyButton' class='small'>"+
					  
			  "<a href='#'>"+
			  "<div class='fixed'>"+
			  "<center>"+
			  "<h4 id='FilterText'>"+
			  "Apply Filters"+
			  "</h4>"+
			  "</center>"+
			  "</div>"+
			  "</a>"+
			  
			
			  
			  
			  
			  
			"</div>");

	 
 }
 else{
	 
      writer.println("<div  onclick='typeFilterDiv();' id='typeFilter' class='small'>"+
     		   
		  "<a href='#'>"+
		  "<div class='fixed'>"+
		  "<center>"+
		  "<h4 id='FilterText'>"+
		  "Want to apply Type Filters"+
		  "</h4>"+
		  "</center>"+
		  "</div>"+
		  "</a>"+
		"</div>");
		 
		 writer.println("<div style='display:none' onclick='applyTypeFilter();' id='applyTypeFilterButton' class='small'>"+
				  
		  "<a href='#'>"+
		  "<div class='fixed'>"+
		  "<center>"+
		  "<h4 id='FilterText'>"+
		  "Apply Filters"+
		  "</h4>"+
		  "</center>"+
		  "</div>"+
		  "</a>"+
		  
		
		  
		  
		  
		  
		"</div>");
	 
	 
 }
 

          
	    
	    
	    
	  writer.println("</body>");
	    
      writer.println("</body>");
	  writer.println("</html>");
	    
	
		writer.flush();
		
	    }catch(Exception e){
	    	System.out.println("caught: "+e.getMessage());
	    	e.printStackTrace();
	    	
	    }
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
