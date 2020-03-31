<%@ taglib
 uri="http://java.sun.com/jsp/jstl/core"
 prefix="c" %> 
<%@ taglib
 uri="http://java.sun.com/jsp/jstl/sql"
 prefix="sql" %>
<%@ page import="java.lang.*" %>
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
 	</p>
 	</div>
	
 		
 	<div class="content">
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
		<sql:query var="out_of_stock">
		select * from inventory where item_code="${param.item_code}";
		</sql:query>
		<c:set var="stockNo" value="${out_of_stock.rows[0]['item_stock_count']}" scope = "page" />
<% if ((int)pageContext.getAttribute("stockNo") == 0){
		out.println("This item is out of stock");
		
	} else {
		out.println ("Do you wish to purchase an item with item code" + request.getParameter( "item_code") + " and price" + request.getParameter( "item_price") + "?");
 %>

 
 



 <form action="completepurchase.jsp" method="POST">
	<input
		type = "hidden"
		name = "item_code"
		value = "${param.item_code}" />
			
	<input
		type = "submit"
		value = "Complete Purchase" />
		
	</form>
	
	  <form action="completepurchase.jsp" method="GET">
			<label><b>Discount Code</b></label>
			<input 
				type="text" 
				placeholder="Enter Code" 
				name="Promotional Code">
				<br />
			<input
			type= "hidden"
			name= "code"
			value= "${param.code}" />
				
				 

	
		
	</form>	
	<% } %>
		<br>
		<br>

			
 	</p>
 	</div>
 	
 	</div>
	<div class="footer">
 	
 	</div>
 	</body>
	</html>  