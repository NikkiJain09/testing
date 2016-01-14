<%-- 
    Document   : features
    Created on : Aug 22, 2014, 2:33:16 PM
    Author     : abc
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
        <%@include file="cache_user.jsp"%>
        <%@include file="connection_db.jsp"%>
        <%@page import="java.util.*"%>
    </head>
    <body>
         <%
         String h="",f=null;
         int c1=0;
         if(s1_u!=null){
    String qu="select * from Complaint where user_id='"+s1_u+"' and resolved=1 and notified=0";
    rs=st.executeQuery(qu);
    while(rs.next()){
         f=rs.getString(1);
        
         h=h+" , "+f;
         c1=1;
    }if(c1==1){ %>
    
        <input type="hidden" value="<%=h%>" id="i">
        <script>
            //function f(){
            var v =document.getElementById("i").value;
            alert("Your Complaint is resolved "+v );
            
    //}</script>
            
    <%
    
    qu="update Complaint set notified=1 where user_id='"+s1_u+"' and resolved=1 and notified=0";
    st.executeUpdate(qu);
   
    }
         }
    %>
        <%
        String referer=null;
      referer = request.getHeader("referer");
      if(referer!=null){
        if(referer.equals("http://localhost:8080/cms/register.jsp")){
            
        out.println(Integer.parseInt(request.getParameter("text10")));
        out.println(request.getParameter("text9"));
            int i = Integer.parseInt(request.getParameter("text10"))+Integer.parseInt(request.getParameter("year"));
             String vdate=null;
                    //if(request.getParameter("text7")==1)
                    if(Integer.parseInt(request.getParameter("Autumn"))==1)  //autumn 30-06-xxxx                        
                    {
                       vdate=i+"-06-30";                        
                     //  session.setAttribute("validity",vdate);
                    }   
                    else  //spring 01-01-xxxx
                    {
                        vdate=i+"-01-01";
                        //session.setAttribute("validity",vdate );
                    }
                    String p=request.getParameter("pass");
                    String un=request.getParameter("uname");
                    String c=request.getParameter("cno");
                    String a=request.getParameter("add");
                    String e=request.getParameter("email");
                    String t=request.getParameter("type");
                    String q="insert into user values(null,'"+p+"','"+un+"','"+a+"','"+c+"','"+e+"','"+t+"','"+vdate+"')";
                    st.executeUpdate(q);
                    q="select max(User_id) from user";
                    rs=st.executeQuery(q);
                    if(rs.next()){
                        
                        session.setAttribute("user_id",rs.getString(1) );
                        session.setMaxInactiveInterval(160);
                Cookie ck1=new Cookie("uid",rs.getString(1));
                ck1.setMaxAge(24*60);
                response.addCookie(ck1);
                    }
                    
}
        else{
            if(referer.equals("http://localhost:8080/cms/lodge.jsp")){
                String b=request.getParameter("Lodge");
                if(b!=null){
                    String type=null,C_id=null,no=null;
                    int n=0,permited=0;
                    //char no;
                    String u=request.getParameter("hu");
                    String query="select count(*) from Complaint where user_id='"+u+"'";
                    rs=st.executeQuery(query);
                    if(rs.next()){
                        permited=rs.getInt(1);
                    }
                    if(permited<5){
                    query="select * from user where User_id='"+u+"'";
                    rs=st.executeQuery(query);
                    if(rs.next()){
                        type=rs.getString(7);
                    }
                    query="select * from Complaint";
                    rs=st.executeQuery(query);
                    while(rs.next()){
                        no=rs.getString(1).substring(2);
                        int n1=Integer.parseInt(no);
                        
                        if(n1>n){
                            n=n1;
                        }
                    }
                    n=n+1;
                    
                    String cd=request.getParameter("cd");
                    String loc=request.getParameter("location");
                    String lby=request.getParameter("near");
                    String cat=request.getParameter("category");
                    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date d1=new java.util.Date();
                    String d2=dateFormat.format(d1);
                    
                    String di=request.getParameter("division");
                        C_id=type.toUpperCase()+di+n;
                    //out.println("<h3>"+C_id);
                    String q1="insert into Complaint values ('"+C_id+"','"+cd+"',1,null,0,0,0,'"+d2+"','"+loc+"','"+lby+"',0000-00-00,'"+cat+"','"+u+"')";
                    st.executeUpdate(q1);
                }
                    else{
                        
                        out.println("<br><br><br><br><h3>Your Complaint cant be lodged it exceeds the limit");
                    }
                }
            }
            }
        }
        
        
                    
        %>
        
            <br><br><br><br><br><br>
            <table  border=5  width = "1" cellspacing = "2" cellpadding = "3">
                <tbody>
                    <tr><a href="profile_preview.jsp"><h3>Preview your Profile</h3></a></tr>
                    <tr><a href="lodge.jsp"><h3>Lodge a Complaint</h3></a></tr>
                    <tr><a href="status.jsp"><h3>View Status of your Complaints</h3></a></tr>
                    <tr><a href="request_to_admin.jsp"><h3>Forward your Request to Admin</h3></a></tr>
                </tbody>
            </table>
    </body>
</html>
