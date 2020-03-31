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
		<br><br>

			
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
            </li> 
		</ul>
				<sql:query var="result">
		select * from inventory where item_group = "1002";
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
			items = "${result.rows}">
			
			<tr>
			<td><c:out value ="${row.item_code}"/></td>
			<td><c:out value ="${row.item_description}"/></td> 
			<td><img src="<c:out value ="${row.item_image_loc}"/>" alt="Image" height="100" width="90"/></td>
			<td><c:out value ="${row.item_price}"/></td>
			<td><c:out value ="${row.item_stock_count}"/></td> 
			<td>
			<form action="purchase.jsp"
					method="GET"> 
					<input
					type = "hidden"
					name = "item_code"
					value = "${row.item_code}" />
					<input
					type = "hidden"
					name = "item_price"
					value = "${row.item_price}" />
					<input
					type = "submit"
					value = "Buy" />
				</form> 
			<form method="get" action="radiobutton.jsp">
	<input type="hidden" name="item_code" value="${row.item_code}" />
	<input type="hidden" name="review" value="${privacy}" />

	<input type="radio" id="private" name="privacy" value="1">
	<label for="private">1</label>

	<input type="radio" id="public" name="privacy" value="2">
	<label for="public">2</label>

	<input type="radio" id="public" name="privacy" value="3">
	<label for="public">3</label>

	<input type="radio" id="public" name="privacy" value="4">
	<label for="public">4</label>

	<input type="radio" id="public" name="privacy" value="5">
	<label for="public">5</label>
	
	<input type="submit" value="Submit Review">

</form>
        <span></span>
    </div>
		</form>
			</td>
		
		</tr>
		</c:forEach>
		</table>
		
		</div>
		
		</div>
		<div class="footer">
		
		</div>

		</body>
</html>
