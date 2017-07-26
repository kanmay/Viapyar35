<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>    
<%@page import="java.sql.*" %> 
<jsp:useBean id="ConfigurationBean" scope="request" class="packageB.Configuration"></jsp:useBean>


 <%@page import="packageB.BusinessFunctions"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit Product</title>
 <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<link href="bootstrap/css/bootstrap-social.min.css" rel="stylesheet">
	<link href="bootstrap/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<script src="/jquery-3.1.1.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	
   <link rel="stylesheet" type="text/css" href="styledeliveryadd.css">
	<link rel='stylesheet' media='screen and (min-width: 767px) and (max-width: 2000px)' href='css/stylefilter.css' />
	<link rel='stylesheet' media='screen and (min-width: 0px) and (max-width: 767px)' href='css/filtermin.css' />
		<link rel="stylesheet" type="text/css" href="css/stylefooter.css">
    <style>
@media (max-width: 767px) {
        .big {
            display: none;
        }
    }
	 @media (min-width: 767px) {
        .small {
            display: none;
        }
    }
   
   aside{
   overflow-y: hidden;
   }
     a:link {
    text-decoration: none;
}

a:visited {
    text-decoration: none;
}

a:hover {
    text-decoration: none;
}

a:active {
    text-decoration: none;
}
   
    
    </style>



</head>
<body>

<c:set var="productId"  value="${param.productId}"/>



<sql:setDataSource var="snapshot" driver="${ConfigurationBean.getJDBC_DRIVER()}"
     url="${ConfigurationBean.getDB_URL()}"
     user="${ConfigurationBean.getUSER()}"  password="${ConfigurationBean.getPASS()}"/>
      <sql:query var="result" dataSource="${snapshot}">
   SELECT * FROM products WHERE productid=${productId}
  </sql:query> 
 <c:forEach var="row" items="${result.rows}">
    <center><img src="<c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />" style="width:170px;height:200px"></center>
    <br><br>
    
    <form action="UpdateProducts" method="POST" id="updateForm">
     <center> 
     <table cellspacing="20">
      <tr>
        <td> Product id:<input type="text" name="productId" id="pid" value="<c:out value="${row.productId}"></c:out>" readonly></td>
        <td>Category:<input type="text" name="productCategory" value="<c:out value="${row.productCategory}"></c:out>"></td>
        <td>BrandName: <input type="text" name="productBrandName" value="<c:out value="${row.productBrandName}"></c:out>"></td> 
	  </tr>
	  
	  <tr>
	    <td>ProductType: <input type="text" name="productType" value="<c:out value="${row.productType}"></c:out>"></td>
	    <td>ProductName:<input type="text" name="productName" value="<c:out value="${row.productName}"></c:out>"></td>
        <td>prop1<input type="text" name="prop1" value="<c:out value="${row.prop1}"></c:out>"></td>
	  </tr>
	  
	  <tr>
	    <td>prop2<input type="text" name="prop2" value="<c:out value="${row.prop2}"></c:out>"></td>
	    <td>prop3<input type="text" name="prop3" value="<c:out value="${row.prop3}"></c:out>"></td>
	    <td>prop4<input type="text" name="prop4" value="<c:out value="${row.prop4}"></c:out>"></td>
	  </tr>
	  
	  <tr>
	    <td>prop5<input type="text" name="prop5" value="<c:out value="${row.prop5}"></c:out>"></td>
	    <td>description<input type="text" name="description" value="<c:out value="${row.description}"></c:out>"></td>
	    <td>price<input type="number" name="price" value="<c:out value="${row.price}"></c:out>"></td>
	  </tr>  
	 
	   <tr>
	    <td>discount<input type="number" name="discount" value="<c:out value="${row.discount}"></c:out>"></td>
	    <td>cashback<input type="number" name="cashback" value="<c:out value="${row.cashback}"></c:out>"></td>
	    <td>availability<input type="text" name="availability" value="<c:out value="${row.availability}"></c:out>"></td>
	   </tr> 
	 </table>
	 
	 <input type="button"  value="DeleteProduct" name="update" onclick="delFun();" />
	 
	 <input type="submit" value="Update" name="update"/>
	 </form>
      </center> 
  </c:forEach>
  
  
