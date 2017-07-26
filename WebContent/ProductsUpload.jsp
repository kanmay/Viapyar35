<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!--  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="js/fileinput.js" type="text/javascript"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>

<form action="UploadProducts" method="post" enctype ="multipart/form-data">

<input id="file-0a" class="file" type="file" name ="file" multiple data-min-file-count="1">
 <br>
Product Category: <input type="text" name="productCategory"> 
BrandName: <input type="text" name="productBrandName"><br>
ProductType: <input type="text" name="productType"><br>
  ProductName:<input type="text" name="productName"><br>
 Variant1:<input type="text" name="variant1" value="">
 Variant2:<input type="text" name="variant2" value="">
 Variant3:<input type="text" name="variant3" value="">
 Variant4:<input type="text" name="variant4" value="">
 Variant5:<input type="text" name="variant5" value="">
  prop1<input type="text" name="prop1" value=""><br>
 prop2<input type="text" name="prop2" value=""><br>
  prop3<input type="text" name="prop3" value=""><br>
 prop4<input type="text" name="prop4" value=""><br>
  prop5<input type="text" name="prop5" value=""><br>
 description<input type="text" name="description"><br>
  price<input type="number" name="price"><br>
 discount<input type="number" name="discount"><br>
 cashback<input type="number" name="cashback"><br>
 availability<input type="text" name="availability"><br>
  
 <input type="submit">
</form>
              
           


</body>
</html>-->

 



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
 <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<link href="bootstrap/css/bootstrap-social.min.css" rel="stylesheet">
	<link href="bootstrap/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<script src="js/jquery-3.1.1.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- css and js for file upload -->
    <link href="css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    <script src="js/fileinput.js" type="text/javascript"></script>
    
	
   <link rel="stylesheet" type="text/css" href="styledeliveryadd.css">
	<link rel='stylesheet' media='screen and (min-width: 767px) and (max-width: 2000px)' href='css/stylefilter.css' />
	<link rel='stylesheet' media='screen and (min-width: 0px) and (max-width: 767px)' href='css/filtermin.css' />
		<link rel="stylesheet" type="text/css" href="css/stylefooter.css">
    <style>
