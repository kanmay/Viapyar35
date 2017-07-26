<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>  
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="packageB.Configuration"%> 
<jsp:useBean id="ConfigurationBean" scope="request" class="packageB.Configuration"></jsp:useBean>
<sql:setDataSource var="snapshot" driver="${ConfigurationBean.getJDBC_DRIVER()}"
   url="${ConfigurationBean.getDB_URL()}"
   user="${ConfigurationBean.getUSER()}"  password="${ConfigurationBean.getPASS()}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
      <title>My Cart</title>
      <!-- Bootstrap -->
      <link rel="icon" href="/viapyarrr/Images/makeinindia.jpg">
      <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
      <link href="css/mystyle.css" rel="stylesheet">
      <script src="js/jquery-3.1.1.min.js"></script>
      <link href="bootstrap/css/bootstrap-social.min.css" rel="stylesheet">
      <link href="bootstrap/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
      <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
      <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
      <link rel="stylesheet" type="text/css" href="css/stylecart.css">
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
      <div class="big">
         <br><br>
      </div>
      <div class="big">
         <div class="container">
            <div class="panel">
               <div class="panel-heading">
                  <h3>CART <span class="glyphicon glyphicon-shopping-cart"></span></h3>
               </div>
             
               <sql:query var="result1" dataSource="${snapshot}">
                           Select COUNT(*) as cartItems from cart where customerId="${sessionScope.user}";
                </sql:query>
                
                <c:forEach var="rows" items="${result1.rows}" varStatus="loop" >
                    <c:set var = "cartCount" scope = "page" value = "${rows.cartItems}"/>
                </c:forEach>
                
                
                 <c:choose>
			         <c:when test="${pageScope.cartCount==0 }">
			          <center>  <h1><i>Your Cart is Empty </i><p style="color:blue">&#9785;</p></h1></center>
			          
			         <div class="row">
                       <div class="col-xs-3"></div>
                        <div class="col-xs-3"></div>
                        <div class="col-xs-3"></div>
                        <div class="col-xs-3">
                        <a href="Home.jsp">
                         <button type="button" class="btn1 btn-lg"><span class="glyphicon glyphicon-menu-left"></span><span class="glyphicon glyphicon-menu-left"></span> Continue Shopping</button></a>
                        </div>
                      
                  </div>
			    
			         </c:when>
			 
			         <c:otherwise>
			         
			         <div class="panel-body">
                  <table class="table table-hover">
                     <thead>
                        <tr>
                           <th>Item</th>
                           <th>Price</th>
                           <th>Quantity</th>
                           <th>Delivery Details</th>
                           <th>Subtotal</th>
                        </tr>
                     </thead>
                     <tbody>
                        <sql:query var="result" dataSource="${snapshot}">
                           SELECT products.productId,products.productImageName,products.productBrandName,
                           products.productName,products.productType,products.discount,products.price,
                           products.cashback,cart.quantity FROM cart
                           INNER JOIN products ON products.productId = cart.productId 
                           AND cart.customerId = "${sessionScope.user}";
                        </sql:query>
                        <c:forEach var="row" items="${result.rows}" varStatus="loop" >
                      <fmt:parseNumber var = "i" integerOnly = "true"  type = "number" value = "${row.price-row.discount/100*row.price}" />
                           <tr>
                              <td width="37%">
                                 <a href="ProductDetailsFetch?productId=<c:out value='${row.productId}'/>">
                                    <img src="<c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />" style="width:100px; height:100px; float:left; padding:5px;">
                                    <input type="text" value="${row.productId}" id="productId<c:out value="${loop.index}"/>" style="display:none"/>
                                    <h5><span>${row.productBrandName} </span><span>${row.productName} </span><span>${row.productType} </span></h5>
                                    <p>${row.Discount}% Off</p>
                                 </a>
                              </td>
                              <td width="12%">&#8377;${i}
                              </td>
                              <td width="12%">
                                 <div style="width:50%;" class="input-group spinner">
                                    <input type="text" id="spinnerText<c:out value="${loop.index}"/>" class="form-control" max="10" min="1" value="${row.quantity}">
                                    <div class="input-group-btn-vertical">
                                       <button type="button" class="btn btn-default"  onClick="SpinnerUp(${loop.index})"><i class="fa fa-caret-up"></i></button>
                                       <button type="button" class="btn btn-default"  onClick="SpinnerDown(${loop.index})"><i class="fa fa-caret-down"></i></button>
                                    </div>
                                 </div>
                              </td>
                              <td width="20%">Delivery: &nbsp;<span class="dat"></span></td>
                              <td width="15%">&#8377;${i*row.quantity}
                              </td>
                              <td width="4%">
                                 <span style="cursor:pointer;" class="glyphicon glyphicon-remove" onClick="DeleteFromCart(${loop.index})"></span>
                              </td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
                  <div class="div4" align="right">
                     <sql:query var="totalAmount" dataSource="${snapshot}">
                       SELECT (SUM(FLOOR(products.price-(products.discount*products.price/100)) * cart.quantity)) AS amount 
                        FROM cart INNER JOIN products ON products.productId = cart.productId 
                        AND cart.customerId = ${sessionScope.user };
                     </sql:query>
                     <c:forEach var="trow" items="${totalAmount.rows}" >
                        <h2>Estimated Total: &#8377; ${trow.amount}</h2>
                     </c:forEach>
                     <sql:query var="totalitems" dataSource="${snapshot}">
                         SELECT 
                        Count(*) AS items 
                        FROM cart
                        INNER
                        JOIN products
                        ON products.productId = cart.productId 
                        AND cart.customerId = ${sessionScope.user};
                     </sql:query>
                     <c:forEach var="titems" items="${totalitems.rows}" >
                        <c:set var="itemscount" scope="session" value="${titems.items}"/>
                     </c:forEach>
                  </div>
                  <div class="row">
                     <div class="col-xs-3"></div>
                     <div class="col-xs-3"></div>
                     <div class="col-xs-3">
                        <a href="Home.jsp">
                        <button type="button" class="btn1 btn-lg"><span class="glyphicon glyphicon-menu-left"></span><span class="glyphicon glyphicon-menu-left"></span> Continue Shopping</button></a>
                     </div>
                     <div class="col-xs-3">
                        <a href="DeliveryDetails.jsp?ordercount=${itemscount}"><button type="button" class="btn1 btn-lg"><span class="glyphicon glyphicon-send"></span>Place Order</button></a>
                     </div>
                  </div>
               </div>
			         
			         </c:otherwise>
			    </c:choose>


                
               
               
               

            </div>
         </div>
      </div>
      <div class="small">
         <h3 class="h21">Cart <span class="glyphicon glyphicon-shopping-cart"></span></h3>
         <br>
         <hr>
         <c:choose>
			         <c:when test="${pageScope.cartCount==0 }">
			          <center>  <h1><i>Your Cart is Empty </i><p style="color:blue">&#9785;</p></h1></center>
			          
			          <div class="fixed">
				        <div class="row">
				        <div class="col-xs-12">
				        <div class="btn-group btn-group-justified">
				        <a href="Home.jsp"  class="btn btn1 btn-primary"><span class="glyphicon glyphicon-menu-left"></span><span class="glyphicon glyphicon-menu-left"></span>Continue Shopping</a>
				        
				        </div>
				        </div>
				        </div>
				      </div>
			    
			         </c:when>
			 
	     <c:otherwise>
         
         <c:forEach var="row" items="${result.rows}" varStatus="loop" >
           
           <fmt:parseNumber var = "i" integerOnly = "true"  type = "number" value = "${row.price-row.discount/100*row.price}" />
            <div class="thumbnail">
               <table>
                  <tr>
                     <td width="35%" colspan="2">
                        <img src="<c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />" style="width:100px;height:100px;">
                     </td>
                     <input type="text" value="${row.productId}" id="SproductId<c:out value="${loop.index}"/>" style="display:none"/>
                     <td width="60%" >
                        <span>${row.productBrandName}</span><span>${row.productName}</span><span>${row.productType}</span>
                        <p style="font-size:10px;">${row.Variant}</p>
                       <p>&#8377;${i} &nbsp;<del>&#8377;${row.price}</del>(${row.Discount}% Off)</p>
                     </td>
                     <td width="5%" style="vertical-align: top;"><span class="glyphicon glyphicon-remove" style="cursor:pointer" onClick="DeleteFromCart(${loop.index})" ></span></td>
                  </tr>
                  <tr>
                     <td width="10%">
                        <br>
                        <b>Qty&nbsp;</b>
                        <div style="width:100%" class="input-group spinner">
                           <input type="text" id="SspinnerText<c:out value="${loop.index}"/>" class="form-control" value="${row.quantity}">
                           <div class="input-group-btn-vertical">
                              <button type="button" class="btn btn-default"  onclick="sSpinnerUp(${loop.index})"><i class="fa fa-caret-up"></i></button>
                              <button type="button" class="btn btn-default"  onclick="sSpinnerDown(${loop.index})"><i class="fa fa-caret-down"></i></button> 
                           </div>
                     </td>
                     <td width=""></td>
                     <td width="60%">
                     <br>
                     &#8377;${i*row.quantity}
                     </td>
                  </tr>
                  <tr>
                  <td colspan="2" width="30%"><br>
                  <b>Dlvry by: <span class="dat"></span></b>
                  </td>
                  <td width="5%"></td>
                  </tr>
               </table>
               </div>
         </c:forEach>
         
         <br><br>
         <hr>
         <h3>Price Details</h3>
         <hr>
         <div class="row">
         <div class="col-xs-6">
         <c:forEach var="titems" items="${totalitems.rows}" >
         <h5>Price(<c:out value="${itemscount}"/> items)</h5>       
         </c:forEach>
         </div>
         <div align="right" class="col-xs-6">
         <c:forEach var="trow" items="${totalAmount.rows}" >
         <h5>Rs: ${trow.amount}</h5>
         </c:forEach>
         </div>
         <div class="col-xs-6">
         <h5>Delivery</h5>
         </div>
         <div align="right" class="col-xs-6">
         <h5><font color="green">Free</font></h5>
         </div>
         <div class="col-xs-6">
         <h4><b>Amount Payable</b></h4>
         </div>
         <div align="right" class="col-xs-6">
         <c:forEach var="trow" items="${totalAmount.rows}" >
         <h4><b>Rs: ${trow.amount}</b></h4>
         </c:forEach>
         </h4>
         </div>
         </div>
        
         <hr>
         <div class="fixed">
         <div class="row">
         <div class="col-xs-12">
         <div class="btn-group btn-group-justified">
         <a href="Home.jsp"  class="btn btn1 btn-primary"><span class="glyphicon glyphicon-menu-left"></span><span class="glyphicon glyphicon-menu-left"></span>Continue Shopping</a>
         
         <a href="DeliveryDetails.jsp?ordercount=${itemscount}" class=" btn btn1 btn-primary"><span class="glyphicon glyphicon-send"></span>Place Order</a>
         </div>
         </div>
         </div>
         </div>
           </c:otherwise>
			    </c:choose>
         </div>
      </div>
      <%@ include file="footer.html" %>
      <script>
         var d = new Date();
         var days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
         console.log(d.getHours);
          if(d.getHours()<16){
         	var elements = document.getElementsByClassName("dat");
         	 for(var i=0; i<elements.length; i++) { 
           	   elements[i].innerHTML = "Today";
         	 }
         	 
          }
          else{
         	 var elements= document.getElementsByClassName("dat");
         	  
         	 for(var i=0; i<elements.length; i++) { 
         	   elements[i].innerHTML = days[d.getDay()+1]+" "+(1+d.getDate());
         	 }
          }
         
          $(document).ready(function(){ 
         	 
          });
         
           
      </script>
      <script>
         function SpinnerUp(index){
           	 
             $("#spinnerText"+index).val( parseInt($("#spinnerText"+index).val(), 10) + 1);
             
                $.ajax({
             	   url: "UpdateCart",
             	   type: "post",
             	   data: {
             		   customerId: ${sessionScope.user},
             		   productId: $("#productId"+index).val(),
             		   quantity: $("#spinnerText"+index).val()
             	   },
             	   
             	   success: function(){
             		   location.reload();
             	   }
                });
          
           
         
         }
         
         function SpinnerDown(index){
         
         $("#spinnerText"+index).val( parseInt($("#spinnerText"+index).val(), 10) - 1);
         if( parseInt($("#spinnerText"+index).val(), 10) <1 ){
        	 $("#spinnerText"+index).val(1);
         }
         
           $.ajax({
            url: "UpdateCart",
            type: "post",
            data: {
         	   customerId: ${sessionScope.user},
         	   productId: $("#productId"+index).val(),
         	   quantity: $("#spinnerText"+index).val()
            },
            
            success: function(){
         	   location.reload();
            }
           });
         
          	
         
         
         }
         
         function sSpinnerUp(index){
           	 
             $("#SspinnerText"+index).val( parseInt($("#SspinnerText"+index).val(), 10) + 1);
              
              $.ajax({
         	   url: "UpdateCart",
         	   type: "post",
         	   data: {
         		   customerId: ${sessionScope.user},
         		   productId: $("#productId"+index).val(),
         		   quantity: $("#SspinnerText"+index).val()
         	   },
         	   
         	   success: function(){
         		   location.reload();
         	   }
            });
             
          
           
         
         }
         
         function sSpinnerDown(index){
         
         $("#SspinnerText"+index).val( parseInt($("#SspinnerText"+index).val(), 10) - 1);
         
         if( parseInt($("#SspinnerText"+index).val(), 10) <1 ){
        	 $("#SspinnerText"+index).val(1);
         }
         
           $.ajax({
         	   url: "UpdateCart",
         	   type: "post",
         	   data: {
         		   customerId: ${sessionScope.user},
         		   productId: $("#productId"+index).val(),
         		   quantity: $("#SspinnerText"+index).val()
         	   },
         	   
         	   success: function(){
         		   location.reload();
         	   }
            });
              
         }
         
         function DeleteFromCart(index){
         	
         	$.ajax({ 
         		
            url: "DeleteFromCart",
            type: "GET",
            data: {
         	   customerId: ${sessionScope.user},
         	   productId: $("#productId"+index).val()
            },
            
            success: function(){
         	   location.reload();
            }
         		
         	});
         	
         
            
         
         }
         
      </script>
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
         
      </script>
      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="bootstrap/js/bootstrap.min.js"></script>
   </body>
</html>




