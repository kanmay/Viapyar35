<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
  <form action="IndexingRequest" method="GET">
   <input type="submit">
  </form>  
           


</body>
</html>