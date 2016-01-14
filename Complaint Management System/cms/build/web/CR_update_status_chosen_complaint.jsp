<%-- 
    Document   : CR_update_status_chosen_complaint
    Created on : Aug 23, 2014, 1:16:55 AM
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
        <title>Details of Complaint for update</title>
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
    </head>
    <body>

            <br><br><br><br><br>
        <H1>COMPLAINT DATA</H1>
        <table border="2" style="width:1000px" title="COMPLAINT DATA">

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
            <td>Complaint Category</td>
            <td><%out.println(rs.getString(12));%>
            </td>
        </tr>

        <tr>
            <td>
                Current Status
            </td>
            <td>
                <%
                    switch(rs.getInt(3)){
                        case 1: out.println("Complaint Registered Right Now Yet not alloted to any official");
                            break;
                        case 2: out.println("Complaint alloted to  "+nm);
                            break;
                        case 3: out.println("Complaint resolution procedure is in Process");
                            break;
                        case 4: out.println("Complaint is resolved");
                            break;
                        case 5: out.println("Complaint cant be reolved");
                            break;
                        case 6: out.println("Complaint forwarded to ADMIN");
                            break;
                        default:out.println("Not a valid Status");
                    }
                    %>
            </td>
        </tr>

        <tr>
            <td>   Complaint forwarded for admin observation</td>
            <td><%if(rs.getInt(7)==0){
                out.println("NO");
            }
            else{
                out.println("YES");
                    }%></td>
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
            session.setAttribute("scomp_id", s1);
            }%></td>
                </tr>
                <form action="CR_set_status.jsp" name="upstatus">
                    <select name="status">
  <option value="3">Under Process</option>
  <option value="4">Resolved</option>
  <option value="5">Cannot be Resolved</option>
  <option value="0" selected="true">No update</option>
</select>
    <input type="submit" value="Update status" align="center"/><br>
                </form>

<%}
                  else{
                      out.println("<h3>Its not a Valid Complaint Id");
                  }%>
</table>
        <input type="button" value ="Back" name ="Back" onclick="history.back();" id="button">
        <br>
        <br>

    </body>
</html>
