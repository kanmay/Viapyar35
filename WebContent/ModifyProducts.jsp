<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>
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
<title>Modify Products</title>
 <!-- Bootstrap -->
    <link rel="icon" href="/viapyarrr/Images/makeinindia.jpg">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
    
    <input type="text" class="form-control" id="searchBox" list="suggestions" placeholder="Search">
  </div>
  </form>
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
<div class="col-xs-2">
   <a href="cart.html">
<div class="input-group-btn">
       <button type="button" class="btn btn-success btn-md"><span class="glyphicon glyphicon-shopping-cart"></span><sup><span class="label label-danger">3</span> </sup></button>
        </div>   </a>
</div>
     </div>
 
</nav>
</div>
   





<datalist id="suggestions"></datalist>


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



<article id="article">
<br><br>

<div class="row">

<div class="col-md-3 col-xs-6 no">
    <div class="extra thumbnai">
      <a href="AdminAddProducts.jsp">
        <img src="<c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />" alt="Add Products" height="200px" width="170px">
		 <div class="topright"><div style="height:20px; width:20px; background-color:white;"><span class="glyphicon glyphicon-pencil"></span></div></div>
		<p> <b>lyf flame f7
		<br>
		3 gb ram ,65 gb rom</b>
		</p>
		</a>
    </div>
  </div>  
  
  <sql:query var="result" dataSource="${snapshot}">
                SELECT * FROM products ORDER BY productId DESC LIMIT 30;
              </sql:query>
              
              <c:forEach var="row" items="${result.rows}">
                <div class="col-md-3 col-xs-6 no">
                    <div class="extra thumbnai">
                     <a href="EditProducts.jsp?productId=<c:out value="${row.productId}"></c:out>">
                     <img src="<c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />" alt="<c:out value="${row.productBrandName}"></c:out>" height="200px" width="170px" >
		             <div class="topright"><div style="height:20px; width:20px; background-color:white;"><span class="glyphicon glyphicon-pencil"></span></div></div>
		             <p> <b><c:out value="${row.productBrandName}"></c:out>
		             <br>
		             <c:out value="${row.productName}"></c:out></b>
		             &nbsp;<c:out value="${row.prop1}"></c:out>
		             </p>
		             </a>
                    </div>
                </div>  
              </c:forEach>
 

 

  </div>
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
  
  
  
  
//search at admin side
  
   function filterDiv(){
		  
		   $("#myButton").attr('class', '');
		   document.getElementById("article").style.display="none";
		  
		   document.getElementById("wantFilter").style.display="none";
		   document.getElementById("applyButton").style.display="block";

		   }
	   

	   
	   //filter For samll screen
	   
	   $(document).on('click','#applyButton',function(){
	 
	 
		   document.getElementById("myButton").style.display="none";
	 
		  
		   
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


$(document).on('click','.search',function(){
	  
   $.ajax({
		   type: "GET",
		   url: "AdminProductsSearch",
		   dataType: "text",
		   data: {search: $("#searchBox").val()
		   
		   },
		 
		   success: function(response){
			   var myObj = $.parseHTML(response);
			   
			   console.log(myObj);
			  
            $("#article").html(myObj);
        	   
			   
	       }
	   })
});

//search on Enter click
            $('#searchBox').keypress(function(event){
                if(event.keyCode == 13){
                 $('.search').click();
                }
            });

</script>




 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
 
</body>
</html>


