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
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Delivery Details</title>
    <!-- Bootstrap -->
    <link rel="icon" href="/viapyarrr/Images/makeinindia.jpg">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    <link href="bootstrap/css/bootstrap-social.min.css" rel="stylesheet">
    <link href="bootstrap/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="css/styledeliveryadd.css">
    <link rel="stylesheet" type="text/css" href="css/stylefooter.css">
    <style>
      @media (max-width: 1001px) {
      .big{
      display: none;
      }
        .logo{ 
       position:fixed;
       top:5px;
       height:40px;
       width:40%;
       
      }  
      }
      @media (min-width: 1001px) {
      .small {
      display: none;
      }
        .logo{ 
       position:fixed;
       top:10px;
       height:10%;
       width:17%;
        
       
      }
      }
    </style>
</head>
<c:if test="${sessionScope.user == null}">
    <c:redirect url="Login.jsp"/>
</c:if>
<body>
    <c:choose>
         <c:when test="${sessionScope.user == null}">
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
                        <li><a href="Signup.jsp"><span class="glyphicon glyphicon-user"></span><sup><span class="glyphicon glyphicon-plus"></span> </sup>Sign up</a></li>
                        <li><a href="Login.jsp"><span class="glyphicon glyphicon-user"></span>Log in</a></li>
                     </ul>
                  </div>
                  <div class="row">
                     <div class=" col-xs-offset-2 col-xs-4 div3">
                        <div class="form-group">
                           <input type="text" class="form-control" id="searchBox" list="suggestions" placeholder="Search">
                        </div>
                     </div>
                     <div class="col-xs-1 div3">
                        <div class="row">
                           <div class="col-xs-6">
                              <div class="input-group-btn">
                                 <button class="btn btn-default inline form-control search"  type="button">
                                 <i class="glyphicon glyphicon-search "></i>
                                 </button>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-xs-1">
                        <div class="input-group-btn">
                           <button type="button" class="btn btn-success btn-md form-control"><span class="glyphicon glyphicon-shopping-cart "></span><sup><span class="label label-danger">${sessionScope.itemsInCart}</span> </sup></button>
                        </div>
                     </div>
                  </div>
               </nav>
            </div>
         </c:when>
         <c:otherwise>
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
                        <li><a href="OrderDetails.jsp"><span class="glyphicon glyphicon-list-alt"></span> My Orders</a></li>
                        <li><a href="Logout"><span class="glyphicon glyphicon-user"></span>Logout</a></li>
                     </ul>
                  </div>
                  <div class="row">
                     <div class=" col-xs-offset-2 col-xs-4 div3">
                        <div class="form-group">
                           <input type="text" class="form-control" id="searchBox" list="suggestions" placeholder="Search">
                        </div>
                     </div>
                     <div class="col-xs-1 div3">
                        <div class="row">
                           <div class="col-xs-6">
                              <div class="input-group-btn">
                                 <button class="btn btn-default inline form-control search"  type="button">
                                 <i class="glyphicon glyphicon-search "></i>
                                 </button>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-xs-1">
                        <a href="Cart.jsp">
                           <div class="input-group-btn">
                              <button type="button" class="btn btn-success btn-md form-control"><span class="glyphicon glyphicon-shopping-cart "></span><sup><span class="label label-danger">${sessionScope.itemsInCart}</span> </sup></button>
                           </div>
                        </a>
                     </div>
                  </div>
               </nav>
            </div>
         </c:otherwise>
      </c:choose>
    
    <datalist id="suggestions"></datalist>
   <div id="cataloguediv"> 
   <br><br>
    <br><br>
    <div class="container">
    <div class="panel">
    <div class="panel-heading"> <h3>Delivery Details<span class="glyphicon glyphicon-shopping-cart"></span></h3></div>
    <div class="panel-body">
    <form action="HandleOrder" method="post">
    
    <input type="text" name="email" value="${sessionScope.email}" style="display:none">
    <c:choose>
  <c:when test="${param.ordercount==0}">
      <input type="text" name="customerId" value="${sessionScope.user}" style="display:none">
      <input type="text" name="ordercount" value="${param.ordercount}" style="display:none">
      <input type="text" name="productId" value="${param.productId}" style="display:none">
      <input type="text" name="price" value="${param.price}" style="display:none">
      <input type="text" name="discount" value="${param.discount}" style="display:none">
      <input type="text" name="cashback" value="${param.cashback}" style="display:none">
      <input type="text" name="quantity" value="${param.quantity}" style="display:none">
      <input type="text" name="amount" value="${param.quantity*param.price}" style="display:none">
      <input type="text" name="product" value="${param.product}" style="display:none">
      
           
      
  </c:when>
  
  <c:otherwise>
     
   
    
      <input type="text" name="ordercount" value="${param.ordercount}" style="display:none">
      <sql:setDataSource var="snapshot" driver="${ConfigurationBean.getJDBC_DRIVER()}"
      url="${ConfigurationBean.getDB_URL()}"
      user="${ConfigurationBean.getUSER()}"  password="${ConfigurationBean.getPASS()}"/> 
      
       <sql:query var="result" dataSource="${snapshot}">
      
