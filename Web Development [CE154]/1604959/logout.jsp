<%@ taglib
 uri="http://java.sun.com/jsp/jstl/core"
 prefix="c" %>
<%

	session.setAttribute("username", null);
%>
<c:redirect url="index.jsp"/>