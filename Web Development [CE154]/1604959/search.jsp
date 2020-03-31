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
	
 		
 	<div class="content">
	

					

	 
	<sql:query var="search">
	Select * from inventory
	where item_description like "%${param.search}%";
	</sql:query>
	
	<table>
			<tr>
				<th>Code</th>
				<th>Description</th>
				<th>Image</th>
				<th>Price</th>
				<th>Stock</th>
	
			</tr>
			
			<c:forEach var = "row"
			items = "${search.rows}">
			
			<tr>
			<td><c:out value ="${row.item_code}"/></td>
			<td><c:out value ="${row.item_description}"/></td> 
			<td><img src="<c:out value ="${row.item_image_loc}"/>" alt="Image" height="100" width="90"/></td>
			<td><c:out value ="${row.item_price}"/></td> 
			<td><c:out value ="${row.item_stock_count}"/></td></tr>
		</c:forEach>
		</table>
		
		
		
	
	
</form>
 	
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