SELECT products.productId,products.productImageName,products.productBrandName,
products.productName,products.productType,products.discount,products.price,
products.cashback,cart.quantity FROM cart
INNER JOIN products ON products.productId = cart.productId 
AND cart.customerId = "${sessionScope.user}";              </sql:query>
      
           <input type="text" name="customerId" value="${sessionScope.user}" style="display:none">
     <div style="display:none"> 
 
      <c:forEach var="row" items="${result.rows}" varStatus="loop">
           <input type="text" name="productId<c:out value="${loop.index+1}"/>" value="${row.productId}" >
           <input type="text" name="price<c:out value="${loop.index+1}"/>" value="${row.price}">
           <input type="text" name="discount<c:out value="${loop.index+1}"/>" value="${row.discount}">
           <input type="text" name="cashback<c:out value="${loop.index+1}"/>" value="${row.cashback}">
           <input type="text" name="quantity<c:out value="${loop.index+1}"/>" value="${row.quantity}">
           <input type="text" name="amount<c:out value="${loop.index+1}"/>" value="${row.quantity*row.price}">
           <input type="text" name="product<c:out value="${loop.index+1}"/>" value="${row.productBrandName} ${row.productName}">
           
     </c:forEach>
     </div>
     
     
      
  </c:otherwise>
