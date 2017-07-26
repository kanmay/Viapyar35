<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery-3.1.1.min.js"></script>
<title>ProductDetails</title>
</head>
<body>

<div>
 <h1>User's Id is:<h2 id="customerId"><c:out value="${customerId}"></c:out></h2></h1>
 <h1>User's Email is:<h2 id="customerId"><c:out value="${email}"></c:out></h2></h1>
 <h1>The id of product is:</h1><h2 id="customerId"><c:out value="${productId}"></c:out></h2>
 <p><c:out value="${productName}"></c:out></p>
 <p><c:out value="${productBrandName}"></c:out></p>
 <p><c:out value="${variant1}"></c:out></p>
 <p><c:out value="${variant2}"></c:out></p>
 <p><c:out value="${variant3}"></c:out></p>
 <p><c:out value="${variant4}"></c:out></p>
 <p><c:out value="${variant5}"></c:out></p>
 <p><c:out value="${variant6}"></c:out></p>
 <p><c:out value="${variant7}"></c:out></p>
 
 <input type="button" name="${productId}" value="Add To Cart" id="addToCart"/>
 <a href="BuyProduct?productId=<c:out value="${productId}"></c:out>"><input type="button" name="${productId}" value="Buy" id="buy" /></a>
 


</div>

<!-- The folllowing script adds the product to cart and wishlist during a session -->

<script>
$(document).ready(function(){
	$("#addToCart").click(function(){
		$.ajax({
			url: 'AddToCart',
			data:{
				productId: $("#addToCart").attr("name"),
				customerId: $("#customerId").html()
			},
			
			success: function(responseText){
				$("#addToCart").val(responseText);
				$(this).attr('id', 'gotoCart');
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

</body>
</html>