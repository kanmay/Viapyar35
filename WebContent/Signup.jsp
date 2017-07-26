<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap-social.min.css" rel="stylesheet">
	<link href="bootstrap/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
	
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/myjs.js"></script>
	
	<script src="https://apis.google.com/js/platform.js" async defer></script> <!-- Google Platform Library -->
 <script src="https://apis.google.com/js/api:client.js"></script>
 <meta name="google-signin-client_id" content="338051692993-k855dja87t16auiol4om0hmv23kd4n03.apps.googleusercontent.com"> <!-- google-signin-client_id meta element. -->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="icon" href="/viapyarrr/Images/makeinindia.jpg">
    <link rel="stylesheet" type="text/css" href="css/stylelogin.css">
	<link rel="stylesheet" type="text/css" href="stylefooter.css">
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
    
    .input2::-webkit-input-placeholder {
color: red !important;
}
    </style>
</head>
<body>
<script>startApp();</script>

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
            <a href="cart.html">
              <div class="input-group-btn">
                <button type="button" class="btn btn-success btn-md form-control"><span class="glyphicon glyphicon-shopping-cart "></span><sup><span class="label label-danger">${sessionScope.itemsInCart}</span> </sup></button>
              </div>
            </a>
          </div>
         </div>
         </nav>
    </div>

   
<datalist id="suggestions"></datalist>

<div id="cataloguediv">




 <div class="big">
 <br><br><br><br><br>
<div class="container">
  
  <div class="panel">
  
    <div class="panel-heading"> <h3>Sign Up <span class="glyphicon glyphicon-user"></span><sup><span class="glyphicon glyphicon-plus"></span> </sup></h3></div>
    <div class="panel-body">
	
 <div class="row">
   <div class="col-xs-3">
   
    
    <br>
	
<h2>Don't worry</h2>
<h4>We don't share your Personal Details  with anyone</h4>


 


    </div>
















 
    <div class="col-xs-9">
    
	 
	 <div class="row">
	 <div class="col-xs-2"></div>
	 
	 <div class="col-xs-8">
<form action="UserRegistration" method="post" id="signUpForm">
  

  
  <input class="input1 relative" type="text" id="fname" name="firstname" placeholder="Enter First Name">
  
  <div class="absolute1" id="fnameerror"></div>
  <input class="input1" type="text" id="lname" name="lastname" placeholder="Enter Last Name" >
  <div class="absolute2" id="lnameerror"></div>
  <input class="input1" type="text" id="email" name="email" placeholder="Enter Email Id" >
  <div class="absolute3" id="emailerror"></div>
  <input class="input1" type="password" id="pass" name="password" placeholder="Enter Password">
  <div class="absolute4" id="passerror"></div>
  
 <br>
 <br>



<div class"row">
<div class="col-xs-3"></div>
<div class="col-xs-6">

<button type="submit" onclick="return ValidateSignup();" class="btn1 btn-lg">Continue<span class="glyphicon glyphicon-chevron-right"></span><span class="glyphicon glyphicon-chevron-right"></span></button>
</div>
<div class="col-xs-3"></div>
</div>

</form>
</div>
<p>
<div class"row">
<div class="col-xs-3"></div>
<div class="col-xs-6">
<a href="Login.jsp">
<button  class="btn1 btn-lg">Existing User? Log In</button></a>
</div>
<div class="col-xs-3"></div>
</div>
</p>



</div>






<br>
<br>




<center>

<p>
 <fb:login-button scope="public_profile,email" onlogin="checkLoginState();" size="large">Sign in with Facebook
       </fb:login-button>
</p>



<p>
<span id="gsi">
   <a class="btn2 btn-md btn-social btn-google-plus">
      <i class="fa fa-google-plus"></i><span style="padding:0px; margin-left:12px;">Sign in with Google
</span>    </a>
 </span>   
</p>


 
 
 </center>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 </div>
 </div>

    </div>

	</div>


  

 


	
		
	
	
	
	
	
	</div>
  </div>





	 
<div class="small">	 
<br><br><br>

<h3 class="h21">Sign up <span class="glyphicon glyphicon-user"></span><sup><span class="glyphicon glyphicon-plus"></span> </sup></span></h3>


