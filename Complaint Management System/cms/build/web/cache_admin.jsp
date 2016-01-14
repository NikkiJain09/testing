<%-- 
    Document   : cache_admin
    Created on : 17 Aug, 2014, 9:33:33 AM
    Author     : prachi
--%>


    <%
        /*HttpSession se=request.getSession(false);
        if(se==null){
            response.sendRedirect("admin_login.jsp");
        }*/
        String s=(String)session.getAttribute("admin_sess_attr");
        
        //Cookie[] ck=request.getCookies();
        //out.println("<h3>"+ck.length);
        //if(ck.length==1){
          //  response.sendRedirect("majr_home.jsp");
        //}
        if(s==null ){
        
            response.sendRedirect("admin_login.jsp");
            
        }
        
        /*Cookie[] c=request.getCookies();
        if(c!=null){
            out.println("HELLO");
            for(int i=0;i<c.length;i++){
                String name=c[i].getName();
                String value=c[i].getValue();
                //if(i!=0)
                out.println("Wecome ----------- "+ value);
            }
        }
        if(c==null){
            out.println("your session has expired");
            response.sendRedirect("admin_login.jsp");
        }*/
        %>

