<%@ taglib
 uri="http://java.sun.com/jsp/jstl/core"
 prefix="c" %>
<%@ taglib
 uri="http://java.sun.com/jsp/jstl/sql"
 prefix="sql" %>

<!DOCTYPE html>
	<html>
 		<head>
 		<meta charset="UTF-8" />
		<link rel="stylesheet" href="format.css" type="text/css">
		
 	
		<title>
		CE154 Assignment - Cieran Almond
		</title>
		</head>
		
 	<body>
 	<div class="container">
 	<div class="header">
 	<h1 class="header"> 
		My Website
 	</h1>
 	</div>
 	<div class="left">
 	<p>
		
 	<a href="customer.jsp">Customer Login</a>

      <a href="manager.jsp">Manager Login</a>
	  <br>
	  <br>
			 
	  
	  <br>
	  <br>
			
			<%
			if (session.getAttribute("username") == null){
				 
			out.println("You are not currently logged in right now");
			}else{ 
			out.println("You are logged in as" + session.getAttribute("username"));
			}
			%>
		<br>
		<form action="logout.jsp">
		<input
		
		type = "submit"
		value = "Logout" />
		</form>
		

 	</p>
 	</div>
	
 		
 	<div class="content"/>
	
	
	
	
 	<ul id="menu">
	    		<li><a href="homepage.jsp">Home</a>
		
		
		
            <li><a href="book.jsp">Books</a>
		<ul>
		
               
		</ul>
		</li>
            <li><a href="game.jsp">Games</a> 
              <ul>
               
              </ul> 
            </li> 
            <li><a href="cd.jsp">CDs</a> 
              <ul> 
               
              </ul> 
            </li>
            <li><a href="dvd.jsp">DVDS</a> 
               <ul> 
          
              </ul> 
            </li> 
			
	</ul>
 
	
 	<p>
		<br>
				<h2>
				Thank you for your feedback!
				</h2>
		<br>
		<p>
				
			
				
				<sql:update var="insert_review">
					insert into review values
					(NULL, ${username}, "${param.item_code}", ${param.privacy});
				</sql:update>
			
		</p>
 	</p>
 	</div>
 	
 	</div>
	<div class="footer">
 	
 	</div>
 	</body>
	</html> 