</c:choose>
       
    
    <div class="row">
	<div data-ng-app="" data-ng-init=""> 
    <div class="col-md-6 col-xs-12">
    <fieldset class="scheduler-border">
    <legend class="scheduler-border">Your Details</legend>
    
    <div class="form-group">
    <label for="Address">Address</label>
    <input type="text" class="form-control" id="UAddress" name="UAddress" value="${sessionScope.address}" ng-model="address">
    </div>
    <div class="row">
    <div class="col-md-4">
    <div class="form-group" style="display:inline;">
    <label for="pwd">City</label>
    <input type="text" class="form-control" id="UCity" name="UCity" ng-model="city">
    </div></div>
    <div class="col-md-4">
    <div class="form-group" style="display:inline;">
    <label for="pwd">State</label>
    <input type="text" class="form-control" id="UState" name="UState" ng-model="state">
    </div></div>
    <div class="col-md-4">
    <div class="form-group" style="display:inline;">
    <label for="pwd">Zip (PIN Code)</label>
    <input type="text" class="form-control" id="UZip" name="UZip" ng-model="zip">
    </div></div></div>
    <br>
    <div class="row">
    <div class="col-md-6">
    <div class="form-group">
    <label for="Phone">Phone No.</label>
    <input type="number" class="form-control" id="UPhone" name="UPhone" ng-model="phone">
    </div></div></div>
    <br><br><br>
    
    </fieldset>
    </div>
    <div class="col-md-6 col-xs-12">
    <fieldset class="scheduler-border">
    <legend class="scheduler-border">Receiver's Details</legend>
    <div class="form-group">
    <label for="Address">Name</label>
    <input type="text" class="form-control" id="RName" name="RName">
    </div> 
    <div class="form-group">
    <label for="Address">Address</label>
    <input style="height:100px;" type="text" class="form-control" id="RAddress" name="RAddress" value={{address}}&nbsp;{{city}}&nbsp;{{state}}&nbsp;{{zip}}>
    </div>
    <div class="row">
    <div class="col-md-6">
    <div class="form-group">
    <label for="Phone">Phone No.</label>
    <input type="number" class="form-control" id="RPhone" name="RPhone" value="">
    </div></div></div>
    
    </fieldset>
	</div>
    </div>
    </div>
    <fieldset class="scheduler-border">
    <legend class="scheduler-border">Payment Method</legend>
    <div class="row">
    <div class="col-md-6 col-xs-12">
    <center>
    <div class="radio">
    <div class="btn1 btn-lg" style="background-color:orange;">
    <label style="font-size: 1em">
    <input type="radio" name="paymentMode" value="COD" checked>
    <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
    Cash on Delivery
    </div>
    </label>
    </div>
    </center>
    </div>
    <div class="col-md-6 col-xs-12">
    <center>
    <div class="radio">
    <div class="btn1 btn-lg" style="background-color:green;">
    <label style="font-size: 1.0em">
    <input type="radio" name="paymentMode" value="Online">
    <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
    Pay Online
    </div>
    </label>
    </div>
    </center>
    </div></div>
   	
    </fieldset>
    <center>
   <button type="submit" onClick="return validateDeliveryDetails();" class="btn1 btn-lg" style="width:30%;">Order</button>
    </center>
    </form>
    </div>
    </div>
    </div>
    
    </div>
    <%@ include file="footer.html" %>
    
    
    
    
     <!-- This script handles the search -->
      
       <script>
   
	//searchbox in head   
	 
	   $(".search").click(function(){
		   $.ajax({
			   type: "POST",
			   url: "TestSearch",
			   dataType: "text",
			   data: {search: $("#searchBox").val(),
				     myFilter1: "viapyar"  
			   
			   },
			 
			   success: function(response){
				   var myObj = $.parseHTML(response);
				   
				   
				  
                   $("#cataloguediv").html(myObj);
   
		       }
		   })
	   });
	
	 //search on Enter click
       $('#searchBox').keypress(function(event){
           if(event.keyCode == 13){
            $('.search').click();
           }
       });
	 
	//suggestions generator
	
	   $("#searchBox").keyup(function(){
		   $.ajax({
			   type: "GET",
			   url: "Suggestions",
			   data: {keyWord: $("#searchBox").val()},
			   success: function(response){
				   var myObj = $.parseJSON(response);
				   $("#suggestions").html("");
				   for(var i=0;i<myObj.Suggestions.length;i++){
				   $("#suggestions").append('<option value="'+myObj.Suggestions[i].suggestion+'">');
				   
				   }
			   }
		   })
		   
	   });
	   
	   
	   
	   
	   function filterDiv(){
			  
		   $("#myButton").attr('class', '');
		   document.getElementById("article").style.display="none";
		   document.getElementById("aside").style.display="block";
		  
		   document.getElementById("wantFilter").style.display="none";
		   document.getElementById("applyButton").style.display="block";

		   }
	   

	   
	   //filter For samll screen
	   
	   $(document).on('click','#applyButton',function(){
	 
	 
		   document.getElementById("aside").style.display="none";
	 
		  
		   
           var propertyFilter = [];
           $.each($("input[name='prop1']:checked"), function(){            
               propertyFilter.push($(this).val());
           });
          
         
           
           $.each($("input[name='prop2']:checked"), function(){            
           	 propertyFilter.push($(this).val());
           });
           
           
           
           $.each($("input[name='prop3']:checked"), function(){            
           	 propertyFilter.push($(this).val());
           });
           
           
          
           $.each($("input[name='prop4']:checked"), function(){            
           	 propertyFilter.push($(this).val());
           });
           
           
           
           $.each($("input[name='prop5']:checked"), function(){            
           	 propertyFilter.push($(this).val());
           });
           
		   
		   
		   $.ajax({
			   type: "POST",
			   url: "ReturnResults",
			   dataType: "text",
			   data: {search: $("#searchBox").val(),
				     myFilter: JSON.stringify(propertyFilter),
				     myFilter1: "mayu"
			   
			   },
			 
			   success: function(response){
				   var myObj = $.parseHTML(response);
				   
				   
				  
                   $("#article").html(myObj);
                   
			   
		       }
		   })
		   
		   document.getElementById("article").style.display="";
		   document.getElementById("applyButton").style.display="none";
		   document.getElementById("wantFilter").style.display="";
	   });

//
 function typeFilterDiv(){
	
	   $("#myButton").attr('class', '');
	   document.getElementById("aside").style.display="block";
	   document.getElementById("article").style.display="none";
	  
	   document.getElementById("typeFilter").style.display="none";
	   document.getElementById("applyTypeFilterButton").style.display="block";

	   

}




