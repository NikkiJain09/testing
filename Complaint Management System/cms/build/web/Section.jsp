<%-- 
    Document   : Section
    Created on : 18 Aug, 2014, 6:28:07 PM
    Author     : Ammu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cache_admin.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String s11=request.getParameter("VC");
         //out.println(s);
        if(s11.equals("Student_Wise")){
            response.sendRedirect("view_student.jsp");
        }
        else if(s11.equals("Employee_Wise")){
            response.sendRedirect("view_employee.jsp");
                }
        else if(s11.equals("Division_Wise")){
            response.sendRedirect("division_select.jsp");
                }
        else if(s11.equals("All_Complaints")){
            response.sendRedirect("view_all_complaint.jsp");
                }
        else{
            response.sendRedirect("location_select.jsp"); 
        }
            %>
             
       </br>
                <%
                        %>
    </body>
</html>


