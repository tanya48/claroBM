<%-- 
    Document   : logout
    Created on : 22/04/2019, 05:32:52 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
    <body>
        <%
            session.invalidate();
            response.sendRedirect("/index.jsp");
        %>
    </body>
</html>
