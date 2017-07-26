
    var fname,lname,email;
     window.fbAsyncInit = function() {
       FB.init({
         appId      : '379190129103410',
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
 
 
 
      function checkLoginState(){
	  console.log("hieee");
	 
	    FB.getLoginStatus(function(response) {
	      statusChangeCallback(response);
	    });
	  }
 
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
        client_id: '338051692993-k855dja87t16auiol4om0hmv23kd4n03.apps.googleusercontent.com',
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
    					   window.location.href = "Home.jsp";
    				   }	     
    				   
    				   
    			   });
    		   });
        }, function(error) {
        	console.log("unsigned");
          alert(JSON.stringify(error, undefined, 2));
        });
  }

