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
 <meta name="google-signin-client_id" content="825262867817-t5fbqfkihf11au3ng52j79vqt13s9s71.apps.googleusercontent.com"> <!-- google-signin-client_id meta element. -->
<meta name="google-signin-scope" content="profile email">
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
    </style>
</head>
<body>
<%
    String landingPage = request.getParameter("landingPage");
%>




 
 

 <!--<script>
   window.fbAsyncInit = function() {
     FB.init({
       appId      : '109082079655818',
       cookie     : true,
       xfbml      : true,
       version    : 'v2.8'
     });
     FB.AppEvents.logPageView();   
   };

   (function(d, s, id){
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) {return;}
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/en_US/sdk.js";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

 
 
 


FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
});



  function statusChangeCallback(response) {
     console.log('statusChangeCallback');
     console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
    	 FB.api('/me', {fields: 'first_name,last_name,email'}, function(response) {
			    fname = response.first_name;
			    lname = response.last_name;
			    email = response.email;
			    
			    $(document).ready(function(){     
					   console.log("my name is"+fname)
					   $.ajax({  
						   type: "POST",
						   url: "OAuthUserRegistration",
						   data: {fname: fname,
							      lname: lname,
							      email: email,
							      OAuthProvider: "Facebook"  
							     },
						   success: function(){
							   var landingPag = <%=landingPage%>
							   
							   if(landingPag!=null){
								   window.location.href = "ProductDetailsFetch?productId="+landingPag;  
							   }
							   else
								   window.location.href = "Home.jsp";
							   
						  
						   }	     
						   
						   
					   });
				   });
			});
    } else if (response.status === 'not_authorized') {
      // The person is logged into Facebook, but not your app.
      console.log("not authorized");
    } else {
      // The person is not logged into Facebook, so we're not sure if
      // they are logged into this app or not.
      console.log("else");
    }
  }

//Google Login Associated Javascript Methods 
 var googleUser = {};
 var startApp = function() {
gapi.load('auth2', function(){
  // Retrieve the singleton for the GoogleAuth library and set up the client.
  auth2 = gapi.auth2.init({
    client_id: '825262867817-t5fbqfkihf11au3ng52j79vqt13s9s71.apps.googleusercontent.com',
    cookiepolicy: 'single_host_origin',
    // Request scopes in addition to 'profile' and 'email'
    //scope: 'additional_scope'
  });
  attachSignin(document.getElementById('gsi'));
  attachSignin(document.getElementById('sgsi'));
});
};

function attachSignin(element) {

auth2.attachClickHandler(element, {},
    function(googleUser) {
	 var profile = googleUser.getBasicProfile();
     console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
     console.log('Name: ' + profile.getName());
     console.log('Image URL: ' + profile.getImageUrl());
   //  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
       fname = profile.getGivenName();
	    lname = profile.getFamilyName();
	    email = profile.getEmail();
	    
	    $(document).ready(function(){     
			   console.log("my name is "+fname)
			   $.ajax({  
				   type: "POST",
				   url: "OAuthUserRegistration",
				   data: {fname: fname,
					      lname: lname,
					      email: email,
					      OAuthProvider: "Google"
					     },
				   success: function(){
					   var landingPag = <%=landingPage%>
					   
					   if(landingPag!=null){
						   window.location.href = "ProductDetailsFetch?productId="+landingPag;   
					   }
					   else
						   window.location.href = "Home.jsp";
					   
				   }	     
				   
				   
			   });
		   });
    }, function(error) {
    	console.log("unsigned");
      alert(JSON.stringify(error, undefined, 2));
    });
}


</script>-->
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
                  <button class="btn btn-default inline form-control search" type="submit">
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
    
    <datalist id="suggestions"></datalist>
<div id="cataloguediv">

<div class="big">

<br><br><br><br><br>
</div>
<div class="small">
<br><br><br>
</div>
<div id="hello">
 <div class="big">
<div class="container">
  
  <div class="panel">
  
    <div class="panel-heading"> <h3>Log In <span class="glyphicon glyphicon-user"></span></h3></div>
    <div class="panel-body">
	
 <div class="row">
   <div class="col-xs-3">
   
    
    <br>
	
