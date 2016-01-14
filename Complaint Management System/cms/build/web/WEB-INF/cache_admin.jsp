<%-- 
    Document   : cache_admin
    Created on : 17 Aug, 2014, 9:33:33 AM
    Author     : prachi
--%>


    <%
        if(session==null){
            response.sendRedirect("admin_login.jsp");
        }
        String s=(String)session.getAttribute("admin_sess_attr");
        if(s==null){
            response.sendRedirect("admin_login.jsp");
            
        }
        else{
            out.println("Welcome  "+ s);
        }
        %>

