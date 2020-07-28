<%@ page import="pl.sda.library.Book" %>
<%@ page import="pl.sda.library.BookService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<html>
<head>
    <title>Sda library</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("bookId"));
    Book book = BookService.getOne(id);
    BookService.returnBook(id);
    out.print(String.format("<div>Oddano książkę: %s %s</div>", book.getAuthor(), book.getTitle()));
%>

<div>
    <a href="books.jsp">Wróć do listy książek</a>
</div>

</body>
</html>
