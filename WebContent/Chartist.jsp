<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/chartist.js/0.10.1/chartist.min.css">
<script src="https://cdn.jsdelivr.net/chartist.js/0.10.1/chartist.min.js"></script>
<script src="https://cdn.jsdelivr.net/chartist.js/0.10.1/chartist.min.js.map"></script>
<script src="js/jquery-3.1.1.min.js"></script>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Making Chart</title>
</head>
<body>
    <div class="ct-chart ct-golden-section" id="chart1" style="height:700px;width:700px";></div>
    <div class="ct-chart ct-golden-section" id="chart2" style="height:700px;width:700px";></div>
    <div class="ct-chart ct-golden-section" id="chart3" style="height:700px;width:700px";></div>
    <div class="ct-chart ct-golden-section" id="chart4" style="height:700px;width:700px";></div>
    <div class="ct-chart ct-golden-section" id="chart5" style="height:700px;width:700px";></div>
    <div class="ct-chart ct-golden-section" id="chart6" style="height:700px;width:700px";></div>
</body>



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
</html>