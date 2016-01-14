<%-- 
    Document   : logout
    Created on : 17 Aug, 2014, 1:21:33 PM
    Author     : prachi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Logout</title>
    </head>
    <body>
        <%
            session.invalidate();
           // Cookie[] ck=request.getCookies();
            //if(ck!=null){
            //ck[1].setMaxAge(0);
            //response.addCookie(ck[1]);
           // }
            response.sendRedirect("majr_home.jsp");
        %>
        <h1>Hello World!</h1>
    </body>
</html>
