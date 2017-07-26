<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery-3.1.1.min.js"></script>
<title>Authenticating</title>


</head>
<body>
<script>
  var fname;
  var lname;
  var email;
	

   window.fbAsyncInit = function() {
     FB.init({
      appId      : '379190129103410',
      xfbml      : true,
      version    : 'v2.8'
     });
  
   
   FB.getLoginStatus(function(response) {
	   if (response.status === 'connected') {
		   
		   
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
							   window.location='Index.jsp'
						   }	     
						   
						   
					   });
				   });
			});
		   
		 
	     
	   }
	   else if(response.status==='not_authorized'){
		   document.getElementById("status").innerHTML="Kaju";
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