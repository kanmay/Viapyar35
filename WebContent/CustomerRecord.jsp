<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/chartist.js/0.10.1/chartist.min.css">
<script src="https://cdn.jsdelivr.net/chartist.js/0.10.1/chartist.min.js"></script>
<script src="https://cdn.jsdelivr.net/chartist.js/0.10.1/chartist.min.js.map"></script>
<title>Insert title here</title>
 <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<link href="bootstrap/css/bootstrap-social.min.css" rel="stylesheet">
	<link href="bootstrap/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<script src="/jquery-3.1.1.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
   
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
    
     <style>
.ct-series-a .ct-line {
  /* Set the colour of this series line */
  stroke: #dd4b39;
  /* Control the thikness of your lines */
  stroke-width: 5px;
  /* Create a dashed line with a pattern */
  
}

/* This selector overrides the points style on line charts. Points on line charts are actually just very short strokes. This allows you to customize even the point size in CSS */
.ct-series-a .ct-point {
  /* Colour of your points */
  stroke: #dd4b39;
  /* Size of your points */
  stroke-width: 14px;
  /* Make your points appear as squares */
  
}

.ct-series-b .ct-line {
  /* Set the colour of this series line */
  stroke: #3b5998;
  /* Control the thikness of your lines */
  stroke-width: 5px;
  /* Create a dashed line with a pattern */
  
}

/* This selector overrides the points style on line charts. Points on line charts are actually just very short strokes. This allows you to customize even the point size in CSS */
.ct-series-b .ct-point {
  /* Colour of your points */
  stroke: #3b5998;
  /* Size of your points */
  stroke-width: 12px;
  /* Make your points appear as squares */
  
}

.ct-series-c .ct-line {
  /* Set the colour of this series line */
  stroke: #3CB371;
  /* Control the thikness of your lines */
  stroke-width: 5px;
  /* Create a dashed line with a pattern */
  
}

