<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>   
<%@page import="packageB.Configuration"%> 
<jsp:useBean id="ConfigurationBean" scope="request" class="packageB.Configuration"></jsp:useBean>
<sql:setDataSource var="snapshot" driver="${ConfigurationBean.getJDBC_DRIVER()}"
      url="${ConfigurationBean.getDB_URL()}"
      user="${ConfigurationBean.getUSER()}"  password="${ConfigurationBean.getPASS()}"/> 
          
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
 <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<link href="bootstrap/css/bootstrap-social.min.css" rel="stylesheet">
	<link href="bootstrap/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<script src="js/jquery-3.1.1.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
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
        .wrappe
        {
        white-space:normal;}
    }
   
   aside{
   overflow-y: hidden;
   }
    
    </style>

</head>

<c:if test="${!sessionScope.user=='rashatu'}">
      <c:redirect url="AdminLogin.jsp"/>
</c:if>

<sql:query var="result" dataSource="${snapshot}">
      
SELECT orderdetails.orderId,customer.fname,customer.lname,products.productbrandname,
products.productname,products.price,orderdetails.quantity,orderdetails.orderstatus,customer.address FROM orderdetails
INNER JOIN products ON products.productId = orderdetails.productId 
INNER JOIN customer ON customer.customerId = orderdetails.customerId WHERE orderdetails.orderstatus!="Delivered";

</sql:query>

<body>


<div class="div1">
   <nav class="navbar navbar-default nav1 navbar-fixed-top">
     <a href="Home.jsp"> <img class="logo img-responsive" src="/viapyarrr/Images/ViapyarLogo.png"/></a>
   <div class="navbar-header">       
     <button type="button" class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse">
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span> 
     </button>
    </div>
    <div class="navbar-collapse collapse">
    <ul class="nav navbar-nav navbar-right ul1">
   
     <li><a href="signup.html"><span class="glyphicon glyphicon-user"></span><sup><span class="glyphicon glyphicon-plus"></span> </sup>Sign up</a></li>
     <li><a href="login.html"><span class="glyphicon glyphicon-user"></span>log in</a></li>
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
       <button type="button" class="btn2 btn-success btn-md"><span class="glyphicon glyphicon-shopping-cart"></span><sup><span class="label label-danger">3</span> </sup></button>
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
  
  <div style="cursor:pointer" class="designtog activepage floatdesigntog">Today's Orders<span style="float:right;" class="glyphicon glyphicon-chevron-right"></span></div>
  <hr>
  <div style="cursor:pointer" class="designtog floatdesigntog">Modify Products<span style="float:right;" class="glyphicon glyphicon-chevron-right"></span></div>
  <hr>
  <div style="cursor:pointer" class="designtog floatdesigntog">Customer Record<span style="float:right;" class="glyphicon glyphicon-chevron-right"></span></div>
  <hr>
  <div style="cursor:pointer" class="designtog floatdesigntog">Products Sales<span style="float:right;" class="glyphicon glyphicon-chevron-right"></span></div>
  <hr>
  <div style="cursor:pointer" class="designtog floatdesigntog">All Orders<span style="float:right;" class="glyphicon glyphicon-chevron-right"></span></div>
  <hr>
  
  

  
  <hr> 
  
 
  
  
  
  
  
  
  
  
  
  
  
  


























    </aside>



<article>
<br><br><br>
<div class="table-responsive">  
<table class="table table-hover">
          <thead>
      <tr>
        <th>Order Id</th>
        <th>Customer's Name</th>
        <th>Product Name</th>
        <th>Qty</th>
        <th>Price</th>
        <th>Del. Add.</th>
        <th>Order Status</th>
	    
      </tr>
    </thead>
    <tbody>

 <c:forEach var="row" items="${result.rows}" varStatus="loop" >
 
         
             <tr id="tr<c:out value="${loop.index}"/>">
             <td width="7%"><p id="row<c:out value="${loop.index}"/>">${row.orderid}</p></td>
        <td width="12%">${row.fname} ${row.lname}
        
		</td>
		<td width="20%" style="white-space:normal;"> ${row.productBrandName} ${row.productName} ${row.productType} 
        
		</td>
		
        <td width="5%">${row.quantity}</td>
        <td width="10%">RS. ${row.price}</td>
       <td width="15%" style="white-space:normal;">${row.address} &nbsp;<span class="dat"></span></td> 
		<td width="15%"><div class=" btn btn1" id="orderStatus<c:out value="${loop.index}"/>" onclick="updateOrderStatus(${loop.index})">${row.orderstatus}</div>
		</td>
		
      </tr>
             
          </c:forEach>    
    
      </tbody>
      </table>

</div>

    </article>


  </main>

 
</div>








  
  
 <br><br><br><br>
  
  

  
  




<script>
function filterDiv(){
 $("#myButton").attr('class', '');
 document.getElementById("article").style.display="none";

 }
 
 
 //changes orderstatus
  function updateOrderStatus(index){

    
	   
		    $.ajax({
			 	   url: "UpdateOrderStatus",
			 	   type: "post",
			 	   data: {
			 		   currentOrderStatus: $("#orderStatus"+index).html(),
			 		   orderId: $("#row"+index).html()
			 	   },
			 	   
			 	   success: function(response){
			 		   
			 		  $("#orderStatus"+index).html(response)
			 		  if(response==="Delivered"){
			 			  $("#tr"+index).hide();
			 		  }
			 	   }
			    });
		       
   }
 
</script>




 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>

</body>
</html>
