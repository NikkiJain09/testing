<%-- 
    Document   : cache_CR
    Created on : Aug 22, 2014, 1:09:24 AM
    Author     : nishtha
--%>


<%
String sms=(String)session.getAttribute("CR_sess_attr");
//Cookie[] ck=request.getCookies();
        //out.println("<h3>"+ck.length);
  //      if(ck.length==1){
    //        response.sendRedirect("majr_home.jsp");
      //  }
        //else 
        if(sms==null){
            response.sendRedirect("CR_login.jsp");
            }
%>