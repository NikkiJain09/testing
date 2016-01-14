<%-- 
    Document   : CR_set_status
    Created on : Aug 23, 2014, 1:13:38 AM
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
            String Cid=(String)  session.getAttribute("scomp_id");
            String val=(String) request.getParameter("status");
            int num;
            System.out.print(val);
            if(val!=null)
                {
            int status =Integer.parseInt(val);

            
            if(status==0)
                {
                response.sendRedirect("CR_update_status.jsp");
                }
            }
            try
                    {
        String query="{call cms.set_status_CR(?,?,?)}";
        CallableStatement cs=con.prepareCall(query);
        cs.setString(1,Cid);
        cs.setString(2,val);
        cs.registerOutParameter(3, java.sql.Types.INTEGER);
        cs.execute();
        num=cs.getInt(3);
        System.out.println("hey..."+num+ Cid);
            if(num==1)
                {
                session.setAttribute("stat_msg","Status updated for "+Cid+". Choose other complaint to update status");
        }
                else
         { session.setAttribute("stat_msg","Status not assigned. Please Retry");
            }
        response.sendRedirect("CR_update_status.jsp");
        }
            catch(Exception e)
                    {
                e.printStackTrace();
                }

        %>

    </body>
</html>

