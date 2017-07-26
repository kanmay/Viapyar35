

function createCatalogue(myObj){
	var x;
	var PArray=[];	
	var found=0;
	var CArray=[];
	var match;
	var flag=0;
	

	
	
	
			        		
		document.write(	'<link href="bootstrap/css/bootstrap.min.cs" rel="stylesheet">'+
				
				
			
			'<link href="bootstrap/css/bootstrap-social.min.css" rel="stylesheet">'+
			'<link href="bootstrap/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">'+
			'<link rel="stylesheet" media="screen and (min-width: 768px) and (max-width: 2000px)" href="css/stylefilter.css" />'+
		     '<link rel="stylesheet" media="screen and (min-width: 0px) and (max-width: 767px)" href="css/filtermin.css" />'
			
			
			
             

			
			
			
			
	
	
	);
		if (document.documentMode || /Edge/.test(navigator.userAgent)) {
			document.write('<script src="js/jquery-3.1.1.min.js"></script>');
		}
	
	
document.write(
		
		
	'<div class="wrap">'+
	  '<main>'+
	    '<aside id="aside">'+
	      '<br><br><br>'+
	      '<div id="myButton" class="hidet">'+
	        '<h3 style="padding-left:2px">Filters</h3>'+
	        '<hr>'
	        );
	    
                   CArray.push(myObj.productsList.products[0].productCategory);
                   match=CArray[0];
                   document.write(match+"  "+CArray[0]);
              
	               for(var a=1;a<myObj.productsList.products.length;a++){
	            	   document.write(myObj.productsList.products[a].productCategory);
	            	   if((myObj.productsList.products[a].productCategory)!==match){
	    		     flag=1;
	    		     document.write(myObj.productsList.products[a].productCategory+"   Runs");
	    		     break;
	    	         }
	   
	               }
	   
	      if(flag==0){       
	        
             document.write( 
	           '<div style="cursor:pointer" class="designtog" data-toggle="collapse" data-target="#demo1">Property1<span style="float:right;" class="glyphicon glyphicon-chevron-down"></span></div>'+
	           '<div id="demo1" class="collapse">'+
	           '<div style="margin-left:10px;">');

                   for(var k=0;k<myObj.productsList.products.length;k++){     
         
     	                x=myObj.productsList.products[k].prop1;
   	
     	                for(var m=0;m<=PArray.length;m++){
     	                  found=0;
   		                  if(PArray[m]==x||x==""){
 	                        found=1;
 	                        break;
   		                  }
                        }
     	                
     	                if(found==0){
     		               PArray.push(x);
     		             
     	                 }
                     }
                   
                     for(var s=0;s<PArray.length;s++){

   	                     document.write( '<div class="checkbox">'+
   		                     '<label><input type="checkbox" value="">'+PArray[s]+'</label>'+
   		                     '</div>'
   	                     );
   	   		          }

   
   
                     
                        document.write( '</div>'+
	                       '</div>'+
	                        '<hr>');

 PArray=[];
 
	        
	        
 document.write( 
	        '<div style="cursor:pointer" class="designtog" data-toggle="collapse" data-target="#demo2">Property2<span style="float:right;" class="glyphicon glyphicon-chevron-down"></span></div>'+
	        '<div id="demo2" class="collapse">'+
	          '<div style="margin-left:10px;">');

                for(var k=0;k<myObj.productsList.products.length;k++){     
      
  	                x=myObj.productsList.products[k].prop2;
	
  	                for(var m=0;m<=PArray.length;m++){
  	                
  	                	  found=0;
		                  if(PArray[m]==x||x==""){
	                        found=1;
	                        break;
		                  }
                     }
  	                if(found==0){
  		               PArray.push(x);
  		           
  	                 }
                  }
                
                  for(var s=0;s<PArray.length;s++){

	                     document.write( '<div class="checkbox">'+
		                     '<label><input type="checkbox" value="">'+PArray[s]+'</label>'+
		                     '</div>'
	                     );
	   		          }



                  
                       document.write( '</div>'+
	                    '</div>'+
	                    '<hr>');

PArray=[];



document.write( 
        '<div style="cursor:pointer" class="designtog" data-toggle="collapse" data-target="#demo3">Property3<span style="float:right;" class="glyphicon glyphicon-chevron-down"></span></div>'+
        '<div id="demo3" class="collapse">'+
          '<div style="margin-left:10px;">');

               for(var k=0;k<myObj.productsList.products.length;k++){     
     
 	                x=myObj.productsList.products[k].prop3;
	
 	                for(var m=0;m<=PArray.length;m++){
 	                	
 	                	  found=0;
		                  if(PArray[m]==x||x==""){
	                        found=1;
	                        break;
		                  }
                    }
 	                if(found==0){
 		               PArray.push(x);
 		             
 	                 }
                 }
               
                 for(var s=0;s<PArray.length;s++){

	                     document.write( '<div class="checkbox">'+
		                     '<label><input type="checkbox" value="">'+PArray[s]+'</label>'+
		                     '</div>'
	                     );
	   		          }



                 
                        document.write( '</div>'+
                           '</div>'+
                           '<hr>');

PArray=[];



document.write( 
        '<div style="cursor:pointer" class="designtog" data-toggle="collapse" data-target="#demo4">Property4<span style="float:right;" class="glyphicon glyphicon-chevron-down"></span></div>'+
        '<div id="demo4" class="collapse">'+
          '<div style="margin-left:10px;">');

               for(var k=0;k<myObj.productsList.products.length;k++){     
     
 	                x=myObj.productsList.products[k].prop4;
	
 	                for(var m=0;m<=PArray.length;m++){
 	                	
 	                	  found=0;
		                  if(PArray[m]==x||x==""){
	                        found=1;
	                        break;
		                  }
                    }
 	                if(found==0){
 		               PArray.push(x);
 		             
 	                 }
                 }
               
                 for(var s=0;s<PArray.length;s++){

	                     document.write( '<div class="checkbox">'+
		                     '<label><input type="checkbox" value="">'+PArray[s]+'</label>'+
		                     '</div>'
	                     );
	   		          }



                 
                       document.write( '</div>'+
                       '</div>'+
                       '<hr>');

PArray=[];



document.write( 
        '<div style="cursor:pointer" class="designtog" data-toggle="collapse" data-target="#demo5">Property5<span style="float:right;" class="glyphicon glyphicon-chevron-down"></span></div>'+
        '<div id="demo5" class="collapse">'+
          '<div style="margin-left:10px;">');

               for(var k=0;k<myObj.productsList.products.length;k++){     
     
 	                x=myObj.productsList.products[k].prop5;
	
 	                for(var m=0;m<=PArray.length;m++){
 	                	
 	                	  found=0;
		                  if(PArray[m]==x||x==""){
	                        found=1;
	                        break;
		                  }
                    }
 	                if(found==0){
 		               PArray.push(x);
 		            
 	                 }
                 }
               
                 for(var s=0;s<PArray.length;s++){

	                     document.write( '<div class="checkbox">'+
		                     '<label><input type="checkbox" value="">'+PArray[s]+'</label>'+
		                     '</div>'
	                     );
	   		          }



                 
                      document.write( '</div>'+
                        '</div>'+
                        '<hr>');

	     	 }
	     	 else{
	     		 
	     		document.write( 
	     		        '<div style="cursor:pointer" class="designtog" data-toggle="collapse" data-target="#demo4">Sort By Category<span style="float:right;" class="glyphicon glyphicon-chevron-down"></span></div>'+
	     		        '<div id="demo4" class="collapse">'+
	     		          '<div style="margin-left:10px;">');

	     		               for(var k=0;k<myObj.productsList.products.length;k++){     
	     		     
	     		 	                x=myObj.productsList.products[k].productCategory;
	     			
	     		 	                for(var m=0;m<=PArray.length;m++){
	     		 	                	
	     		 	                	  found=0;
	     				                  if(PArray[m]==x||x==""){
	     			                        found=1;
	     			                        break;
	     				                  }
	     		                    }
	     		 	                if(found==0){
	     		 		               PArray.push(x);
	     		 		            
	     		 	                 }
	     		                 }
	     		               
	     		                 for(var s=0;s<PArray.length;s++){

	     			                     document.write( '<div class="checkbox">'+
	     				                     '<label><input type="checkbox" value="">'+PArray[s]+'</label>'+
	     				                     '</div>'
	     			                     );
	     			   		          }



	     		                 
	     		                       document.write( '</div>'+
	     		                       '</div>'+
	     		                       '<hr>');

	     		 
	     		 
	     	 }


	        
	        
 
	   document.write(   '</div>'+
	    '</aside>');
	    
	   document.write( '<article id="article">'+
	      '<div class="big"><br><br></div>'+
	      '<div class="row rowcol">');
	        for(var k=0;k<myObj.productsList.products.length;k++){
	        document.write('<div class="col-md-3 col-xs-6 no">'+
	          '<div class="extra thumbnai">'+
	            '<a href=" ">'+
	              '<img src="file:///D:/Kanmay/'+myObj.productsList.products[k].productImageName+'" height="150px" width="150px">'+
	              '<p> <b>'+myObj.productsList.products[k].productName+
	               '</b>'+
	              '</p>'+
	            '</a>'+
	          '</div>'+
	        '</div>');
	        }
	        
	      document.write('</div>'+
	    '</article>'+
	  '</main>'+
	'</div>');
	      
	     
	     //document.write(
		   //  '<script src="bootstrap/js/bootstrap.min.js"></script>');
	     
	  
	     // $.getScript("bootstrap/js/bootstrap.min.js");
	     // <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	      //$.getScript("https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js");
	    	/*	    <!-- Include all compiled plugins (below), or include individual files as needed -->
	    		    <script src="bootstrap/js/bootstrap.min.js"></script>
	*/
	
	
}