<!--  <div class="div1">
   <nav class="navbar navbar-default nav1 navbar-fixed-top">
   <div class="navbar-header">       
     <button type="button" class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse">
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span> 
     </button>
    </div>
    <div class="navbar-collapse collapse">
    <ul class="nav navbar-nav navbar-right ul1">
   
     <li><a href="signup.jsp"><span class="glyphicon glyphicon-user"></span><sup><span class="glyphicon glyphicon-plus"></span> </sup>Sign up</a></li>
     <li><a href="login.jsp"><span class="glyphicon glyphicon-user"></span>log in</a></li>
    </ul>
   </div>
<div class="row">
<div class=" col-xs-offset-2 col-xs-4 div3">
<form>
  <div class="form-group">
    
    <input type="text" class="form-control" id="email"  placeholder="Search">
  </div>
  
  </div>







  <div class="col-xs-1 div3">
        <div class="input-group-btn">
          <button class="btn2 btn-default inline" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
           </div>
</div>
<div class="col-xs-2">
   <a href="cart.html">
<div class="input-group-btn">
       <button type="button" class="btn2 btn-success btn-md"><span class="glyphicon glyphicon-shopping-cart"></span><sup><span class="label label-danger">${sessionScope.itemsInCart}</span> </sup></button>
        </div>   </a>
</div>
     </div>
 
</nav>
</div>
   








<div class="wrap">
 
  <main>
 
    <aside id="aside">
    <br><br><br>


  
  
  <h3 style="padding-left:2px">Admin Panel</h3>
  <hr>
  
  <a href=""><div style="cursor:pointer" class="designtog">Today's Orders<span style="float:right;" class="glyphicon glyphicon-chevron-right"></span></div></a>
  <hr>
  <a href="ModifyProducts.jsp"><div style="cursor:pointer" class="designtog activepage">Modify Products<span style="float:right;" class="glyphicon glyphicon-chevron-right"></span></div></a>
  <hr>
  <a href="CustomerRecord.jsp"><div style="cursor:pointer" class="designtog">Customer Record<span style="float:right;" class="glyphicon glyphicon-chevron-right"></span></div></a>
  <hr>
  <a href="ProductsSales.jsp"><div style="cursor:pointer" class="designtog">Products Sales<span style="float:right;" class="glyphicon glyphicon-chevron-right"></span></div></a>
  <hr>
  <a href=""><div style="cursor:pointer" class="designtog">All Orders<span style="float:right;" class="glyphicon glyphicon-chevron-right"></span></div></a>
  <hr>
  
  

  
  <hr> 
  
 
 </aside>



