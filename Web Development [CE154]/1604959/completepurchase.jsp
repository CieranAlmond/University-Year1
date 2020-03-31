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
		<br>
	
		
		

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
			<br>
			<br>
			
			
			
				 <%
	if (session.getAttribute("username") == null){
	out.println("Purchase Failed - Please Login As Custumer To Purchase This Item");
	%>
	
	
	<%
	}else if (session.getAttribute("username") != null){
		out.println("Purchase Complete!");	
		
  %>   
	 <sql:query var="result">
	select * from inventory where item_code = "${param.item_code}";
	</sql:query>
	<sql:query var="result2">
		select * from promotion_code where code = "spring01";
	</sql:query>
	
	

 <sql:transaction isolation="serializable">
 <sql:update var="count">
 update inventory set
 item_stock_count =
 item_stock_count - 1
	where item_code="${result_rows[0]['item_code']}";
 </sql:update>
 <sql:update var="count">
	insert into customer_order values
	(NULL, NOW(), 1, NOW() + interval 3 day, ${username});
</sql:update>

<sql:query var = "orderResult">
	select MAX(order_number) FROM customer_order; 
</sql:query>

	
		
		 
<sql:update>
insert into order_item values
("${result.rows[0]['item_code']}", ${result.rows[0]['item_price']}, ${orderResult.rows[0]['max(order_number)']},1);
</sql:update>
 </sql:transaction>
 
	<% } %>
  
	
	</ul>
 
	
 	<p>
		<br>
		
		<br>	
 	</p>
 	</div>
 	
 	</div>
	<div class="footer">
 	
 	</div>
 	</body>
	</html>