/* This selector overrides the points style on line charts. Points on line charts are actually just very short strokes. This allows you to customize even the point size in CSS */
.ct-series-c .ct-point {
  /* Colour of your points */
  stroke: #3CB371;
  /* Size of your points */
  stroke-width: 10px;
  /* Make your points appear as squares */
  
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
  <a href="ModifyProducts.jsp"><div style="cursor:pointer" class="designtog">Modify Products<span style="float:right;" class="glyphicon glyphicon-chevron-right"></span></div></a>
  <hr>
  <a href="CustomerRecord.jsp"><div style="cursor:pointer" class="designtog activepage">Customer Record<span style="float:right;" class="glyphicon glyphicon-chevron-right"></span></div></a>
  <hr>
  <a href="ProductsSales.jsp"><div style="cursor:pointer" class="designtog">Products Sales<span style="float:right;" class="glyphicon glyphicon-chevron-right"></span></div></a>
  <hr>
  <a href=""><div style="cursor:pointer" class="designtog">All Orders<span style="float:right;" class="glyphicon glyphicon-chevron-right"></span></div></a>
  <hr>
  
  
 <!-- <div style="cursor:pointer" class="designtog" data-toggle="collapse" data-target="#demo1">Product Stats<span style="float:right;" class="glyphicon glyphicon-chevron-down"></span></div>
  <div id="demo1" class="collapse">   
 <div style="margin-left:10px;">
  <div class="checkbox">
      <label><input type="checkbox" value="">Graph</label>
    </div>
    <div class="checkbox">
      <label><input type="checkbox" value="">Data</label>
    </div>
    <div class="checkbox">
      <label><input type="checkbox" value="">Pie Chart</label>
    </div>

 </div>
 
  </div>-->
  
  <hr> 
  
 
  
  
  
  
  
  
  
  
  
  
  
  


























    </aside>



<article>

<br><br><br>

<div class="row">

<div class="col-xs-12 col-md-6">
<div class="polaroid">
  <div style="height:300px;">
    <div class="ct-chart ct-golden-section" id="chart1" ></div>
  </div>
  </div>
  <br>
</div>

<div class="col-xs-12 col-md-6">
<div class="polaroid">
  <div style="height:300px;">
    <div class="ct-chart ct-golden-section" id="chart2" ></div>
  </div>
  </div>
  <br>
</div>


</div>





    </article>


  </main>

 
</div>








  
  
 <br><br><br><br>
  
  

  
  <div onclick="filterDiv();" class="small">
  
  <a href="#">
  <div class="fixed">
  <center>
  <h4 >
  Want to apply Filters
  </h4>
  </center>
  </div>
  </a>
  

  
  
  
  
</div>





<script>
function filterDiv(){
 $("#myButton").attr('class', '');
 document.getElementById("article").style.display="none";

 }
 
</script>
<script>

var l;
var googleS;
var facebookS;
var myUsersS;
 $(document).ready(function(){  
	$.ajax({   
		type: "post",
		url: "ReturnUserStatsDayWise",
		success: function(response){
			
			
			var myStats = $.parseJSON(response);
			l = myStats.Data.label;
			
			
			
			googleS=myStats.Data.series[0];
			facebookS=myStats.Data.series[1];
			myUsersS=myStats.Data.series[2];
			
			var labels=new Array(30);
			var seriess=[];

			for(var k=0;k<3;k++){
			 seriess[k]=[];
			}
			var today = new Date();
			var dd = today.getDate();//get todays date
			var mm = today.getMonth()+1;//get Month's Number
			var yy = today.getYear();//get year
			function daysInMonth(month,year) {
			    return new Date(year, month, 0).getDate();
			}
            
			var totalDays = daysInMonth(mm,yy);
			
			

			 var j=0;
			 for(var i=1;i<=totalDays;i++){
			   if(l[j]==i){
			     labels[i]=l[j];
				 seriess[0][i]=googleS[j];
				 seriess[1][i]=facebookS[j];
				 seriess[2][i]=myUsersS[j]
				 
				 j++;
			   }else{
			   labels[i]=i.toString();
			     if(i<=dd){
			      seriess[0][i]=0;
			      seriess[1][i]=0;
			      seriess[2][i]=0;
			     }
			   }
			 
			 
			 
			 }
			

			new Chartist.Line('#chart1', {
			  labels: labels,
			  series: seriess
			}, {
			  fullWidth: true,
			  chartPadding: {
			    right: 40
			  }
			});
			
			
			
		}
	})
 });
 
</script> 
<!-- This shows users added monthwise -->
<script>

var l;
var googleS;
var facebookS;
var myUsersS;
 $(document).ready(function(){  
	$.ajax({   
		type: "post",
		url: "ReturnUserStatsMonthWise",
		success: function(response){
			
			
			var myStats = $.parseJSON(response);
			l = myStats.Data.label;
			
			var month=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
			
			googleS=myStats.Data.series[0];
			facebookS=myStats.Data.series[1];
			myUsersS=myStats.Data.series[2];
			var labels=new Array(11);
			var seriess=[];
			for(var k=0;k<3;k++){
			 seriess[k]=[];
			}
			 var j=0;
			 for(var i=0;i<12;i++){
			   if(l[j]==i+1){
			     labels[i]=l[j];
				 seriess[0][i]=googleS[j];
				 seriess[1][i]=facebookS[j];
				 seriess[2][i]=myUsersS[j];
				 j++;
			   }else{
			   labels[i]=i.toString();
			      seriess[0][i]=0;
			      seriess[1][i]=0;
			      seriess[2][i]=0;
			   }
			 
			 
			 
			 }
			 labels=month;

			new Chartist.Line('#chart2', {
			  labels: labels,
			  series: seriess
			}, {
			  fullWidth: true,
			  chartPadding: {
			    right: 40
			  }
			});
			
			
			
		}
	})
 });
 
</script>
<!-- This script is for representing Product sales data daywise -->
<script>

var wlbl;
$(document).ready(function(){   
	$.ajax({
		type: "Post",
		url: "ReturnProductsStatsDayWise",
		success: function(response){
			var myStats = $.parseJSON(response);
			
			console.log(response);
			
			var wlbl = myStats.Data.Wlabel;
			var nlbl = myStats.Data.Nlabel;
			
			wS=myStats.Data.Wseries;
			nS=myStats.Data.Nseries;
			
			
			
			
			
			
			var today = new Date();
			var dd = today.getDate();//get todays date
			var mm = today.getMonth()+1;//get Month's Number
			var yy = today.getYear();//get year
			function daysInMonth(month,year) {
			    return new Date(year, month, 0).getDate();
			}
			
			var totalDays = daysInMonth(mm,yy);
			
			var labels=new Array(totalDays);
			
			var wSeries =new Array(totalDays);
			var nSeries =new Array(totalDays);
			
			console.log("Hiee "+wlbl);
			

			 var j=0;
			 for(var i=1;i<=totalDays;i++){
			   if(wlbl[j]==i){
			     labels[i]=wlbl[j];
				 wSeries[i]=wS[j];
				 nSeries[i]=nS[j];
				 
				 j++;
			   }else{
			   labels[i]=i.toString();
			    
			    	 wSeries[i]=0;
			    	 console.log("Mayu "+wSeries[i]);
					 nSeries[i]=0;
			      
			     
			   }
			 
			 
			 
			 }
			 
			 

			new Chartist.Line('#chart3', {
			  labels: labels,
			  series: [wSeries]
			}, {
			  fullWidth: true,
			  chartPadding: {
			    right: 40
			  }
			});
			
			new Chartist.Line('#chart4', {
				  labels: labels,
				  series: [nSeries]
				}, {
				  fullWidth: true,
				  chartPadding: {
				    right: 40
				  }
				});
			
		}
	});
	
});
</script>

<!-- It shows products sales status month wise -->
<script>
var l;

 $(document).ready(function(){  
	$.ajax({   
		type: "post",
		url: "ReturnProductsStatsMonthWise",
		success: function(response){
		    var myStats = $.parseJSON(response);
		    console.log(response);
			var l = myStats.Data.Wlabel;
			
			var month=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
			
			var wS = myStats.Data.Wseries;
			var nS = myStats.Data.Nseries;
			
			console.log("Mayu "+wS);
			
			var nSeries = new Array(12);
			var wSeries = new Array(12);
			
			var labels=new Array(11);
			 var j=0;
			 for(var i=0;i<12;i++){
			   if(l[j]==i+1){
			     labels[i]=l[j];
				 nSeries[i]=nS[j];
				 wSeries[i]=wS[j]
				 j++;
			   }else{
			   labels[i]=i.toString();
			      nSeries[i]=0;
			      wSeries[i]=0;
			   }
			 
			 
			 
			 }
			 labels=month;

			new Chartist.Line('#chart5', {
			  labels: labels,
			  series: [wSeries,nSeries]
			}, {
			  fullWidth: true,
			  chartPadding: {
			    right: 40
			  }
			});
			
			
			
		}
	})
 });

</script>




 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>

</body>
</html>