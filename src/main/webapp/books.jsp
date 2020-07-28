<%@ page import="pl.sda.library.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="pl.sda.library.BookService" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<html>
<head>
    <title>Sda library</title>
</head>
<body>
<%
    Object login = session.getAttribute("login");
    if(login == null) {
        response.sendRedirect("/login.jsp");
    }

    List<Book> books = BookService.getAll();
    request.setAttribute("books", books);
%>

<table>
    <thead>
    <tr>
        <th>Autor</th>
        <th>Tytuł</th>
        <th>Wypożycz/Zwróć</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="book" items="${books}">
        <tr>
            <td>${book.author}</td>
            <td>${book.title}</td>
            <c:choose>
                <c:when test="${book.available}">
                    <td>
                        <form action="rent.jsp" method="post">
                            <input name="bookId" type="hidden" value="${book.id}"/>
                            <input type="submit" value="Wypożycz"/>
                        </form>
                    </td>
                </c:when>
                <c:when test="${!book.available && login.equals(book.userLogin)}">
                    <td>
                        <form action="return.jsp" method="post">
                            <input name="bookId" type="hidden" value="${book.id}"/>
                            <input type="submit" value="Zwróć"/>
                        </form>
                    </td>
                </c:when>
                <c:otherwise>
                    <td>Wypożyczona</td>
                </c:otherwise>
            </c:choose>
        </tr>
    </c:forEach>
    </tbody>
</table>


</body>
</html>