<article>
<br><br>
     
     <c:forEach var="row" items="${result.rows}">
     <div style="height:150px;width:150px">
    <img src="file:///D:/KanMay/<c:out value="${row.productImageName}"></c:out>">
    </div>
    <form action="UpdateProducts" method="POST" id="updateForm">

    <fieldset class="scheduler-border">
    <legend class="scheduler-border">Product Details</legend>
    

    <div class="row">
    <div class="col-md-4">
    <div class="form-group" style="display:inline;">
    <label for="pwd">Product Id</label>
    <input type="text" class="form-control" name="productId" id="pid" value="<c:out value="${row.productId}"></c:out>" readonly>
    </div></div>
    <div class="col-md-4">
    <div class="form-group" style="display:inline;">
    <label for="pwd">Product Category</label>
    <input type="text" class="form-control" name="productCategory" id="productCategory" value="<c:out value="${row.productCategory}"></c:out>" >
    </div></div>
    <div class="col-md-4">
    <div class="form-group" style="display:inline;">
    <label for="pwd">Brand Name</label>
    <input type="text" class="form-control" name="productBrandName" id="productBrandName" value="<c:out value="${row.productBrandName}"></c:out>">
    </div></div>
    <div class="col-md-4">
    <div class="form-group" style="display:inline;">
    <label for="pwd">Product Type</label>
    <input type="text" class="form-control" name="productType" id="productType" value="<c:out value="${row.productType}"></c:out>" >
    </div></div>
	 <div class="col-md-4">
    <div class="form-group" style="display:inline;">
    <label for="pwd">Product Name</label>
    <input type="text" class="form-control" name="productName" id="productName" value="<c:out value="${row.productName}"></c:out>">
    </div></div>
	 <div class="col-md-4">
    <div class="form-group" style="display:inline;">
    <label for="pwd">Prop 1</label>
    <input type="text" class="form-control" name="prop1" id="prop1" value="<c:out value="${row.prop1}"></c:out>">
    </div></div>
	 <div class="col-md-4">
    <div class="form-group" style="display:inline;">
    <label for="pwd">Prop 2</label>
    <input type="text" class="form-control" name="prop2" id="prop2" value="<c:out value="${row.prop2}"></c:out>">
    </div></div>
	 <div class="col-md-4">
    <div class="form-group" style="display:inline;">
    <label for="pwd">Prop 3</label>
    <input type="text" class="form-control" name="prop3" id="prop3" value="<c:out value="${row.prop3}"></c:out>">
    </div></div>
	 <div class="col-md-4">
    <div class="form-group" style="display:inline;">
    <label for="pwd">Prop 4</label>
    <input type="text" class="form-control" name="prop4" id="prop4"  value="<c:out value="${row.prop4}"></c:out>">
    </div></div>
	 <div class="col-md-4">
    <div class="form-group" style="display:inline;">
    <label for="pwd">Prop 5</label>
    <input type="text" class="form-control" name="prop5" id="prop5" value="<c:out value="${row.prop5}"></c:out>" >
    </div></div>
		 <div class="col-md-4">
    <div class="form-group" style="display:inline;">
    <label for="pwd">Price</label>
    <input type="number" class="form-control"  name="price" id="price" value="<c:out value="${row.price}"></c:out>">
    </div></div>
		 <div class="col-md-4">
    <div class="form-group" style="display:inline;">
    <label for="pwd">Discount</label>
    <input type="number" class="form-control" name="discount" id="discount" value="<c:out value="${row.discount}"></c:out>">
    </div></div>
    
    <div class="col-md-4">
    <div class="form-group" style="display:inline;">
    <label for="pwd">Cashback</label>
    <input class="form-control" type="number" name="cashback" id="cashback" value="<c:out value="${row.cashback}"></c:out>">
    </div></div>
    
		 <div class="col-md-4">
    <div class="form-group" style="display:inline;">
    <label for="pwd">Availability</label>
    <input  class="form-control" type="text" name="availability" id="availability" value="<c:out value="${row.availability}"></c:out>">
    </div></div>
		 
	
	
	
	</div>
	    <div class="form-group">
    <label for="Address">Description</label>
    <textarea type="text" class="form-control" name="description" id="description" ><c:out value="${row.description}"></c:out></textarea>
    </div>
    <br>
    <button type="submit" onclick="return ValidateProductsEdit();" class="btn1 btn-lg" value="Update" name="update">Submit</button>
    <button type="button" class="btn1 btn-lg" value="DeleteProduct" name="update" onclick="delFun();">Delete</button>
    
    </fieldset>
    </form>
    
    </c:forEach>
 </article>


  </main>

 
</div>


  
 <br><br><br><br>
  
  

  
  <div onclick="filterDiv();" class="small">
  
  <a href="#">
  <div class="fixed">
  <center>
  <h4 >
  Want to apply Filters
  </h4>
  </center>
  </div>
  </a>
 </div>





<script>
function filterDiv(){
 $("#myButton").attr('class', '');
 document.getElementById("article").style.display="none";

 }
 
</script>-->




 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
  
  
  
  
  
  


<script>
	    function delFun(){
	    	if(confirm("Delete?")==true){
	    		
	    		var proId = document.getElementById("pid").value;
	    		document.getElementById("updateForm").action= "DeleteProduct?productId="+proId
	    		document.getElementById("updateForm").submit();
	    	}
	    }
	   
