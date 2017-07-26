package packageB;

public class Configuration {
	
	
 	String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	String DB_URL="jdbc:mysql://localhost/MTDATABASE";
	String USER = "root";
	String PASS = "mayank";
	static String imgLoc = "file:///D:/KanMay/";
	static String outputImageLocation="D:/KanMay/";
	static String luceneIndexLocation="/lucene";
	
	
	/*String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL="jdbc:mysql://45.113.136.146:3306/sewara_mtdatabase";
	
	//Database credentials
    String USER = "mayanktushar";
	String PASS = "mayanktushar";
	
	static String imgLoc = "/productImages/";
	static String outputImageLocation="/home/sewara/webapps/ROOT/productImages/";
	static String luceneIndexLocation="/home/sewara/webapps/ROOT/lucene";*/
	
 
   
   


	public static String getImgLoc() {
		return imgLoc;
	}

	public static String getLuceneIndexLocation() {
		return luceneIndexLocation;
	}

	public static void setLuceneIndexLocation(String luceneIndexLocation) {
		Configuration.luceneIndexLocation = luceneIndexLocation;
	}

	public static String getOutputImageLocation() {
		return outputImageLocation;
	}

	public static void setOutputImageLocation(String outputImageLocation) {
		Configuration.outputImageLocation = outputImageLocation;
	}

	public void setImgLoc(String imgLoc) {
		this.imgLoc = imgLoc;
	}

	public String getJDBC_DRIVER() {
		return JDBC_DRIVER;
	}

	public void setJDBC_DRIVER(String jDBC_DRIVER) {
		JDBC_DRIVER = jDBC_DRIVER;
	}

	public String getDB_URL() {
		return DB_URL;
	}

	public void setDB_URL(String dB_URL) {
		DB_URL = dB_URL;
	}

	public String getUSER() {
		return USER;
	}

	public void setUSER(String uSER) {
		USER = uSER;
	}

	public String getPASS() {
		return PASS;
	}

	public void setPASS(String pASS) {
		PASS = pASS;
	}
	
	

}
