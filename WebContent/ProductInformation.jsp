<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="packageB.Configuration"%> 
<jsp:useBean id="ConfigurationBean" scope="request" class="packageB.Configuration"></jsp:useBean>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/mycommonjs.js"></script>
<title>Product Description</title>
 <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap-social.min.css" rel="stylesheet">
	<link href="bootstrap/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<link rel="icon" href="/viapyarrr/Images/makeinindia.jpg">
  
	<link rel='stylesheet' media='screen and (min-width: 767px) and (max-width: 3000px)' href='css/styleproductinfo.css' />
	<link rel='stylesheet' media='screen and (min-width: 0px) and (max-width: 767px)' href='css/styleproductinfomin.css' />
	<link rel="stylesheet" type="text/css" href="stylefooter.css">
	<link rel="stylesheet" type="text/css" href="css/mystyle.css">

    
    <style>
@media (max-width: 767px) {
        .big {
            display: none;
        }
         .logo{ 
             position:fixed;
             top:5px;
             height:40px;
             width:40%;
          }  
    }
	 @media (min-width: 767px) {
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
           
              <a href="Cart.jsp"><div class="input-group-btn">
                <button type="button" class="btn btn-success btn-md form-control"><span class="glyphicon glyphicon-shopping-cart "></span><sup><span class="label label-danger">${sessionScope.itemsInCart}</span> </sup></button>
              </div></a>
           
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

<div class="wrap">
 
  <main>
 
    <aside id="style-4">
    <br><br><br><br>




  <div class="row">
  <div class="col-xs-12">
    <div class="thumbnail">
      <a href="#">
        <img src="<c:out value="${ConfigurationBean.getImgLoc()}${productImageName}"></c:out>"  alt="Lights" style="width:70%;height:70%">
        <div class="caption">
     <fmt:parseNumber var = "i" integerOnly = "true"  type = "number" value = "${price-discount/100*price}" />
          <p>
                        <br><br>
                        <c:out value="${productBrandName}"></c:out>
                        <c:out value="${productName}"></c:out>
                      <p>
                        <c:out value="${productCategory}"></c:out>
                      </p>
                      <p>&#8377;
                        <c:out value="${i}"></c:out>
                      </p>
        </div>
      </a>
    </div>
  </div>
</div>
<div class="big">
<div class"row">

<sql:setDataSource var="snapshot" driver="${ConfigurationBean.getJDBC_DRIVER()}"
      url="${ConfigurationBean.getDB_URL()}"
      user="${ConfigurationBean.getUSER()}"  password="${ConfigurationBean.getPASS()}"/>


<c:choose>
  <c:when test="${sessionScope.user != null}">
     
     
      
      
      <sql:query var="result" dataSource="${snapshot}">
                SELECT COUNT(customerId) AS checkCart FROM cart where customerId=${sessionScope.user} AND productId=${productId};
              </sql:query>
              
              <c:forEach items="${result.rows}" var="row">


 <c:choose>
  <c:when test="${row.checkCart==0}">
  <div class="col-md-6 col-xs-12" >
    <a id="cartURL" href="#"><button  type="button" class="btn1 btn-lg" name="${productId}" id="addToCart" ><span class="glyphicon glyphicon-shopping-cart"></span><span id="cartOption" >Cart It</span></button></a>
   </div>
    <div class="col-md-6 col-xs-12">
<a href="BuyProduct.jsp?productId=${productId}"><button type="button" class="btn1 btn-lg"><span class="glyphicon glyphicon-flash"></span> Buy Now</button></a>
</div>
  </c:when>
  
  <c:otherwise>
  <div class="col-md-6 col-xs-12" >
    <a href="Cart.jsp"><button  type="button" class="btn1 btn-lg" name="${productId}" id="goToCart" ><span class="glyphicon glyphicon-shopping-cart"></span><span id="cartOption" >Go To Cart</span></button></a>
    </div>
    <div class="col-md-6 col-xs-12">
<a href="BuyProduct.jsp?productId=${productId}"><button type="button" class="btn1 btn-lg"><span class="glyphicon glyphicon-flash"></span> Buy Now</button></a>
</div>
  </c:otherwise>
</c:choose>
</c:forEach>
            
  </c:when>
  <c:otherwise>
  <div class="col-md-6 col-xs-12" >
    <a href="Login.jsp?landingPage=${productId}"><button  type="button" class="btn1 btn-lg" name="${productId}" id="UaddToCart" ><span class="glyphicon glyphicon-shopping-cart"></span><span id="cartOption" >Cart It</span></button></a>
    </div>
    <div class="col-md-6 col-xs-12">
<a href="Login.jsp?landingPage=${productId}"><button type="button" class="btn1 btn-lg"><span class="glyphicon glyphicon-flash"></span> Buy Now</button></a>
</div>
  </c:otherwise>
  
</c:choose>



 

</div>
</div>



    </aside>
















 
    <article>
     

<div class="row">
<div class="col-xs-12">
<br>
<div align="center">
<h3>${productBrandName } ${productName } ${productType }</h3>

      
<h2><b>&#8377;<c:out value = "${i}" /></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<del><font color="green" size="5">&#8377;${price}</del>(${discount}% Off)</font></h2>

</div>

<br>
<sql:query var="result" dataSource="${snapshot}">
 SELECT productId,prop1,productImageName,productBrandName,productName FROM products where productCategory='${productCategory}' AND productBrandName='${productBrandName}' 
AND productType='${productType}' AND productName='${productName}';              
</sql:query>

<div style="margin-left:40px;">
<h3><font color="grey">Availability: </font><font color="green">${availability}</font></h3>
 
<h5>Variants</h5>
<div class="row">  
<c:forEach var="vrow" items="${result.rows}">
      <div class="col-md-2  col-xs-4">
         <a href="ProductDetailsFetch?productId=<c:out value="${vrow.productId}"></c:out> ">
          <img src="<c:out value='${ConfigurationBean.getImgLoc()}${vrow.productImageName}' />" class="variant"></a>
          <p><c:out value="${vrow.prop1}"></c:out></p>
      </div>&nbsp;&nbsp;          
  </c:forEach>
  </div>
  <h3>Features:</h3>
  <ul>
   <li>Category: ${productCategory}</li>
   <li>${prop1}</li>
   <li>${prop2}</li>
   <li>${prop3}</li>
   <li>${prop4}</li>
   <li>${prop5}</li>
  </ul>
  
  <h3>Description</h3>
   <ul>
    <li>${description}</li>
   </ul>

</div>
</div>

    </article>


  </main>

 
</div>


<div class="small">
  <div class="fixed">
  <div class="row">
  <div class="col-xs-12">

  <div class="btn-group btn-group-justified">
  
  
  
  
  
  <c:choose>
    <c:when test="${sessionScope.user != null}">
     <sql:query var="result" dataSource="${snapshot}">
                SELECT COUNT(customerId) AS checkCart FROM cart where customerId=${sessionScope.user} AND productId=${productId};
     </sql:query>
          <c:forEach items="${result.rows}" var="row">
            <c:choose>
			  <c:when test="${row.checkCart==0}">
			   <a href="#"  class="btn btn1 btn-primary" name="${productId}" id="SaddToCart" ><span class="glyphicon glyphicon-shopping-cart"></span><span id="ScartOption" >Add to Cart</span></a>
			   <a href="BuyProduct.jsp?productId=${productId}" class=" btn btn1 btn-primary"><span class="glyphicon glyphicon-flash"></span> Buy Now</a>
            </c:when>
            <c:otherwise>
               <a href="Cart.jsp"  class="btn btn1 btn-primary" name="${productId}" id="goToCart" ><span class="glyphicon glyphicon-shopping-cart"></span><span id="cartOption" >Go to Cart</span></a>
               <a href="BuyProduct.jsp?productId=${productId}" class=" btn btn1 btn-primary"><span class="glyphicon glyphicon-flash"></span> Buy Now</a>
            </c:otherwise>
         </c:choose>
        </c:forEach>
    </c:when>
  <c:otherwise>
    <a href="Login.jsp?landingPage=${productId}"  class="btn btn1 btn-primary" name="${productId}" id="UaddToCart" ><span class="glyphicon glyphicon-shopping-cart"></span><span id="cartOption" >Add to Cart</span></a>
    <a href="Login.jsp?landingPage=${productId}" class=" btn btn1 btn-primary"><span class="glyphicon glyphicon-flash"></span> Buy Now</a>
  </c:otherwise>
  
</c:choose>
  
   
    
    
    
    
     </div>
 
  </div>
</div>
</div></div>
</div>

<%@ include file="footer.html" %>


<!-- The folllowing script adds the product to cart and wishlist during a session -->

<script>
$(document).ready(function(){
	$("#addToCart").click(function(){
		$.ajax({
			url: 'AddToCart',
			data:{
				productId: $("#addToCart").attr("name"),
				customerId: ${sessionScope.user},
		        variant : "XL"
			},
			
			success: function(responseText){
				$("#cartOption").html(responseText);
				$("#ScartOption").html(responseText);
				$("#cartURL").attr('href',"Cart.jsp");
			}
	
    });
});
	
	$("#SaddToCart").click(function(){
		$.ajax({
			url: 'AddToCart',
			data:{
				productId: $("#addToCart").attr("name"),
				customerId: ${sessionScope.user},
				
		
			},
			
			success: function(responseText){
				$("#ScartOption").html(responseText);
				$("#cartOption").html(responseText);
				$("#SaddToCart").attr('href',"Cart.jsp");
			}
	
    });
});
	
	
	
	
	$("get id attribute of product").click(function(){
		$.ajax({
			url: 'AddToWishlist',
			data:{
				productId: $("id of wishlist button").attr("name"),
				customerId: $("#customerId").html()
			},
			
			success: function(responseText){
				
				//make a popup of added to wishlist
				$("#addToCart").val(responseText);
			}
		});
	});
	
	
	
	
});
</script>
<!-- This handles search -->
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
	   
	      
		   
		   
		   
		   
	  
   
	  
   
    	
    	
    
  
  </script>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>

</body>
</html>




