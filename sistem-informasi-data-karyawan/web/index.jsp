<%-- 
    Document   : index
    Created on : Jul 11, 2012, 7:27:02 PM
    Author     : Luckma
--%>

<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login Dolohh</h1>
        <form action="Login" method="POST">
            <input type="text" name="id" />
            <input type="password" name="password" />
            <input type="submit" value="Login" />
        </form>
    </body>
</html>
