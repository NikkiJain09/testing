<%-- 
    Document   : Section
    Created on : 18 Aug, 2014, 6:28:07 PM
    Author     : Ammu
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cache_admin.jsp"%>
<%@include file="connection_db.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String s1=request.getParameter("DC");
         //out.println(s);
       // ResultSet rs1=null;
        if(s1.equals("Electrical_Dept")){
            String q="select * from Complaint where C_id like '_E%'";
            rs1=st3.executeQuery(q);
        }
        else if(s1.equals("Water_Dept")){
            String q="select * from Complaint where C_id like '_W%'";
            rs1=st3.executeQuery(q);
                }
        else {
            String q="select * from Complaint where C_id like '_C%'";
            rs1=st3.executeQuery(q);
                }
        //Statement st=con.createStatement();
        //ResultSet rs=null;
               while(rs1.next()){
                %>
                <a href="display_single_complaint.jsp?value=<%=rs1.getString(1)%>"><%out.println(rs1.getString(1));%></a>
                </br>
                <%
            }
            %>
             
       </br>
              <input type="button" value ="Back" name ="Back" onclick="history.back();">
    </body>
</html>
