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
      <title>Buy Product</title>
      
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
    <br><br>
      <div class="big">
	  <form action="DeliveryDetails.jsp" id="myBuyForm">
         <br><br>
         <div class="container">
            <div class="panel">
               <div class="panel-heading">
                  <h3>Buy Me <span class="glyphicon glyphicon-shopping-cart"></span></h3>
               </div>
               <div class="panel-body">
                  
                     <sql:query var="result" dataSource="${snapshot}">
                        SELECT * FROM products WHERE productId=${param.productId};
                     </sql:query>
                     <c:forEach var="row" items="${result.rows}" varStatus="loop" >
                     <fmt:parseNumber var = "i" integerOnly = "true"  type = "number" value = "${row.price-row.discount/100*row.price}" />
                      
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
                              <tr>
                                 <td width="37%">
                                    <a href="gotocart.html">
                                       <img src="${ConfigurationBean.getImgLoc()}${row.productImageName}" style="width:100px; height:100px; float:left; padding:5px;">
                                       <input type="text" name="ordercount" value="0" style="display:none"/>
                                       <input type="text" name="productId" value="${row.productId}" id="productId"  style="display:none"/>
                                       <input type="text" name="price" value="${row.price}" id="pprice"  style="display:none"/>
                                       <input type="text" name="discount" value="${row.discount}" id="discount"  style="display:none"/>
                                       <input type="text" name="cashback" value="${row.cashback}" id="cashback"  style="display:none"/>
                                       <input type="text" name="product" value="${row.productBrandName} ${row.productName}" id="discount"  style="display:none"/>
                                       <h5><span>${row.productBrandName} </span><span>${row.productName} </span><span>${row.productType} </span></h5>
                                       <p>${row.Discount}</p>
                                    </a>
                                 </td>
                                 <td width="12%">&#8377;<span id="pprice">${i}</span>
                                 </td>
                                 <td width="18%">
                                    <div style="width:50%;" class="input-group spinner">
                                       <input type="text" id="spinnerText" class="form-control" name="quantity" value="1">
                                       <div class="input-group-btn-vertical">
                                          <button type="button" class="btn btn-default"  onClick="SpinnerUp()"><i class="fa fa-caret-up"></i></button>
                                          <button type="button" class="btn btn-default"  onClick="SpinnerDown()"><i class="fa fa-caret-down"></i></button>
                                       </div>
                                    </div>
                                 </td>
                                 <td width="20%">Delivery: &nbsp;<span class="dat"></span></td>
                                 <td width="15%"><span class="totalAmount">&#8377;${row.price}</span>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                        <div class="div4" align="right">
                           <h2 >Estimated Total: &#8377;<span class="totalAmount">${row.price}</span></h2>
                        </div>
                     </c:forEach>
				
               </div>
               <div class="row">
               <div class="col-xs-3"></div>
               <div class="col-xs-3"></div>
               <div class="col-xs-3"></div>  
               <div class="col-xs-3">
               <button type="submit" class="btn1 btn-lg"><span class="glyphicon glyphicon-send"></span>Place Order</button>
               </div>
               </div>	
               
            </div>
         </div>
		</form>
      </div>
      
      <div class="small">
     
      <h3 class="h21">Buy Me <span class="glyphicon glyphicon-shopping-cart"></span></h3>
      <br>
      <hr>
      <c:forEach var="row" items="${result.rows}" varStatus="loop" >
         <div class="thumbnail">
            <table>
               <tr>
                  <td width="35%" colspan="2">
                     <img src="${ConfigurationBean.getImgLoc()}${row.productImageName}" style="width:100px;height:100px;">
                  </td>
                  <input type="text" value="${row.productId}" id="SproductId" style="display:none"/>
                  <td width="60%" >
                     <span>${row.productBrandName} </span><span>${row.productName} </span><span>${row.productType} </span>
                     <p style="font-size:10px;">{row.Variant}</p>
                     <p>${row.Discount}</p>
                  </td>
               </tr>
               <tr>
                  <td width="10%">
                     <br>
                     <b>Qty&nbsp;</b>
                     <div style="width:100%" class="input-group spinner">
                        <input type="number" id="SspinnerText" class="form-control" value="1" min="1" max="10">
                        <div class="input-group-btn-vertical">
                           <button type="button" class="btn btn-default"  onclick="sSpinnerUp()"><i class="fa fa-caret-up"></i></button>
                           <button type="button" class="btn btn-default"  onclick="sSpinnerDown()"><i class="fa fa-caret-down"></i></button> 
                        </div>
					 </div>
                  </td>
                  <td width=""></td>
                  <td width="60%">
                  <br>
                  Rs: <span class="totalAmount">${row.price}</span>
                  </td>
               </tr>
               <tr>
               <td colspan="2" width="30%"><br>
               <b>Delivery by: <span class="dat"></span></b>
               </td>
               <td width="5%"></td>
               </tr>
            </table>
            </div>
            <br><br>
            <hr>
            <h3>Price Details</h3>
            <hr>
            <div class="row">
               <div class="col-xs-6">
                  <h5>Price(1 item)</h5>
               </div>
               <div align="right" class="col-xs-6">
                  <h5>Rs: <span class="totalAmount">${row.price}</span></h5>
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
                  <h4><b>Rs: <span class="totalAmount">${row.price}</span></b></h4>
                  </h4>
               </div>
            </div>
            <hr>
            <div class="fixed">
               <div class="row">
                  <div class="col-xs-12">
                     <div class="btn-group btn-group-justified">
                        <div onclick="submitBuyForm();"  class=" btn btn1 btn-primary"><span class="glyphicon glyphicon-send"></span>Place Order</div>
                     </div>
                  </div>
               </div>
            </div>
         
      </c:forEach>
      
      
      </div>
      <%@ include file="footer.html" %>
      <script>
         var d = new Date();
         var days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
         console.log(d.getHours);
          if(d.getHours()<24){
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
         function SpinnerUp(){
           	 
             $("#spinnerText").val( parseInt($("#spinnerText").val(), 10) + 1);
             $("#SspinnerText").val( parseInt($("#SspinnerText").val(), 10) + 1);
             
             if(parseInt($("#spinnerText").val(),10)<1 && parseInt($("#SspinnerText").val(),10)<1 ){
             	$("#spinnerText").val("1");
             	$("#SspinnerText").val("1");
             }
             
            
             
            
           
           $(".totalAmount").html(parseInt($("#pprice").val(),10)*parseInt($("#spinnerText").val(),10)); 
          
           
         
         }
         
         function SpinnerDown(){
         
         $("#spinnerText").val( parseInt($("#spinnerText").val(), 10) - 1);
         $("#SspinnerText").val( parseInt($("#SspinnerText").val(), 10) - 1);
         
         
         if(parseInt($("#spinnerText").val(),10)<1 && parseInt($("#SspinnerText").val(),10)<1 ){
         	$("#spinnerText").val("1");
         	$("#SspinnerText").val("1");
         }
         $(".totalAmount").html(parseInt($("#pprice").val(),10)*parseInt($("#spinnerText").val(),10));
         console.log("Heyyyyy");
           
         
          	
         
         
         }
         
         function sSpinnerUp(){
           	 
             $("#SspinnerText").val( parseInt($("#SspinnerText").val(), 10) + 1);
             $("#spinnerText").val( parseInt($("#spinnerText").val(), 10) + 1);
              
              
             if(parseInt($("#spinnerText").val(),10)<1 && parseInt($("#SspinnerText").val(),10)<1 ){
             	$("#spinnerText").val("1");
             	$("#SspinnerText").val("1");
             }
             
            
             
           
            $(".totalAmount").html(parseInt($("#pprice").val(),10)*parseInt($("#SspinnerText").val(),10)); 
           
         
         }
         
         function sSpinnerDown(){
         
         $("#SspinnerText").val( parseInt($("#SspinnerText").val(), 10) - 1);
         $("#spinnerText").val( parseInt($("#spinnerText").val(), 10) - 1);
         
         if(parseInt($("#spinnerText").val(),10)<1 && parseInt($("#SspinnerText").val(),10)<1 ){
         	$("#spinnerText").val("1");
         	$("#SspinnerText").val("1");
         }
         
         $(".totalAmount").html(parseInt($("#pprice").val(),10)*parseInt($("#SspinnerText").val(),10));
         
         
              
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
	
	//function to submit the form on small screen that takes values from form for large screen
	function submitBuyForm(){
		document.getElementById("myBuyForm").submit();
	}

 </script>
      
      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="bootstrap/js/bootstrap.min.js"></script>
   </body>
</html>



