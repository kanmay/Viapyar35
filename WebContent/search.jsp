<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/mycommonjs.js"></script>

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
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<style>
h1{
color: ;

}

</style>
<title>Search</title>
<style>

ul.products li {
    width: 200px; /* adjust the size of the catalog block */
    display: inline-block; /* this creates the catalog effect */
    text-align: center; /* align the image to center */
    background-color:#282828 ; /* background color of each */
    font-family: "Trebuchet MS", Helvetica, sans-serif; 
    border-radius: 10px; /* rounded borders effect */
    border: 2px solid #585858; /* border and color */
    
    
}
</style>
</head>
<body>




<div id="mainDiv">

</div>
  
  
   <div class="form-group">
              <input type="text" class="form-control" id="searchBox" list="suggestions" placeholder="Search">
              <button class="btn btn-default inline form-control" id="search" type="button">
                  <i class="glyphicon glyphicon-search "></i>
                  </button>
         </div>
  
  <datalist id="suggestions">
  </datalist>
 
 
 

   
  
 


<div id="mydiv">

 
 
</div>
  
  
  
  
  
  <script>
   $(document).ready(function(){
	   
	 
	   $("#search").click(function(){
		   $.ajax({
			   type: "POST",
			   url: "TestSearch",
			   data: {search: $("#searchBox").val()},
			   success: function(response){
				   var myObj = $.parseHTML(response);
				   var r="";
				   
					
				
				   $('#mainDiv').html(myObj); 
				    
 
				   
				   
				   
				   
		       }
		   })
	   });
	   
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
	   
	  
	   
   });
	  
   
    	
    	
    
  
  </script>


 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>


</body>
</html>