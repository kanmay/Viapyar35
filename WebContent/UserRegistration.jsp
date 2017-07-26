<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body>

 <form action="UseRegistration" method="post">
   First Name:<br>
   <input type="text" name="firstname"><br>
   Last Name:<br>
   <input type="text" name="lastname"><br>
   Password:<br>
   <input type="password" name="password"><br>
   Address:<br>
   <input type="text" name="address"><br>
   City:<br>
   <input type="text" name="city"><br>
   zip:<br>
   <input type="number" name="zip"><br>
   State:<br>
   <input type="text" name="state"><br>
   Email:<br>
   <input type="text" name="email"><br>
   Phone:<br>
   <input type="number" name="phone"><br>
   Promocode:<br>
   <input type="text" name="promo"><br>
   
   <input type="submit">
   
 </form>
 <form action="UserLogin" method="post">
 email:<br>
 <input type="text" name = "email"><br>
 password:<br>
 <input type="password" name="password"><br>
 <input type="submit" >
 
 </form>
 



</body>
</html>