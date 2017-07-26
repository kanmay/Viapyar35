<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>
<%@page import="packageB.Configuration"%> 
<jsp:useBean id="ConfigurationBean" scope="request" class="packageB.Configuration"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <!-- Bootstrap -->
    <link rel="icon" href="/viapyarrr/Images/makeinindia.jpg">
     <script src="js/mycommonjs.js"></script>
    <script src="js/jquery-3.1.1.min.js"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-social.min.css" rel="stylesheet">
    <link href="bootstrap/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  
    <link rel="icon" href="/viapyarrr/Images/makeinindia.jpg">
   
    <link rel="stylesheet" type="text/css" href="css/stylehome.css">
    <link rel="stylesheet" type="text/css" href="stylefooter.css">
    <style>
      a:hover{
      text-decoration:none;
      }
      .carousel-inner > .item > img,
      .carousel-inner > .item > a > img {
      width: 100%;
      margin:0px;
      }
      @media (max-width: 767px) {
      .big {
      display: none;
      }
      .carousel-inner > .item > img,
      .carousel-inner > .item > a > img {
      width:100%;
      height:150px;
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
    <title>Viapyar|Welcomes you</title>
  </head>
  <body>
  
  <c:choose>
  <c:when test="${sessionScope.user == null}">
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
     <li><a href="Login.jsp"><span class="glyphicon glyphicon-user"></span>Log in</a></li>
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
                  <button class="btn btn-default inline form-control search"  type="button">
                  <i class="glyphicon glyphicon-search "></i>
                  </button>
                </div>
              </div>
            </div>
          </div>
          <div class="col-xs-1">
           
              <a href="Cart.jsp"><div class="input-group-btn">
                <button type="button" class="btn btn-success btn-md form-control"><span class="glyphicon glyphicon-shopping-cart "></span><sup><span class="label label-danger">${sessionScope.itemsInCart}</span> </sup></button>
              </div></a>
           
          </div>
         </div>
         </nav>
    </div>
    
    
   
    
  </c:when>
 
  <c:otherwise>
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
           <li><a href="OrderDetails.jsp"><span class="glyphicon glyphicon-list-alt"></span> My Orders</a></li>
     <li><a href="Logout"><span class="glyphicon glyphicon-user"></span>Logout</a></li>
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
                  <button class="btn btn-default inline form-control search"  type="button">
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
   
    
  </c:otherwise>
</c:choose>
   
    
    
    
    
    <datalist id="suggestions"></datalist>
  
 <div id="cataloguediv">

    <br><br><br><br>
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
        <li data-target="#myCarousel" data-slide-to="4"></li>
      </ol>
      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox" >
        <div class="item active">
          <img src="/viapyarrr/Images/carouselA.jpg" alt="Chania" class="imgsize">
        </div>
        <div class="item">
          <img src="/viapyarrr/Images/carouselB.jpg" alt="Chania" width="460" height="345">
        </div>
        <div class="item">
          <img src="/viapyarrr/Images/carouselC.jpg" alt="Flower" width="460" height="345">
        </div>
        <div class="item">
          <img src="/viapyarrr/Images/carouselD.jpg" alt="Flower" width="460" height="345">
        </div>
        <div class="item">
          <img src="/viapyarrr/Images/carouselE.jpg" alt="Flower" width="460" height="345">
        </div>
      </div>
      <!-- Left and right controls -->
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
      </a>
    </div>
    <br>
    <sql:setDataSource var="snapshot" driver="${ConfigurationBean.getJDBC_DRIVER()}"
      url="${ConfigurationBean.getDB_URL()}"
      user="${ConfigurationBean.getUSER()}"  password="${ConfigurationBean.getPASS()}"/>
    
    <div class="big">
      <h2 class="deal"> FOOTWEAR <span class="glyphicon glyphicon-tags"></span> </h2>
      <div id="myCarousel1" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel1" data-slide-to="1"></li>
          <li data-target="#myCarousel1" data-slide-to="2"></li>
          <li data-target="#myCarousel1" data-slide-to="3"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <div class="row">
              <div class="col-xs-1"></div>
              <sql:query var="result" dataSource="${snapshot}">
                SELECT * FROM products where productCategory='Men Footwear';
              </sql:query>
              <c:forEach var="row" items="${result.rows}" begin="0" end="4">
                <div class="col-md-2 col-xs-6">
                  <div class=" mg-image">
                    <a href="ProductDetailsFetch?productId=
                    <c:out value="${row.productId}"></c:out>
                    ">
                    <img src="
                    <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
                    " alt="Lights" width="150px" height="150px">
                    <div class="caption">
                      <p>
                        <br><br>
                        <c:out value="${row.productBrandName}"></c:out>
                        <c:out value="${row.productName}"></c:out>
                      <p>
                        <c:out value="${row.productCategory}"></c:out>
                      </p>
                      <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>
                    </div>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-xs-1"></div>
            
              <c:forEach var="row" items="${result.rows}" begin="5" end="9">
                <div class="col-md-2 col-xs-6">
                  <div class=" mg-image">
                    <a href="ProductDetailsFetch?productId=
                    <c:out value="${row.productId}"></c:out>
                    ">
                    <img src="
                    <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
                    " alt="Lights" width="150px" height="150px">
                    <div class="caption">
                      <p>
                        <br><br>
                        <c:out value="${row.productBrandName}"></c:out>
                        <c:out value="${row.productName}"></c:out>
                      <p>
                        <c:out value="${row.productCategory}"></c:out>
                      </p>
                      <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>
                    </div>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-xs-1"></div>
             
              <c:forEach var="row" items="${result.rows}" begin="10" end="14">
                <div class="col-md-2 col-xs-6">
                  <div class=" mg-image">
                    <a href="ProductDetailsFetch?productId=
                    <c:out value="${row.productId}"></c:out>
                    ">
                    <img src="
                    <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
                    " alt="Lights" width="150px" height="150px">
                    <div class="caption">
                      <p>
                        <br><br>
                        <c:out value="${row.productBrandName}"></c:out>
                        <c:out value="${row.productName}"></c:out>
                      <p>
                        <c:out value="${row.productCategory}"></c:out>
                      </p>
                      <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>
                    </div>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-xs-1"></div>
           
              <c:forEach var="row" items="${result.rows}" begin="15" end="19">
                <div class="col-md-2 col-xs-6">
                  <div class=" mg-image">
                    <a href="ProductDetailsFetch?productId=
                    <c:out value="${row.productId}"></c:out>
                    ">
                    <img src="
                    <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
                    " alt="Lights" width="150px" height="150px">
                    <div class="caption">
                      <p>
                        <br><br>
                        <c:out value="${row.productBrandName}"></c:out>
                        <c:out value="${row.productName}"></c:out>
                      <p>
                        <c:out value="${row.productCategory}"></c:out>
                      </p>
                      <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>
                    </div>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel1" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel1" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
        </a>
      </div>
      <div id="myCarousel2" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel2" data-slide-to="1"></li>
          <li data-target="#myCarousel2" data-slide-to="2"></li>
          <li data-target="#myCarousel2" data-slide-to="3"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <div class="row">
              <div class="col-xs-1"></div>
              <sql:query var="result" dataSource="${snapshot}">
               SELECT * FROM products where productCategory='Women Footwear';
              </sql:query>
              <c:forEach var="row" items="${result.rows}" begin="0" end="4">
                <div class="col-md-2 col-xs-6">
                  <div class=" mg-image">
                    <a href="ProductDetailsFetch?productId=
                    <c:out value="${row.productId}"></c:out>
                    ">
                    <img src="
                    <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
                    " alt="Lights" width="150px" height="150px">
                    <div class="caption">
                      <p>
                        <br><br>
                        <c:out value="${row.productBrandName}"></c:out>
                        <c:out value="${row.productName}"></c:out>
                      <p>
                        <c:out value="${row.productCategory}"></c:out>
                      </p>
                      <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>                    </div>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-xs-1"></div>
        
              <c:forEach var="row" items="${result.rows}" begin="5" end="9">
                <div class="col-md-2 col-xs-6">
                  <div class=" mg-image">
                    <a href="ProductDetailsFetch?productId=
                    <c:out value="${row.productId}"></c:out>
                    ">
                    <img src="
                    <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
                    " alt="Lights" width="150px" height="150px">
                    <div class="caption">
                      <p>
                        <br><br>
                        <c:out value="${row.productBrandName}"></c:out>
                        <c:out value="${row.productName}"></c:out>
                      <p>
                        <c:out value="${row.productCategory}"></c:out>
                      </p>
                      <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>
                    </div>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-xs-1"></div>
            
              <c:forEach var="row" items="${result.rows}" begin="10" end="14">
                <div class="col-md-2 col-xs-6">
                  <div class=" mg-image">
                    <a href="ProductDetailsFetch?productId=
                    <c:out value="${row.productId}"></c:out>
                    ">
                    <img src="
                    <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
                    " alt="Lights" width="150px" height="150px">
                    <div class="caption">
                      <p>
                        <br><br>
                        <c:out value="${row.productBrandName}"></c:out>
                        <c:out value="${row.productName}"></c:out>
                      <p>
                        <c:out value="${row.productCategory}"></c:out>
                      </p>
                      <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>
                    </div>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-xs-1"></div>
             
              <c:forEach var="row" items="${result.rows}" begin="15" end="19">
                <div class="col-md-2 col-xs-6">
                  <div class=" mg-image">
                    <a href="ProductDetailsFetch?productId=
                    <c:out value="${row.productId}"></c:out>
                    ">
                    <img src="
                    <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
                    " alt="Lights" width="150px" height="150px">
                    <div class="caption">
                      <p>
                        <br><br>
                        <c:out value="${row.productBrandName}"></c:out>
                        <c:out value="${row.productName}"></c:out>
                      <p>
                        <c:out value="${row.productCategory}"></c:out>
                      </p>
                      <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>
                    </div>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
        </a>
      </div>
      <br>
      <h2 class="deal">WOMEN'S BAG <span class="glyphicon glyphicon-tags"></span> </h2>
      <div id="myCarousel3" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel3" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel3" data-slide-to="1"></li>
          <li data-target="#myCarousel3" data-slide-to="2"></li>
          <li data-target="#myCarousel3" data-slide-to="3"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <div class="row">
              <div class="col-xs-1"></div>
              <sql:query var="result" dataSource="${snapshot}">
               SELECT * FROM products where productCategory='Women Purse';
              </sql:query>
              <c:forEach var="row" items="${result.rows}" begin="0" end="4">
                <div class="col-md-2 col-xs-6">
                  <div class=" mg-image">
                    <a href="ProductDetailsFetch?productId=
                    <c:out value="${row.productId}"></c:out>
                    ">
                    <img src="
                    <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
                    " alt="Lights" width="150px" height="150px">
                    <div class="caption">
                      <p>
                        <br><br>
                        <c:out value="${row.productBrandName}"></c:out>
                        <c:out value="${row.productName}"></c:out>
                      <p>
                        <c:out value="${row.productCategory}"></c:out>
                      </p>
                      <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>
                    </div>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-xs-1"></div>
           
              <c:forEach var="row" items="${result.rows}" begin="5" end="9">
                <div class="col-md-2 col-xs-6">
                  <div class=" mg-image">
                    <a href="ProductDetailsFetch?productId=
                    <c:out value="${row.productId}"></c:out>
                    ">
                    <img src="
                    <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
                    " alt="Lights" width="150px" height="150px">
                    <div class="caption">
                      <p>
                        <br><br>
                        <c:out value="${row.productBrandName}"></c:out>
                        <c:out value="${row.productName}"></c:out>
                      <p>
                        <c:out value="${row.productCategory}"></c:out>
                      </p>
                      <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>
                    </div>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-xs-1"></div>
       
              <c:forEach var="row" items="${result.rows}" begin="10" end="14">
                <div class="col-md-2 col-xs-6">
                  <div class=" mg-image">
                    <a href="ProductDetailsFetch?productId=
                    <c:out value="${row.productId}"></c:out>
                    ">
                    <img src="
                    <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
                    " alt="Lights" width="150px" height="150px">
                    <div class="caption">
                      <p>
                        <br><br>
                        <c:out value="${row.productBrandName}"></c:out>
                        <c:out value="${row.productName}"></c:out>
                      <p>
                        <c:out value="${row.productCategory}"></c:out>
                      </p>
                      <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>
                    </div>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-xs-1"></div>
             
              <c:forEach var="row" items="${result.rows}" begin="15" end="19">
                <div class="col-md-2 col-xs-6">
                  <div class=" mg-image">
                    <a href="ProductDetailsFetch?productId=
                    <c:out value="${row.productId}"></c:out>
                    ">
                    <img src="
                    <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
                    " alt="Lights" width="150px" height="150px">
                    <div class="caption">
                      <p>
                        <br><br>
                        <c:out value="${row.productBrandName}"></c:out>
                        <c:out value="${row.productName}"></c:out>
                      <p>
                        <c:out value="${row.productCategory}"></c:out>
                      </p>
                      <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>
                    </div>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel3" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel3" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
        </a>
      </div>
      <br>
      <h2 class="deal"> T-SHIRTS<span class="glyphicon glyphicon-tags"></span> </h2>
      <div id="myCarousel4" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel4" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel4" data-slide-to="1"></li>
          <li data-target="#myCarousel4" data-slide-to="2"></li>
          <li data-target="#myCarousel4" data-slide-to="3"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <div class="row">
              <div class="col-xs-1"></div>
              <sql:query var="result" dataSource="${snapshot}">
                SELECT * FROM products where productCategory='Men Clothing';
              </sql:query>
              <c:forEach var="row" items="${result.rows}" begin="0" end="4">
                <div class="col-md-2 col-xs-6">
                  <div class=" mg-image">
                    <a href="ProductDetailsFetch?productId=
                    <c:out value="${row.productId}"></c:out>
                    ">
                    <img src="
                    <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
                    " alt="Lights" width="150px" height="150px">
                    <div class="caption">
                      <p>
                        <br><br>
                        <c:out value="${row.productBrandName}"></c:out>
                        <c:out value="${row.productName}"></c:out>
                      <p>
                        <c:out value="${row.productCategory}"></c:out>
                      </p>
                      <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>
                    </div>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-xs-1"></div>
           
              <c:forEach var="row" items="${result.rows}" begin="5" end="9">
                <div class="col-md-2 col-xs-6">
                  <div class=" mg-image">
                    <a href="ProductDetailsFetch?productId=
                    <c:out value="${row.productId}"></c:out>
                    ">
                    <img src="
                    <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
                    " alt="Lights" width="150px" height="150px">
                    <div class="caption">
                      <p>
                        <br><br>
                        <c:out value="${row.productBrandName}"></c:out>
                        <c:out value="${row.productName}"></c:out>
                      <p>
                        <c:out value="${row.productCategory}"></c:out>
                      </p>
                      <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>
                    </div>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-xs-1"></div>
             
              <c:forEach var="row" items="${result.rows}" begin="10" end="14">
                <div class="col-md-2 col-xs-6">
                  <div class=" mg-image">
                    <a href="ProductDetailsFetch?productId=
                    <c:out value="${row.productId}"></c:out>
                    ">
                    <img src="
                    <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
                    " alt="Lights" width="150px" height="150px">
                    <div class="caption">
                      <p>
                        <br><br>
                        <c:out value="${row.productBrandName}"></c:out>
                        <c:out value="${row.productName}"></c:out>
                      <p>
                        <c:out value="${row.productCategory}"></c:out>
                      </p>
                      <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>
                    </div>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-xs-1"></div>
             
              <c:forEach var="row" items="${result.rows}" begin="15" end="19">
                <div class="col-md-2 col-xs-6">
                  <div class=" mg-image">
                    <a href="ProductDetailsFetch?productId=
                    <c:out value="${row.productId}"></c:out>
                    ">
                    <img src="
                    <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
                    " alt="Lights" width="150px" height="150px">
                    <div class="caption">
                      <p>
                        <br><br>
                        <c:out value="${row.productBrandName}"></c:out>
                        <c:out value="${row.productName}"></c:out>
                      <p>
                        <c:out value="${row.productCategory}"></c:out>
                      </p>
                      <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>
                    </div>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel4" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel4" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
        </a>
      </div>
    </div>
    
    <div class="small">
      <h3><font color="#2874A6">Men's Footwear<span class="glyphicon glyphicon-tags"></span></font></h3>
      <div class="row">
        <div class="col-xs-1"></div>
        <sql:query var="result" dataSource="${snapshot}">
          SELECT * FROM products where productCategory='Men Footwear';
        </sql:query>
        <c:forEach var="row" items="${result.rows}" begin="0" end="1">
          <div class="col-xs-5">
            <div class=" mg-image">
              <a href="ProductDetailsFetch?productId=
              <c:out value="${row.productId}"></c:out>
              ">
              <img src="
              <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
              " alt="Lights" width="150px" height="150px">
              <div class="caption">
                <p>
                  <br><br>
                  <c:out value="${row.productBrandName}"></c:out>
                  <c:out value="${row.productName}"></c:out>
                <p>
                  <c:out value="${row.productCategory}"></c:out>
                </p>
                <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>
              </div>
              </a>
            </div>
          </div>
        </c:forEach>
        <div class="col-xs-1"></div>
      </div>
      <div class="row">
        <div class="col-xs-1"></div>
        
        <c:forEach var="row" items="${result.rows}" begin="2" end="3">
          <div class="col-xs-5">
            <div class=" mg-image">
              <a href="ProductDetailsFetch?productId=
              <c:out value="${row.productId}"></c:out>
              ">
              <img src="
              <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
              " alt="Lights" width="150px" height="150px">
              <div class="caption">
                <p>
                  <br><br>
                  <c:out value="${row.productBrandName}"></c:out>
                  <c:out value="${row.productName}"></c:out>
                <p>
                  <c:out value="${row.productCategory}"></c:out>
                </p>
                <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>
              </div>
              </a>
            </div>
          </div>
        </c:forEach>
        <div class="col-xs-1"></div>
      </div>
      <h3><font color="#2874A6">Women's Footwear<span class="glyphicon glyphicon-tags"></span></font></h3>
      <div class="row">
        <div class="col-xs-1"></div>
        <sql:query var="result" dataSource="${snapshot}">
          SELECT * FROM products where productCategory='Women Footwear';
        </sql:query>
        <c:forEach var="row" items="${result.rows}" begin="0" end="1">
          <div class="col-xs-5">
            <div class=" mg-image">
              <a href="ProductDetailsFetch?productId=
              <c:out value="${row.productId}"></c:out>
              ">
              <img src="
              <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
              " alt="Lights" width="150px" height="150px">
              <div class="caption">
                <p>
                  <br><br>
                  <c:out value="${row.productBrandName}"></c:out>
                  <c:out value="${row.productName}"></c:out>
                <p>
                  <c:out value="${row.productCategory}"></c:out>
                </p>
                <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>              </div>
              </a>
            </div>
          </div>
        </c:forEach>
        <div class="col-xs-1"></div>
      </div>
      <div class="row">
        <div class="col-xs-1"></div>
      
        <c:forEach var="row" items="${result.rows}" begin="2" end="3">
          <div class="col-xs-5">
            <div class=" mg-image">
              <a href="ProductDetailsFetch?productId=
              <c:out value="${row.productId}"></c:out>
              ">
              <img src="
              <c:out value="${ConfigurationBean.getImgLoc()}${row.productImageName}" />
              " alt="Lights" width="150px" height="150px">
              <div class="caption">
                <p>
                  <br><br>
                  <c:out value="${row.productBrandName}"></c:out>
                  <c:out value="${row.productName}"></c:out>
                <p>
                  <c:out value="${row.productCategory}"></c:out>
                </p>
                <p><b>&#8377;
                        <c:out value="${row.price}"></c:out>
                        </b>
                      </p>
              </div>
              </a>
            </div>
          </div>
        </c:forEach>
        <div class="col-xs-1"></div>
      </div>
    </div>
   
    
    
   </div>
   
    	
  <!--search loading script-->  
  
  
  
   <script>
   
	//searchbox in head   
	 
	   $(".search").click(function(){
		   $.ajax({
			   type: "POST",
			   url: "TestSearch",
			   dataType: "text",
			   data: {search: $("#searchBox").val(),
				     myFilter1: "viapyar"  
			   
			   },
			 
			   success: function(response){
				   var myObj = $.parseHTML(response);
				   
				   
				  
                   $("#cataloguediv").html(myObj);
                   
                
                   
                   
                  

                   
				   
				  
				   
				   
		       }
		   })
	   });
	 
	
	//search on click enter
	
	$('#searchBox').keypress(function(event){
      if(event.keyCode == 13){
       $('.search').click();
      }
    });
	
	//suggestions generator
	
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


 

	   //property filter
	   $(document).on('click','#mysearch',function(){
		   
		   alert("Submitting");
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
	   });

	   
	//filter based on type   
$(document).on('click','#searchbytype',function(){
		   
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
  

    
    
    
    <%@ include file="footer.html" %>
     
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    
  </body>
</html>







