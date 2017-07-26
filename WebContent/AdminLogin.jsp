<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/Login.css" rel="stylesheet" />
</head>
<body>
 <body>
   <div id="indexheader" style="height:80px">
   <h1 id="indexheading">Viapyar Vision</h1>
   </div>
   
   <div id="mloginsection">
     <div id="loginsection" align="center">
      <form action="AdminLogin" method="post">
       <table cellspacing="40">
         <tr>
           <td>UserName:</td>
           <td><input class="inputvalues" type="text" id="username" name="username"></td>
         
         </tr>
         
         <tr>
           <td>Password:</td>
           <td><input  class="inputvalues" type="password" id="password" name="pass"></td>
         
         </tr>
         
         <tr >
          <td align="right" colspan="2">
          <input  type="submit" value="Login" id="loginbutton">
          </td>
         
         </tr>
       
       
       </table>
       
       </form>
     
     
     
     </div>
     <% if (request.getAttribute("msg")!=null){%>
          <h2 style="color: red;"align="center"><%=request.getAttribute("msg")%></h2>
        <%
        }
        %>
   
   
   </div>
   <div id="footer">
  &copy 2016 viapyarvision | All Rights Reserved | Designed by : Singhal Developers
  </div> 


</body>
</body>
</html>