</script>
<!-- validating upload product form -->
<script>

  
function ValidateProductsEdit(){
	 var productCategory = document.getElementById("productCategory").value;
	 var productBrandName = document.getElementById("productBrandName").value;
	 var productType = document.getElementById("productType").value;
	 var productName = document.getElementById("productName").value;
	 var prop1 = document.getElementById("prop1").value;
	 var prop2 = document.getElementById("prop2").value;
	 var prop3 = document.getElementById("prop3").value;
	 var prop4 = document.getElementById("prop4").value;
	 var prop5 = document.getElementById("prop5").value;
	 var price = document.getElementById("price").value;
	 var discount = document.getElementById("discount").value;
	 var cashback = document.getElementById("cashback").value;
	 var availability = document.getElementById("availability").value;
	 var description = document.getElementById("description").value;
	 
	 if(!productCategory.replace(/^\s+/g, '').length){
		 document.getElementById("productCategory").style.borderColor="#FF0000"
			 document.getElementById("productCategory").focus();
	  return false;
		 
	 }else{
		 document.getElementById("productCategory").style.borderColor="#0000FF"
	 }
	
	 if(!productBrandName.replace(/^\s+/g, '').length){
		 document.getElementById("productBrandName").style.borderColor="#FF0000"
	     document.getElementById("productBrandName").focus();
			 return false;
	 }
	 else {
		 document.getElementById("productBrandName").style.borderColor="#0000FF"
	
	 }
	 if(!productType.replace(/^\s+/g, '').length){
		 document.getElementById("productType").style.borderColor="#FF0000"
			 document.getElementById("productType").focus(); 
		 return false;
		 
	 }else{
		 document.getElementById("productType").style.borderColor="#0000FF"
		 
		 
	 }
	 if(!productName.replace(/^\s+/g, '').length){
		 document.getElementById("productName").style.borderColor="#FF0000"
			 document.getElementById("productName").focus();
		 return false;
	 }
	 else{
		 document.getElementById("productName").style.borderColor="#0000FF"
		 
	 }if(!prop1.replace(/^\s+/g, '').length){
		 document.getElementById("prop1").style.borderColor="#FF0000"
			 document.getElementById("prop1").focus();
		 return false;
	 }
	 else{
		 document.getElementById("prop1").style.borderColor="#0000FF"
		 
	 }if(!prop2.replace(/^\s+/g, '').length){
		 document.getElementById("prop2").style.borderColor="#FF0000"
			 document.getElementById("prop2").focus();
		 return false;
	 }
	 else{
		 document.getElementById("prop2").style.borderColor="#0000FF"
		 
	 }if(!(parseInt(price,10)>0)){
		 document.getElementById("price").style.borderColor="#FF0000"
			 document.getElementById("price").focus();
		 return false;
	 }
	 else{
		 document.getElementById("price").style.borderColor="#0000FF"
		 
	 }if(!(parseInt(discount,10)>0)){
		 document.getElementById("discount").style.borderColor="#FF0000"
		 document.getElementById("discount").focus();
		 return false;
	 }
	 else{
		 document.getElementById("discount").style.borderColor="#0000FF"
		 
	 }
	 if(!(parseInt(cashback,10)>0)){
		 document.getElementById("cashback").style.borderColor="#FF0000"
			 document.getElementById("cashback").focus();
		 return false;
	 }
	 else{
		 document.getElementById("cashback").style.borderColor="#0000FF"
		 
	 }if(!availability.replace(/^\s+/g, '').length){
		 document.getElementById("availability").style.borderColor="#FF0000"
			 document.getElementById("availability").focus();
		 return false;
	 }
	 else{
		 document.getElementById("availability").style.borderColor="#0000FF"
		 
	 }if(!description.replace(/^\s+/g, '').length){
		 document.getElementById("description").style.borderColor="#FF0000"
			 document.getElementById("description").focus();
		 return false;
	 }
	 else{
		 document.getElementById("description").style.borderColor="#0000FF"
		 
	 }
	 
	 
	 
	 
	 
}

 
 
 </script>






</body>
</html>
