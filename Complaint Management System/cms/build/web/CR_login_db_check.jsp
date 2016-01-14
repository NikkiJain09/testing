<%-- 
    Document   : CR_login_db_check
    Created on : Aug 22, 2014, 12:18:30 AM
    Author     : nishtha
--%>

<%@page  import="java.sql.*" %>
<%@include file="connection_db.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CR login Check</title>
    </head>
    <body>
        <%
            String CR_session_attr=null;
            String CR_username=request.getParameter("id");
            String CR_pwd=request.getParameter("pwd");
            if(CR_username==null && CR_pwd==null)
            {
            response.sendRedirect("CR_login.jsp");
            }
        String query="select * from complaint_resolver where cr_id='"+CR_username+"' and Password='"+CR_pwd+"'";
        rs=st.executeQuery(query);
        if(rs.next())
        {
            CR_session_attr=rs.getString(1);
            if(CR_session_attr!=null)
            {
            session.setAttribute("CR_sess_attr",CR_session_attr);
            }
            session.setMaxInactiveInterval(200);
            response.sendRedirect("CR_home.jsp");
            //Cookie ck=new Cookie("crid",CR_session_attr);
              //  ck.setMaxAge(24*60);
                //response.addCookie(ck);
         }
        else
         {
            out.println("You are not a registered Complaint Resolver");%>
            <input type="button" value ="Back" name ="Back" onclick="history.back();">

            <%
        }
        %>

    </body>
</html>
