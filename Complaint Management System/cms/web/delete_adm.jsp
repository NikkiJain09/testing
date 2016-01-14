<%-- 
    Document   : delete_adm
    Created on : 17 Aug, 2014, 5:46:48 PM
    Author     : prachi
--%>

<%@page import="java.sql.*"%>
<%@include file="connection_db.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //Class.forName("com.mysql.jdbc.Driver");
            //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms", "root","bansal");
            //Statement st=con.createStatement();
            Statement st1=con.createStatement();
            //ResultSet rs=null;
            String ch[]=request.getParameterValues("cd");
            String ch1[]=request.getParameterValues("cd1");
            if(ch!=null){
            for(int i=0;i<ch.length;i++){
                String q="delete  from Complaint where C_id='"+ch[i]+"'";
                st.executeUpdate(q);
            }
            
            }
            
            if(ch1!=null){
            for(int i=0;i<ch1.length;i++){
            
                            String q1="delete from Complaint where C_id='"+ch1[i]+"'";
                            st1.executeUpdate(q1);
                        }
            }
            
            response.sendRedirect("admin_home.jsp");
            %>
    </body>
</html>
