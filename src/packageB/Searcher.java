package packageB;


import java.io.File;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopScoreDocCollector;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import org.json.JSONArray;
import org.json.JSONObject;

public class Searcher {
	
	Configuration c=new Configuration();
	
	UtilityFunctions uf=new UtilityFunctions();
	
	JSONObject searchEngine(String userQuery,String[] sortingFilters){
		
	try{
		    JSONArray jArray = new JSONArray();
			
			String LUCENE_INDEX_DIRECTORY = c.getLuceneIndexLocation();
			
			File file = new File(LUCENE_INDEX_DIRECTORY);
			
			Directory index = FSDirectory.open(file.toPath());
			
			StandardAnalyzer analyzer = new StandardAnalyzer();
			userQuery=uf.mySearchString(userQuery);
			
			String searchConstraints="";
			System.out.println("sizeeeeeeeeeee "+sortingFilters.length);
			for(int i=0;sortingFilters[i]!=null;i++){
				searchConstraints=searchConstraints+"  "+sortingFilters[i]+"  ";
			}
			System.out.println("NEw Alogo: "+searchConstraints);
			
			String query = userQuery+" AND ("+searchConstraints+")";
			System.out.println("Prints: "+searchConstraints);
			
			//QueryParser parser = new QueryParser("productName",analyzer);
			MultiFieldQueryParser parser = new MultiFieldQueryParser(new String[] {"productCategory","productBrandName", "productType", 
					                       "productName","prop1","prop2","prop3","prop4","prop5","price","description"}, new StandardAnalyzer()); 
			Query q = null;
			q=parser.parse(query);
			
			int hitsPerPage = 100;
			IndexReader reader=null;
			TopScoreDocCollector collector = null;
			IndexSearcher searcher = null;
			
			reader=DirectoryReader.open(index);
			searcher=new IndexSearcher(reader);
			
			collector = TopScoreDocCollector.create(100);
			searcher.search(q,collector);
			ScoreDoc[] hits=collector.topDocs().scoreDocs;
			System.out.println(hits.length);
			if(hits.length>0){
				System.out.println("chalaaaa");
				for(int i=0; i<hits.length; i++){
					int docId = hits[i].doc;
					//now get reference to document
					Document document = searcher.doc(docId);
					
					JSONObject jObj= new JSONObject();
					
					jObj.put("productId",document.get("productId"));
		             jObj.put("productImageName",document.get("productImageName"));
		             jObj.put("productBrandName",document.get("productBrandName"));
		             jObj.put("productType",document.get("productType"));
		             jObj.put("productName",document.get("productName"));
		             jObj.put("productCategory",document.get("productCategory"));
		             jObj.put("prop1",document.get("prop1"));
		             jObj.put("prop2",document.get("prop2"));
		             jObj.put("prop3",document.get("prop3"));
		             jObj.put("prop4",document.get("prop4"));
		             jObj.put("prop5",document.get("prop5"));
		             jObj.put("description",document.get("description"));
		             jObj.put("price",document.get("price"));
		             jObj.put("discount",document.get("discount"));
		             jObj.put("cashback",document.get("cashback"));
		             jObj.put("availability",document.get("availability"));
		             
		             jArray.put(jObj);
					
				//	System.out.println("BrandName is: "+document.get("productBrandName")+"and ProductName is: "+document.get("productName")+
					//		           "productCategory is: "+document.get("productCategory")+"and prop is:"+document.get("prop1"));
					
				}
				
				JSONObject jObjProduct = new JSONObject();
				jObjProduct.put("products",jArray);
				JSONObject jObjProductList = new JSONObject();
				jObjProductList.put("productsList",jObjProduct);
				
				System.out.println(jObjProductList);
				
				return jObjProductList;
				
				
				
				
			}else{
				System.out.println("Na ho paya bhaiya");
				return null;
			}
			
		}catch(Exception e){
			System.out.println("Na hua rerr...");
			return null;
		}
		
		
	

	}

	
	JSONObject searchEngine(String userQuery){
		
		try{
			
				String s1=userQuery;  
				
				userQuery=uf.mySearchString(userQuery);
				    
			    
			
			
			    JSONArray jArray = new JSONArray();
				
				String LUCENE_INDEX_DIRECTORY = c.getLuceneIndexLocation();
				
				File file = new File(LUCENE_INDEX_DIRECTORY);
				
				Directory index = FSDirectory.open(file.toPath());
				
				StandardAnalyzer analyzer = new StandardAnalyzer();
				
				
								
				String query = userQuery;
				
				//QueryParser parser = new QueryParser("productName",analyzer);
				MultiFieldQueryParser parser = new MultiFieldQueryParser(new String[] {"productCategory","productBrandName", "productType", 
						                       "productName","prop1","prop2","prop3","prop4","prop5","price","description"}, new StandardAnalyzer()); 
				Query q = null;
				q=parser.parse(query);
				
				int hitsPerPage = 100;
				IndexReader reader=null;
				TopScoreDocCollector collector = null;
				IndexSearcher searcher = null;
				
				reader=DirectoryReader.open(index);
				searcher=new IndexSearcher(reader);
				
				collector = TopScoreDocCollector.create(100);
				searcher.search(q,collector);
				ScoreDoc[] hits=collector.topDocs().scoreDocs;
				System.out.println(hits.length);
				if(hits.length>0){
					System.out.println("chalaaaa");
					for(int i=0; i<hits.length; i++){
						int docId = hits[i].doc;
						//now get reference to document
						Document document = searcher.doc(docId);
						
						JSONObject jObj= new JSONObject();
						
						jObj.put("productId",document.get("productId"));
			             jObj.put("productImageName",document.get("productImageName"));
			             jObj.put("productBrandName",document.get("productBrandName"));
			             jObj.put("productType",document.get("productType"));
			             jObj.put("productName",document.get("productName"));
			             jObj.put("productCategory",document.get("productCategory"));
			             jObj.put("prop1",document.get("prop1"));
			             jObj.put("prop2",document.get("prop2"));
			             jObj.put("prop3",document.get("prop3"));
			             jObj.put("prop4",document.get("prop4"));
			             jObj.put("prop5",document.get("prop5"));
			             jObj.put("description",document.get("description"));
			             jObj.put("price",document.get("price"));
			             jObj.put("discount",document.get("discount"));
			             jObj.put("cashback",document.get("cashback"));
			             jObj.put("availability",document.get("availability"));
			             
			             jArray.put(jObj);
						
					//	System.out.println("BrandName is: "+document.get("productBrandName")+"and ProductName is: "+document.get("productName")+
						//		           "productCategory is: "+document.get("productCategory")+"and prop is:"+document.get("prop1"));
						
					}
					
					JSONObject jObjProduct = new JSONObject();
					jObjProduct.put("products",jArray);
					JSONObject jObjProductList = new JSONObject();
					jObjProductList.put("productsList",jObjProduct);
					
					System.out.println(jObjProductList);
					
					return jObjProductList;
					
					
					
					
				}else{
					System.out.println("Na ho paya bhaiya");
					return null;
				}
				
			}catch(Exception e){
				System.out.println("Na huaaaaa re...");
				return null;
			}
			
			
		

		}

	
	
		
	public static void main(String[] args){
		Searcher s = new Searcher();
		//s.searchEngine("Natural Flower mhu");
	}
		
}


