<%-- 
    Document   : CR_assign_complaint
    Created on : Aug 22, 2014, 7:45:21 PM
    Author     : nishtha
--%>

<%@page  import="java.sql.*" %>
<%@include file="connection_db.jsp"%>
<%@include file="cache_CR.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CR login Check</title>
    </head>
    <body>
        <%
            String Crid=(String) session.getAttribute("CR_sess_attr");
            String Cid=(String)  session.getAttribute("comp_id");
            
            int num;
            //try
              //      {
        String query="{call cms.count_assigned_complaints(?,?,?)}";
        CallableStatement cs=con.prepareCall(query);
        cs.setString(1,Crid);
        cs.setString(2,Cid);
        cs.registerOutParameter(3, java.sql.Types.INTEGER);
        cs.execute();
        num=cs.getInt(3);
        System.out.println("hey..."+num+ Cid);
            if(num<10)
                {
                session.setAttribute("ass_msg","You have been assigned the complaint");
        }
                else
         { session.setAttribute("ass_msg","You already have 10 complaints assigned to you so you cannot take more complaints");
            }
        response.sendRedirect("CR_take_complaint.jsp");
       // }
         //   catch(Exception e)
           //         {
             //   e.printStackTrace();
               // }
            
        %>
<input type="button" value ="Back" name ="Back" onclick="history.back();" id="button">
    </body>
</html>