<h2>Don't worry</h2>
<h4>We don't share your Personnal Details  with anyone</h4>



 


    </div>
















 
    <div class="col-xs-9">
    
	 
	 <div class="row">
	 <div class="col-xs-2"></div>
	 
	 <div class="col-xs-8">
<form action="UserLogin" method="post" id="LoginForm">
  

  
  <input class="input1" type="text" id="email" name="email" placeholder="Enter Email Id">

  
  <input class="input1" type="password" id="pass" name="password" placeholder="Enter Password">
  
  <input type="" name="landingPage" value="<%=landingPage%>" style="visibility:hidden;" >
  
 <br>
 
<% if (request.getAttribute("message")!=null){%>
          <h5 style="color: red;"align="center"><%=request.getAttribute("message")%></h5>
        <%
        }
        %>

<br>
<div class"row">
<div class="col-xs-3"></div>
<div class="col-xs-6">

<button type="submit" onclick="return ValidateLogin();" class="btn1 btn-lg">Login<span class="glyphicon glyphicon-chevron-right"></span><span class="glyphicon glyphicon-chevron-right"></span></button>
</div>
<div class="col-xs-3"></div>
</div>
</div>
</form>

<p>
<div class"row">

<a href="Signup.jsp">
<div class="col-xs-3"></div>
  <a href="Signup.jsp">
<div class="col-xs-6">

<button type="submit" class="btn1 btn-lg">New to viapyar ? Sign Up</button>
    </div></a>
<div class="col-xs-3"></div>
</a>
</div>
</p>



<!--  <div class="col-xs-6">
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="signup.html">
<button type="button" class="btn1 btn-lg">New to Mantra ? Sign Up</button></a></div></p>-->
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
</div>




	 
<div class="small">	 

<h3 class="h21">Log In <span class="glyphicon glyphicon-user"></span></h3>


<form action="UserLogin" method="post" id="sLoginForm">
  
    <label for="fname">Enter Email Id</label>
  <input class="input1" type="text" id="semail" name="email">

  <label for="fname">Enter Password</label>
  <input class="input1" type="password" id="spass" name="password">
  
   <input type="" name="landingPage" value="<%=landingPage%>" style="visibility:hidden;" >



<% if (request.getAttribute("message")!=null){%>
          <h5 style="color: red;"align="center"><%=request.getAttribute("message")%></h5>
        <%
        }
        %>

<div class="row">
<div class="col-xs-12">
<button type="submit" onclick="return sValidateLogin();" class="btn1 btn-sm">Login<span class="glyphicon glyphicon-chevron-right"></span><span class="glyphicon glyphicon-chevron-right"></span></button></div>
</form>

  <a href="Signup.jsp">
<div class="col-xs-12">
  <button type="button" class="btn1 btn-sm">New to Viapyar ? Sign Up</button></div></a>
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
 

<%@include file="footer.html" %>

<script>



$(".search").click(function(){
	   $.ajax({
		   type: "POST",
		   url: "TestSearch",
		   dataType: "text",
		   data: {search: $("#searchBox").val(),
			     myFilter: JSON.stringify(["may","appl","Coo","microsof"])  
		   
		   },
		 
		   success: function(response){
			   var myObj = $.parseHTML(response);
			   
			   
			  
            $("#hello").html(myObj);
            
   
	       }
	   })
});


//search on Enter click
$('#searchBox').keypress(function(event){
    if(event.keyCode == 13){
     $('.search').click();
    }
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


</script>

<!-- Form validation Login page -->
 <script>
 
 function validateEmail(email) {
	  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	  return re.test(email);
	}
 
 function ValidateLogin(){
	
	 var emailId = document.getElementById("email").value;
	 
	 
	 if(!validateEmail(emailId)){
		 document.getElementById("email").placeholder="Invalid email";
		 return false;
		 
	 }else{
		 document.getElementById("LoginForm").submit();
	 }
	 
 }
 
 function sValidateLogin(){
		
	 var emailId = document.getElementById("semail").value;
	 
	 
	 if(!validateEmail(emailId)){
		 document.getElementById("semail").placeholder="Invalid email";
		 return false;
		 
	 }else{
		 document.getElementById("sLoginForm").submit();
	 }
	 
 }


</script>
 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
<script>startApp();</script>
</body>
</html>