//filter based on type for small screen   
$(document).on('click','#applyTypeFilterButton',function(){
		   
		   alert("Submitting");
           var typeFilter = [];
           $.each($("input[name='productType']:checked"), function(){            
               typeFilter.push($(this).val());
           });
          
         
           
           
		   
		   
		   $.ajax({
			   type: "POST",
			   url: "TestSearch",
			   dataType: "text",
			   data: {search: $("#searchBox").val(),
				     myFilter: JSON.stringify(typeFilter),
				     myFilter1: "mayu"
			   
			   },
			 
			   success: function(response){
				   var myObj = $.parseHTML(response);
				   
				   
				  
                   $("#cataloguediv").html(myObj);
                   		   
		       }
		   })
	   });


	   //property filter
	   $(document).on('click','#mysearch',function(){
		   
		   alert("Submitting");
           var propertyFilter = [];
           $.each($("input[name='prop1']:checked"), function(){            
               propertyFilter.push($(this).val());
           });
          
         
           
           $.each($("input[name='prop2']:checked"), function(){            
           	 propertyFilter.push($(this).val());
           });
           
           
           
           $.each($("input[name='prop3']:checked"), function(){            
           	 propertyFilter.push($(this).val());
           });
           
           
          
           $.each($("input[name='prop4']:checked"), function(){            
           	 propertyFilter.push($(this).val());
           });
           
           
           
           $.each($("input[name='prop5']:checked"), function(){            
           	 propertyFilter.push($(this).val());
           });
           
		   
		   
		   $.ajax({
			   type: "POST",
			   url: "ReturnResults",
			   dataType: "text",
			   data: {search: $("#searchBox").val(),
				     myFilter: JSON.stringify(propertyFilter),
				     myFilter1: "mayu"
			   
			   },
			 
			   success: function(response){
				   var myObj = $.parseHTML(response);
				   
				   
				  
                   $("#article").html(myObj);
   
		       }
		   })
	   });

	   
	//filter based on type   
$(document).on('click','#searchbytype',function(){
		   
		   alert("Submitting");
           var typeFilter = [];
           $.each($("input[name='productType']:checked"), function(){            
               typeFilter.push($(this).val());
           });
          
         
           
           
		   
		   
		   $.ajax({
			   type: "POST",
			   url: "TestSearch",
			   dataType: "text",
			   data: {search: $("#searchBox").val(),
				     myFilter: JSON.stringify(typeFilter),
				     myFilter1: "mayu"
			   
			   },
			 
			   success: function(response){
				   var myObj = $.parseHTML(response);
				   
				   
				  
                   $("#cataloguediv").html(myObj);
                   
              }
		   })
	   });
         
         //validate delivery details
function validateDeliveryDetails(){
		
		var UAddress=document.getElementById("UAddress").value;
		var UCity = document.getElementById("UCity").value;
		var UState = document.getElementById("UState").value;
		var UZip = document.getElementById("UZip").value;
		var UPhone = document.getElementById("UPhone").value;
		var RName= document.getElementById("RName").value;
	    var RAddress= document.getElementById("RAddress").value;
	    var RPhone= document.getElementById("RPhone").value;
		
		if(!UAddress.replace(/^\s+/g, '').length){
			 document.getElementById("UAddress").style.borderColor="#FF0000";
				 document.getElementById("UAddress").focus();
			 return false;
		 }
		 else{
			 document.getElementById("UAddress").style.borderColor="#2874A6"
			 
		 }
		 if(!UCity.replace(/^\s+/g, '').length){
			 document.getElementById("UCity").style.borderColor="#FF0000";
			 document.getElementById("UCity").focus();
			 return false;
		 } else{
			 document.getElementById("UCity").style.borderColor="#2874A6";
		 }
		 if(!UState.replace(/^\s+/g, '').length){
			 document.getElementById("UState").style.borderColor="#FF0000";
			 document.getElementById("UState").focus();
			 return false;
		 } else{
			 document.getElementById("UState").style.borderColor="#2874A6"
		 }
		 if(!UZip.replace(/^\s+/g, '').length){
			 document.getElementById("UZip").style.borderColor="#FF0000";
			 document.getElementById("UZip").focus();
			 return false;
		 } else{
			 document.getElementById("UZip").style.borderColor="#2874A6";
		 }
		 if(!UPhone.replace(/^\s+/g, '').length){
			 document.getElementById("UPhone").style.borderColor="#FF0000";
			 document.getElementById("UPhone").focus();
			 return false;
		 } else{
			 document.getElementById("UPhone").style.borderColor="#2874A6";
		 }
		 if(!RName.replace(/^\s+/g, '').length){
			 document.getElementById("RName").style.borderColor="#FF0000";
			 document.getElementById("RName").focus();
			 return false;
		 } else{
			 document.getElementById("RName").style.borderColor="#2874A6";
		 }
		 if(!RAddress.replace(/^\s+/g, '').length){
			 document.getElementById("RAddress").style.borderColor="#FF0000";
			 document.getElementById("RAddress").focus();
			 return false;
		 } else{
			 document.getElementById("RAddress").style.borderColor="#2874A6";
		 }
		 if(!RPhone.replace(/^\s+/g, '').length){
			 document.getElementById("RPhone").style.borderColor="#FF0000";
			 document.getElementById("RPhone").focus();
			 return false;
		 } else{
			 document.getElementById("RPhone").style.borderColor="#2874A6";
		 }
		
	}

 </script>
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>




