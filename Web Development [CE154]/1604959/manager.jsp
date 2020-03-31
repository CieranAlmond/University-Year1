<!DOCTYPE html>
<%@ taglib
 uri="http://java.sun.com/jsp/jstl/core"
 prefix="c" %>
<%@ taglib
 uri="http://java.sun.com/jsp/jstl/sql"
 prefix="sql" %>
	<html>
 		<head>
		<script type="text/javascript">
		function validateForm()
		{
			var x=document.manager.username.value;
			var y=document.manager.password.value;
			if (isNaN(x) || y=="")
			{
		alert("Username is not a number. Enter (a) correct password.");
		return false;
			}
		}
		</script>
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

		 <form action="manager.jsp" method="GET" name="manager" onsubmit="return validateForm()">
			<label><b>Manager Number</b></label>
				<input type="text" placeholder="Enter Number" name="username"><br>

			<label><b>Password</b></label><br>
				<input type="password" placeholder="Enter Password" name="password">

					<button type="submit">Login</button>
		</form>
				
		<%
			if ( session.isNew() )
 { 
 }
 else
 {
 session.invalidate();
 %>
 <jsp:forward page="manager.jsp" />
 <%
 }
 %>
 <%
 if ( request.getParameter(
 "username" ) == null )
 {
 out.println(
 "Please login:" );
 }
 else
 {
 pageContext.setAttribute(
 "managerNumberString",
 request.getParameter( "username" ) ); 

 pageContext.setAttribute(
 "managerPasswordString",
 request.getParameter( "password" ) );
 %>

 <sql:query var="result">
 select * from manager where
manager_number =
 "${managerNumberString}" and
 passwd =
 MD5(
 "${managerPasswordString}" );
 </sql:query>
 <c:set var = "numResults"
 scope = "page"
 value = "${result.rowCount}"/>
 <%
 Object o =
 pageContext.getAttribute(
 "numResults" );
 Integer obj = new Integer( 1 );
 int i = obj.intValue();

 if ( pageContext.getAttribute(
 "numResults" ).equals( obj ) )
 {
 String usernameID =
 new String( "username" );
 String usernameVAL =
 new String( request.getParameter(
 "username" ) );
 session.setAttribute(
 usernameID, usernameVAL );
 %>
 <jsp:forward page="managertable.jsp" />
 <%
 }
 else
 {
 out.println( "Login failed, please try again." );
 }
 }
 %> 
 
 <p>
 
	
 
 
 </p>
</form>
		<br>	
 	</p>
 	</div>
 	
 	</div>
	<div class="footer">
 	
 	</div>
 	</body>
	</html>