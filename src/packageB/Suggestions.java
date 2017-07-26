package packageB;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopScoreDocCollector;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.PreparedStatement;

/**
 * Servlet implementation class Suggestions
 */
@WebServlet("/Suggestions")
public class Suggestions extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BusinessFunctions bf = new BusinessFunctions();
	Configuration c=new Configuration();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Suggestions() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key = request.getParameter("keyWord");
		ArrayList<String> searchSug = new ArrayList<String>();
		JSONObject suggestions= new JSONObject();
		JSONArray suggestionArray = new JSONArray();
		
		
		
		try{
		  
			
			String LUCENE_INDEX_DIRECTORY = c.getLuceneIndexLocation();
			
			File file = new File(LUCENE_INDEX_DIRECTORY);
			
			Directory index = FSDirectory.open(file.toPath());
			
			StandardAnalyzer analyzer = new StandardAnalyzer();
			
			
							
			String query = key+"*";
			
			//QueryParser parser = new QueryParser("productName",analyzer);
			MultiFieldQueryParser parser = new MultiFieldQueryParser(new String[] {"productCategory","productBrandName", "productType", 
					                       "productName","prop1","prop2","prop3","prop4","prop5","description"}, new StandardAnalyzer()); 
			Query q = null;
			q=parser.parse(query);
			
			int hitsPerPage = 10;
			IndexReader reader=null;
			TopScoreDocCollector collector = null;
			IndexSearcher searcher = null;
			
			reader=DirectoryReader.open(index);
			searcher=new IndexSearcher(reader);
			
			collector = TopScoreDocCollector.create(10);
			searcher.search(q,collector);
			ScoreDoc[] hits=collector.topDocs().scoreDocs;
			System.out.println(hits.length);
			if(hits.length>0){
				System.out.println("chalaaaa");
				for(int i=0; i<hits.length; i++){
					int docId = hits[i].doc;
					//now get reference to document
					
					
					Document document = searcher.doc(docId);
					
					
					
					searchSug.add(document.get("productBrandName")+" in "+document.get("productName")+" ~"+key);
					searchSug.add(document.get("productBrandName")+" in "+document.get("productType")+" ~"+key);
					searchSug.add(document.get("productBrandName")+" in "+document.get("productCategory")+" ~"+key);
										

					
						
				//	System.out.println("BrandName is: "+document.get("productBrandName")+"and ProductName is: "+document.get("productName")+
					//		           "productCategory is: "+document.get("productCategory")+"and prop is:"+document.get("prop1"));
					
				}
				
				
				for(int i=0;i<10;i++){
					
					
	
						JSONObject suggestionObject = new JSONObject();
						
						suggestionObject.put("suggestion",searchSug.get(i));
						System.out.println(searchSug.get(i)+" ADDED TO LIST");
						suggestionArray.put(suggestionObject);
							
					
					
					
				}
				
				
				suggestions.put("Suggestions", suggestionArray);
				
				System.out.println(suggestions);
				
				PrintWriter writer = response.getWriter();
				writer.println(suggestions);
				writer.flush();
				
				
				
				
				
				
			}else{
				System.out.println("Na ho paya bhaiya");
			
			}
			
		}catch(Exception e){
			System.out.println("Na hua re...");
		
		}
		
		
		
		
		
		
		
		
		
		
	/*	try{
			Connection  con =bf.connect();
			String query = "SELECT productBrandName,productName,productType FROM products;";
			PreparedStatement pst = con.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				searchSug.add(rs.getString("productBrandName")+" in "+rs.getString("productType"));
				searchSug.add(rs.getString("productName")+" in "+rs.getString("productType"));
				for(int k=0;k<50;k++){
					searchSug.add(rs.getString("productBrandName")+" in "+rs.getString("productType"));
					searchSug.add(rs.getString("productName")+" in "+rs.getString("productType"));
				}
		    }
			
			for(int i=0;i<searchSug.size();i++){
				
				
				if(searchSug.get(i).matches("(?i:.*"+key+".*)")){
					JSONObject suggestionObject = new JSONObject();
					
					suggestionObject.put("suggestion",searchSug.get(i));
					System.out.println(searchSug.get(i)+" ADDED TO LIST");
					suggestionArray.put(suggestionObject);
						
				}
				
				
			}
			
			
			
			suggestions.put("Suggestions", suggestionArray);
			
			System.out.println(suggestions);
			
			PrintWriter writer = response.getWriter();
			writer.println(suggestions);
			writer.flush();
			
			
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace();
			
		}*/
		
		
		
			
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
