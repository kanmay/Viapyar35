
package packageB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.document.StringField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.IndexWriterConfig.OpenMode;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopScoreDocCollector;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.store.RAMDirectory;



public class IndexBuilder {
	static Configuration c = new Configuration();
	static final String LUCENE_INDEX_DIRECTORY = c.getLuceneIndexLocation();
	static final String DB_HOST_NAME = "localhost";
	static final String DB_USER_NAME = c.getUSER();
	static final String DB_PASSWORD = c.getPASS();
	static final String DB_URL = c.getDB_URL();
	
	int productId;
	String productImageName;
	String productCategory;
	String productType;
	String productBrandName;
	String productName;
	String prop1;
	String prop2;
	String prop3;
	String prop4;
	String prop5;
	String description;
	int price;
	float discount;
	float cashback;
	String availability;
	
	File file = new File (LUCENE_INDEX_DIRECTORY);
	
	//method for indexing
		public void buildIndex(){
	 
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
			IndexWriter writer=null;
			StandardAnalyzer analyzer = null;		
			
			
			analyzer = new StandardAnalyzer();
			
		
			
			
			IndexWriterConfig config = new IndexWriterConfig(analyzer);
			  config.setOpenMode(OpenMode.CREATE);

			try{
				System.out.println("Start indexing");
				//get a reference to index directory filejdbc:mysql://localhost/MTDATABASE
				
				
				writer =  new IndexWriter(FSDirectory.open(file.toPath()), config);
				
				//initialize the driver class
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				//get connection object
				con = DriverManager.getConnection(
						DB_URL,
						DB_USER_NAME, DB_PASSWORD);
				//create statement object
				stmt = con.createStatement();
				//execute query
				rs = stmt.executeQuery("SELECT * FROM products");
				//iterate through result set
				while(rs.next()){
					productId = rs.getInt("productId");
					productImageName = rs.getString("productImageName");
					productCategory = rs.getString("productCategory");
					productBrandName = rs.getString("productBrandName");
					productType = rs.getString("productType");
					productName = rs.getString("productName");
					prop1 = rs.getString("prop1");
					prop2 = rs.getString("prop2");
					prop3 = rs.getString("prop3");
					prop4 = rs.getString("prop4");
					prop5 = rs.getString("prop5");
					description = rs.getString("description");
					price = rs.getInt("price");
					discount = rs.getFloat("discount");
					cashback = rs.getFloat("cashback");
					availability = rs.getString("availability");
					
					//create a full text field which contains name,
					//age and designation
					String fulltext = productId + " " + productImageName +
					" " + productCategory+" "+productBrandName+" "+productType+
					" " + productName + " "+prop1+" "+prop2+" "+prop3+" "+prop4+" "+prop5+
					" "+description+" "+price+" "+discount+" "+cashback+" "+availability;
					
					
					/*doc.add(new StringField("id",
							Integer.toString(id), StringField.Store.YES));
							doc.add(new TextField("title", title,
							TextField.Store.YES));
							w.addDocument(doc);*/
	 
					//create document object
					
					
					addDoc(writer,productId,productImageName,productCategory,productBrandName,productType,
				            productName,prop1,prop2,prop3,prop4,prop5,description,price,discount,cashback,availability);
				    
					
					System.out.println("hhhhhhh");
					
				}
					
				
				writer.close();

            }catch(Exception e){
    			e.printStackTrace();
    		}finally{
    			try{
    				if(writer!=null)
    					writer.close();
    				if(rs!=null)
    					rs.close();
    				if(stmt!=null)
    					stmt.close();
    				if(con!=null)
    					con.close();
    				System.out.println("Finished indexing");
     
    			}catch(Exception ex){
    				ex.printStackTrace();
    			}
     
    		}
     
     
    	}
		public static void main(String[] args) throws Exception {
			 
			IndexBuilder builder = new IndexBuilder();
			builder.buildIndex();
		}
		





private  void addDoc(IndexWriter w, int productId, String productImageName,String productCategory,String productBrandName,String productType,
		            String productName,String prop1,String prop2,String prop3,String prop4,String prop5,
		            String description,int price,float discount,float cashback,String availability) throws IOException {
  Document doc = new Document();
    doc.add(new StringField("productId",Integer.toString(productId), StringField.Store.YES));
    
    doc.add(new StringField("productImageName",productImageName,StringField.Store.YES));
	
	doc.add(new TextField("productCategory",productCategory,TextField.Store.YES));
	
	doc.add(new TextField("productBrandName",productBrandName,TextField.Store.YES));
	
	doc.add(new TextField("productType",productType,TextField.Store.YES));
	
	doc.add(new TextField("productName",productName,TextField.Store.YES));
	
	doc.add(new TextField("prop1",prop1,TextField.Store.YES));
	
	doc.add(new TextField("prop2",prop2,TextField.Store.YES));
	
	doc.add(new TextField("prop3",prop3,TextField.Store.YES));
	
	doc.add(new TextField("prop4",prop4,TextField.Store.YES));
	
	doc.add(new TextField("prop5",prop5,TextField.Store.YES));
	
	doc.add(new TextField("description",description,TextField.Store.YES));
	
	doc.add(new StringField("price",Integer.toString(price),StringField.Store.YES));
	
	doc.add(new StringField("discount",Float.toString(discount),StringField.Store.YES));
	
	doc.add(new StringField("cashback",Float.toString(cashback),StringField.Store.YES));
	
	doc.add(new StringField("availability",availability,StringField.Store.YES));
	
    w.addDocument(doc);
}


}
