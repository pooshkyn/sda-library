<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<html>
<head>
    <title>Sda library</title>
</head>
<body>

<%
    String login = request.getParameter("login");
    String password = request.getParameter("password");
    if(login == null || password == null) {
        throw new RuntimeException("Incorrect username or password");
    }

    session.setAttribute("login", login);
    response.sendRedirect("/books.jsp");
%>

</body>
</html>
