<%@ page import="pl.sda.library.BookService" %>
<%@ page import="pl.sda.library.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<html>
<head>
    <title>Sda library</title>
</head>
<body>
<%
    String login = (String) session.getAttribute("login");
    int id = Integer.parseInt(request.getParameter("bookId"));
    Book book = BookService.getOne(id);
    BookService.rentBook(id, login);
    out.print(String.format("<div>Wypożyczono ksiązkę: %s %s </div>", book.getAuthor(), book.getTitle()));
%>

<div>
    <a href="books.jsp">Wróć do listy książek</a>
</div>

</body>
</html>
