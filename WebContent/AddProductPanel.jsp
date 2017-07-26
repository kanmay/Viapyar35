<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="packageB.BusinessFunctions"%>
 <%@page import="packageB.Configuration"%>
 <%@page import="java.sql.*" %>  
 <%@page import="java.io.*" %>  
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
<title>Add Products</title>
<style>

ul.products li {
    width: 200px; /* adjust the size of the catalog block */
    display: inline-block; /* this creates the catalog effect */
    text-align: center; /* align the image to center */
    background-color:#282828 ; /* background color of each */
    font-family: "Trebuchet MS", Helvetica, sans-serif; 
    border-radius: 10px; /* rounded borders effect */
    border: 2px solid #585858; /* border and color */
    
    
}
ul li span {

   color: blue;
   position: relative;
   top: 150px;   

}

</style>
</head>
<body>

<div>

 <ul class="products">
     <a href="AdminAddProducts.jsp"> <li>
       <input type="image" src="art.jpg" height="150" width="150">
        <p>Kanika is my Name</p>
        <p>I am Doctor</p>
      </li></a>
    <%try{
    	 Connection conn = new BusinessFunctions().connect();
    	 String query = "SELECT * FROM PRODUCTS";
    	 PreparedStatement pst = conn.prepareStatement(query);
    	 ResultSet rs = pst.executeQuery(query);
    	 while(rs.next()){
    		 String image = rs.getString(2)+".jpg";
    		
    		 
    		%> <li>
    	        <img src = "<%=Configuration.getImgLoc()+rs.getString(2) %>" height="150" width="150">
    	       <a href="EditProducts.jsp?productid=<%=rs.getInt(1)%>"><span  class="glyphicon glyphicon-pencil"></span></a>
    	        <p><h4><%=rs.getString(3)+" "+rs.getString(5)+" "+rs.getString(6) %></h4></p>
    	        <p>&#8377<%=" "+rs.getInt("price") %></p> 
    	      </li>
    		 
    	 <% }
    		 
    
    }catch(Exception e){
    System.out.println(e.getMessage());
    e.printStackTrace();
    }
    %>
   
      
 
 </ul>


</div>

</body>
</html>