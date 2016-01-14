<%-- 
    Document   : admin_login_db_check
    Created on : 17 Aug, 2014, 9:19:55 AM
    Author     : prachi
--%>
<%@page  import="java.sql.*" %>
<%@include file="connection_db.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin DB Check</title>
    </head>
    <body>
        <%
            String admin_session_attr=null;
            String admin_username=request.getParameter("uid");
            String admin_password=request.getParameter("upass");
            if(admin_username==null && admin_password==null){
            response.sendRedirect("admin_login.jsp");
        }
        //Class.forName("com.mysql.jdbc.Driver");
        //Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","bansal");
        //Statement st=connection.createStatement();
        //ResultSet rs=null;
        String query="select * from admin where a_id='"+admin_username+"' and Password='"+admin_password+"'";
        rs=st.executeQuery(query);
        if(rs.next()){
            out.println("Hello");
            out.println(rs.getString(1)+"     "+rs.getString(2));
            admin_session_attr=rs.getString(1);
            if(admin_session_attr!=null){
                session.setAttribute("admin_sess_attr",admin_session_attr);
                //Cookie ck=new Cookie("aid",admin_session_attr);
                //ck.setMaxAge(24*60);
                //response.addCookie(ck);
                session.setMaxInactiveInterval(60);
                response.sendRedirect("admin_home.jsp");
            }
        }
        else{
            out.println("You are not a registered Admin");%>
            <input type="button" value ="Back" name ="Back" onclick="history.back();">
            
            <%
        }
        %>
        
    </body>
</html>
