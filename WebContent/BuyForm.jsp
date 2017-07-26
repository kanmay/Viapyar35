<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery-3.1.1.min.js"></script>
<title>Buy</title>
</head>
<body>
<form method="post" action="ProcessOrder">
<h1><c:out value="${productId}"></c:out></h1>
<input type="number" name="quantity" min="1" max="5" id="quantity">
<input type="text" name="receiversName" id="receiversName" value=" ">
<input type="text" name="receiversAddress" id="receiversAddress" value=" ">
<input type="text" name="promoCode" id="promoCode">
<input type="button" id="placeOrder" value="PlaceOrder">

</form>
<script>
console.log("hiee"); 
  $(document).ready(function(){   
	  $("#placeOrder").click(function(){  
		  $.ajax({   
			  type:"post",
			  url:"ProcessOrder",
			  data: {
				  customerId: <c:out value="${customerId}"></c:out>,
			      productId: <c:out value="${productId}"></c:out>,
			      price: <c:out value="${price}"></c:out>,
			      discount: <c:out value="${discount}"></c:out>,
			      cashback: <c:out value="${cashback}"></c:out>,
			      quantity: $("#quantity").val(),
			      receiversName: $("#receiversName").val(),
			      receiversAddress: $("#receiversAddress").val(),
			      promocode: $("#promocode").val()
			      
	
			  },
			  
			  success: function myfun(){
				  console.log("Done");
				  //move to page that shows order summary
			  }
			  
		  });
	  });
  });

</script>
</body>
</html>