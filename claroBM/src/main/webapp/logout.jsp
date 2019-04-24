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
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-cache");           
            response.setHeader("Expires", "0");
            response.setDateHeader("Expires", -1);
            session.invalidate();
            response.sendRedirect("/index.jsp");
        %>
    </body>
</html>