<form action="UserRegistration" method="post" id="SsignUpForm">
  
    <label for="fname">Enter First Name</label>
  <input class="input2" type="text" id="sfname" name="firstname">
  
    <label for="lname">Enter Last Name</label>
  <input class="input2" type="text" id="slname" name="lastname">
  
    <label for="email">Enter Email Id</label>
  <input class="input2" type="text" id="semail" name="email">

  <label for="pass">Enter Password</label>
  <input class="input2" type="password" id="spass" name="password">




<div class="row">
<div class="col-xs-12">
<button type="submit" onclick="return sValidateSignup();" class="btn1 btn-sm">Continue<span class="glyphicon glyphicon-chevron-right"></span><span class="glyphicon glyphicon-chevron-right"></span></button></div>
</form>

<a href="Login.jsp"><div class="col-xs-12">
  <button type="button" class="btn1 btn-sm">Existing User? Log In</</button></div></a>
</div>









<center><h3>OR</h3></center>


<center>

<p>
 <fb:login-button scope="public_profile,email" onlogin="checkLoginState();" size="large">Sign in with Facebook
       </fb:login-button>
</p>



<p>
<span id="sgsi">
   <a class="btn2 btn-md btn-social btn-google-plus">
      <i class="fa fa-google-plus"></i><span style="padding:0px; margin-left:12px;">Sign in with Google
</span>    </a>
 </span>   
</p>


</center>
 
 
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
 <!-- Form validation Signup page -->
 <script>
 
 function validateEmail(email) {
	  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	  return re.test(email);
	}
 
 function ValidateSignup(){
	 var firstName = document.getElementById("fname").value;
	 var lastName = document.getElementById("lname").value;
	 var emailId = document.getElementById("email").value;
	 var password = document.getElementById("pass").value;
	 
	 if(!firstName.replace(/^\s+/g, '').length){
		 document.getElementById("fnameerror").innerHTML="FirstName can't be empty";
	  return false;
		 
	 }else{
		 document.getElementById("fnameerror").innerHTML="";
	 }
	
	 if(!lastName.replace(/^\s+/g, '').length){
		 document.getElementById("lnameerror").innerHTML="LastName can't be  empty"
			 return false;
	 }
	 else {
		 document.getElementById("lnameerror").innerHTML="";
	
	 }
	 if(!validateEmail(emailId)){
		 document.getElementById("emailerror").innerHTML="Invalid email";
		 return false;
		 
	 }else{
		 document.getElementById("emailerror").innerHTML="";
		 
		 
	 }
	 if(!password.replace(/^\s+/g, '').length||password.length<6){
		 document.getElementById("passerror").innerHTML="Password can't be less than 6 characters";
		 return false;
	 }
	 else{
		 document.getElementById("passerror").innerHTML="";
		 
	 }
	 
	 
	 
	 
	 
 }
 
 
 
 
 
 //validates for small screen
 function sValidateSignup(){
	 var firstName = document.getElementById("sfname").value;
	 var lastName = document.getElementById("slname").value;
	 var emailId = document.getElementById("semail").value;
	 var password = document.getElementById("spass").value;
	 
	 if(!firstName.replace(/^\s+/g, '').length){
		 document.getElementById("sfname").placeholder="FirstName can't be empty"
		 return false;
		 
	 }
	 else{
		 document.getElementById("sfname").placeholder=""
	 }
	 if(!lastName.replace(/^\s+/g, '').length){
		 document.getElementById("slname").placeholder="LastName can't be empty";
		 return false;
	 } else{
		 document.getElementById("slname").placeholder=""
	 }
	 if(!validateEmail(emailId)){
		 document.getElementById("semail").placeholder="Email Invalid"
		 return false;
		 
	 } else{
		 document.getElementById("semail").placeholder=""
	 }
	 if(!password.replace(/^\s+/g, '').length||password.length<6){
		 document.getElementById("spass").placeholder="Password cant  be less than 6 characters";
		 return false;
	 } else{
		 document.getElementById("spass").placeholder=""
	 }
	 
	
	 
 }

 
 
 
 
 </script>



 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>

</body>
</html>

