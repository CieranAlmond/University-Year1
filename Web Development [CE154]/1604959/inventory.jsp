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
	    		<li><a href="index.jsp">Home</a>
		
		
		
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
			  <li><a href="customer.jsp">Customer</a> 
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
			  <li><a href="manager.jsp">Manager</a> 
               <ul> 
          
              </ul>
			  <li><a href="order_item.jsp">Order_item</a> 
               <ul> 
          
              </ul>
			  <li><a href="promotion_code">Promotion_code</a> 
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
				<sql:query var="result">
				SELECT * FROM inventory;
				</sql:query> 
	
	<table>
		
			
			<tr>
				<th> item_code</th>
				<th>item_name</th>
				<th>item_description</th>
				<th>item_author</th>
				<th>item_image_loc</th>
				<th>item_group	</th>
				<th>item_price	</th>
				<th>item_stock_location	</th>
				<th>item_stock_count</th>
				<th>item_order_count	</th>
			</tr>
			
			<c:forEach var = "row"
			items = "${result.rows}">
			
			<tr>
			<td><c:out value ="${row.item_code}"/></td>
			<td><c:out value ="${row.item_name}"/></td> 
			<td><c:out value ="${row.item_description}"/></td> 
			<td><c:out value ="${row.item_author}"/></td>
			<td><c:out value ="${row.item_image_loc}"/></td>
			<td><c:out value ="${row.item_group}"/></td>
			<td><c:out value ="${row.item_price}"/></td>
			<td><c:out value ="${row.item_stock_location}"/></td>
			<td><c:out value ="${row.item_stock_count}"/></td>
			<td><c:out value ="${row.item_order_count}"/></td>
			
		</tr>
		</c:forEach>
		</table>
		
		</div>
		
		</div>
		<div class="footer">
		
		</div>
		</body>
</html>

