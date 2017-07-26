<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql" %> 
<%@page import="packageB.Configuration"%> 
 
<jsp:useBean id="ConfigurationBean" scope="request" class="packageB.Configuration"></jsp:useBean> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
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
</style>

</head>
<body>

 <c:if test="${customerId!=null}">
  
  <p>Hiee..<c:out value="${fname}"></c:out></p>
  
  
  </c:if>
  
  <p id="name"><p>
  <p id="statu">hieeee<p>
 
  
<sql:setDataSource var="snapshot" driver="${ConfigurationBean.getJDBC_DRIVER()}"
     url="${ConfigurationBean.getDB_URL()}"
     user="${ConfigurationBean.getUSER()}"  password="${ConfigurationBean.getPASS()}"/>
  <sql:query var="result" dataSource="${snapshot}">
   SELECT * FROM products;
  </sql:query>  
  
    <ul class="products">  
  <c:forEach var="row" items="${result.rows}">
                    <a href="ProductDetailsFetch?productId=<c:out value="${row.productId}"></c:out> "><li>
                    <img src="<c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />" width="150px" height="150px">
                    <p><c:out value="${row.productBrandName}"></c:out></p>
                    <p><c:out value="${row.productName}"></c:out></p>
                    <p><c:out value="${row.productType}"></c:out></p></li></a>
                 
  </c:forEach>
 
    </ul>



  
 
<script>

	

   window.fbAsyncInit = function() {
     FB.init({
      appId      : '379190129103410',
      xfbml      : true,
      version    : 'v2.8'
     });
  
   
   FB.getLoginStatus(function(response) {
	   if (response.status === 'connected') {
	     FB.api('/me', {fields: 'first_name,last_name,email'},function(response) {
			   document.getElementById("name").innerHTML=response.email;
				console.log('Hello ' + response.name);
			});
	   }
	   else {
		   document.getElementById("name").innerHTML="You are not logged in";
		   console.log(response);
	   }
	   
	   

	   
	 },true);
   
  
   
   
   };
   
   (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk/debug.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
   
  
   
  
</script>



</body>
</html>