<%-- 
    Document   : CR_choose_complaint
    Created on : Aug 22, 2014, 7:31:32 PM
    Author     : nishtha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css" />
<%@include file="cache_CR.jsp" %>
<%@include file="connection_db.jsp"%>
<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Taking on Complaint</title>
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
    </head>
    <body>

            <br><br><br><br><br>
        <H1>COMPLAINT DATA</H1>
        <table border="2" style="width:1000px" title="COMPLAINT DATA" align="center">

            <tr>
                <td>Complaint ID</td>
                <td><%String s1=request.getParameter("iid");
                String sh=request.getParameter("value");
if(s1==null && sh!=null){
                    s1=sh;
                }
out.println(s1);%></td>
            </tr>


                <%

                String nm=null;
                PreparedStatement st2=con.prepareStatement("select * from Complaint where C_id=? ");
                PreparedStatement st1=con.prepareStatement("select * from complaint_resolver where cr_id=? ");
                st2.setString(1,s1);
                rs=st2.executeQuery();
                if(rs.next()){
                  %>
                  <tr>
            <td>
                Complaint Registered by
            </td>
            <td>
                  <%
                if(s1!=null){
                if(s1.charAt(0)=='S'){
                    out.println("IIT Roorkee Student");
                }
                else{
                    out.println("IIT Roorkee Employee");
                }}
                    if(rs.getString(4)!=null){
                  st1.setString(1,rs.getString(4));


                  rs1=st1.executeQuery();
                  if(rs1.next()){

                  nm=rs1.getString(3);
                  }
                  }
                }
                rs=st2.executeQuery();
                  if(rs.next())   {

                %>
            </td>
        </tr>
        <tr>
            <td>
                Description of Complaint
            </td>
            <td>
                <%


                    out.println(rs.getString(2));

                %>
            </td>
        </tr>
        <tr>
            <td>Date of Complaint Booking</td>
            <td><%out.println(rs.getString(8));%></td>
        </tr>
        <tr>
            <td>Location</td>
            <td><%out.println(rs.getString(9));%></td>
        </tr>
        <tr>
            <td>Exact Location</td>
            <td><%out.println(rs.getString(10));%></td>

        </tr>
                <tr>
                    <td>Registered by</td>
                    <td><%
            String r=rs.getString(13);
            String q1="select * from user where User_id='"+r+"'";
            rs1=st.executeQuery(q1);
            if(rs1.next()){
            out.println(r+"  "+ rs1.getString(3) );
            session.setAttribute("comp_id", s1);
            }%></td>
                </tr>
                </table>
                <br><br>
        <form action="CR_assign_complaint.jsp" name="assign">
    
    <input type="submit" value="Take this complaint" align="center"/><br>
</form>

<%}
                  else{
                      out.println("<h3>Its not a Valid Complaint Id");
                  }%>



        <input type="button" value ="Back" name ="Back" onclick="history.back();" id="button">
        <br>
        <br>

    </body>
</html>
