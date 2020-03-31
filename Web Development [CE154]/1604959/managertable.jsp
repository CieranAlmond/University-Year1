<%@ taglib
 uri="http://java.sun.com/jsp/jstl/core"
 prefix="c" %>
<%@ taglib
 uri="http://java.sun.com/jsp/jstl/sql"
 prefix="sql" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
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
		<form action="logout.jsp">
		<input
		
		type = "submit"
		value = "Logout" />
		</form>
		</div>
		<div class="content">
		<ul id="menu">
	    		
			  <li><a href="customer_database.jsp">Customer</a> 
               <ul> 
          
              </ul>
			  <li><a href="customer_order.jsp">Customer_order</a> 
               <ul> 
          
              </ul>
			  <li><a href="inventory.jsp">Inventory</a> 
               <ul> 
          
              </ul>
			  <li><a href="inventory_group.jsp">Inventory_group</a> 
               <ul> 
          
              </ul>
			  <li><a href="manager_database.jsp">Manager</a> 
               <ul> 
          
              </ul>
			  <li><a href="order_item.jsp">Order_item</a> 
               <ul> 
          
              </ul>
			  <li><a href="promotion_code.jsp">Promotion_code</a> 
               <ul> 
          
              </ul>
			  <li><a href="review.jsp">Review</a> 
               <ul> 
          
              </ul> 
			  
            </li> 
		</ul>
		<h2>
		Manager Only
		</h2>
				
		
		</div>
		
		</div>
		<div class="footer">
		
		</div>
		</body>
</html>