@media (max-width: 767px) {
        .big {
            display: none;
        }
    }
	 @media (min-width: 767px) {
        .small {
            display: none;
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
   
     <li><a href="signup.jsp"><span class="glyphicon glyphicon-user"></span><sup><span class="glyphicon glyphicon-plus"></span> </sup>Sign up</a></li>
     <li><a href="login.jsp"><span class="glyphicon glyphicon-user"></span>log in</a></li>
    </ul>
   </div>
<div class="row">
<div class=" col-xs-offset-2 col-xs-4 div3">
<form>
  <div class="form-group">
    
    <input type="text" class="form-control" id="email"  placeholder="Search">
  </div>
  
  </div>







  <div class="col-xs-1 div3">
        <div class="input-group-btn">
          <button class="btn2 btn-default inline" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
           </div>
</div>
<div class="col-xs-2">
   <a href="cart.html">
<div class="input-group-btn">
       <button type="button" class="btn2 btn-success btn-md"><span class="glyphicon glyphicon-shopping-cart"></span><sup><span class="label label-danger">${sessionScope.itemsInCart}</span> </sup></button>
        </div>   </a>
</div>
     </div>
 
</nav>
</div>
   








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



<article>
<br><br>




<form action="UploadProducts" method="post" enctype ="multipart/form-data">

<input id="file-0a" class="file" type="file" name ="file" multiple data-min-file-count="1">
 <br>
Product Category: <input type="text" name="productCategory"> 
BrandName: <input type="text" name="productBrandName"><br>
ProductType: <input type="text" name="productType"><br>
  ProductName:<input type="text" name="productName"><br>
 Variant1:<input type="text" name="variant1" value="">
 Variant2:<input type="text" name="variant2" value="">
 Variant3:<input type="text" name="variant3" value="">
 Variant4:<input type="text" name="variant4" value="">
 Variant5:<input type="text" name="variant5" value="">
  prop1<input type="text" name="prop1" value=""><br>
 prop2<input type="text" name="prop2" value=""><br>
  prop3<input type="text" name="prop3" value=""><br>
 prop4<input type="text" name="prop4" value=""><br>
  prop5<input type="text" name="prop5" value=""><br>
 description<input type="text" name="description"><br>
  price<input type="number" name="price"><br>
 discount<input type="number" name="discount"><br>
 cashback<input type="number" name="cashback"><br>
 availability<input type="text" name="availability"><br>
  
 <input type="submit">
</form>


















    </article>


  </main>

 
</div>








  
  
 <br><br><br><br>
  
  

  
 



<!-- 

<script>
function filterDiv(){
 $("#myButton").attr('class', '');
 document.getElementById("article").style.display="none";

 }
 
</script>


-->
<!-- validating upload product form -->
<!--  <script>

  
function ValidateProductsUpload(){
	 var productCategory = document.getElementById("productCategory").value;
	 var productBrandName = document.getElementById("productBrandName").value;
	 var productType = document.getElementById("productType").value;
	 var productName = document.getElementById("productName").value;
	 var prop1 = document.getElementById("prop1").value;
	 var prop2 = document.getElementById("prop2").value;
	 var prop3 = document.getElementById("prop3").value;
	 var prop4 = document.getElementById("prop4").value;
	 var prop5 = document.getElementById("prop5").value;
	 var price = document.getElementById("price").value;
	 var discount = document.getElementById("discount").value;
	 var cashback = document.getElementById("cashback").value;
	 var availability = document.getElementById("availability").value;
	 var description = document.getElementById("description").value;
	 
	 if(!productCategory.replace(/^\s+/g, '').length){
		 document.getElementById("productCategory").style.borderColor="#FF0000"
			 document.getElementById("productCategory").focus();
	  return false;
		 
	 }else{
		 document.getElementById("productCategory").style.borderColor="#0000FF"
	 }
	
	 if(!productBrandName.replace(/^\s+/g, '').length){
		 document.getElementById("productBrandName").style.borderColor="#FF0000"
	     document.getElementById("productBrandName").focus();
			 return false;
	 }
	 else {
		 document.getElementById("productBrandName").style.borderColor="#0000FF"
	
	 }
	 if(!productType.replace(/^\s+/g, '').length){
		 document.getElementById("productType").style.borderColor="#FF0000"
			 document.getElementById("productType").focus(); 
		 return false;
		 
	 }else{
		 document.getElementById("productType").style.borderColor="#0000FF"
		 
		 
	 }
	 if(!productName.replace(/^\s+/g, '').length){
		 document.getElementById("productName").style.borderColor="#FF0000"
			 document.getElementById("productName").focus();
		 return false;
	 }
	 else{
		 document.getElementById("productName").style.borderColor="#0000FF"
		 
	 }if(!prop1.replace(/^\s+/g, '').length){
		 document.getElementById("prop1").style.borderColor="#FF0000"
			 document.getElementById("prop1").focus();
		 return false;
	 }
	 else{
		 document.getElementById("prop1").style.borderColor="#0000FF"
		 
	 }if(!prop2.replace(/^\s+/g, '').length){
		 document.getElementById("prop2").style.borderColor="#FF0000"
			 document.getElementById("prop2").focus();
		 return false;
	 }
	 else{
		 document.getElementById("prop2").style.borderColor="#0000FF"
		 
	 }if(!(parseInt(price,10)>0)){
		 document.getElementById("price").style.borderColor="#FF0000"
			 document.getElementById("price").focus();
		 return false;
	 }
	 else{
		 document.getElementById("price").style.borderColor="#0000FF"
		 
	 }if(!(parseInt(discount,10)>0)){
		 document.getElementById("discount").style.borderColor="#FF0000"
		 document.getElementById("discount").focus();
		 return false;
	 }
	 else{
		 document.getElementById("discount").style.borderColor="#0000FF"
		 
	 }
	 if(!(parseInt(cashback,10)>0)){
		 document.getElementById("cashback").style.borderColor="#FF0000"
			 document.getElementById("cashback").focus();
		 return false;
	 }
	 else{
		 document.getElementById("cashback").style.borderColor="#0000FF"
		 
	 }if(!availability.replace(/^\s+/g, '').length){
		 document.getElementById("availability").style.borderColor="#FF0000"
			 document.getElementById("availability").focus();
		 return false;
	 }
	 else{
		 document.getElementById("availability").style.borderColor="#0000FF"
		 
	 }if(!description.replace(/^\s+/g, '').length){
		 document.getElementById("description").style.borderColor="#FF0000"
			 document.getElementById("description").focus();
		 return false;
	 }
	 else{
		 document.getElementById("description").style.borderColor="#0000FF"
		 
	 }
	 
	 
	 
	 
	 
}

 
 
 </script>-->






 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>

</body>

</body>
</html>
 -->