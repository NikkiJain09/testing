<%-- 
    Document   : display_single_complaint
    Created on : 17 Aug, 2014, 2:01:00 PM
    Author     : prachi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css" />
<%@include file="cache_admin.jsp"%>
<%@include file="connection_db.jsp"%>
<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details of Single Complaint</title>
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
    </head>
    <body>
        <form action="admin_home.jsp">
            <br><br><br><br><br>
        <H1>COMPLAINT DATA</H1>
        <table border="2" style="width:1000px" title="COMPALINT DATA">
      
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
                //Class.forName("com.mysql.jdbc.Driver");
                //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","bansal");
                //ResultSet rs=null,rs1=null;
                
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
        <tr>
            <td>Complaint Category</td>
            <td><%out.println(rs.getString(12));%>
            </td>
        </tr>
            <td>
                Division
            </td>
            <td>
                <%switch(s1.charAt(1)){
                    case 'W':out.println("Water Division");
                        break;
                    case 'E':out.println("Electricity Division");
                        break;
                    case 'C':out.println("Civil Division");
                        break;
                    default:out.println("Not a valid division");
                }%>
            </td>
        </tr>
        <tr>
            <td>
                Status
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
        <%if(rs.getInt(3)!=1){
            %>
            <tr>
                <td>Handled by</td><td><%out.println(nm);%></td>
            </tr>
            <%
        }%>
        <tr><td>
                Resolved</td>
            <td>
                <%
                    if(rs.getInt(5)==0)
                    {
                        out.println("NO");
    }
                    else{
                        out.println("YES");
                                                
    }%>
            </td>
        </tr>
        <%
                    if(rs.getInt(5)!=0){
                        %>
                        <tr><td>Notification Status</td>
                        <td><%if(rs.getInt(6)==0){
                            out.println("User Still has to be notified that his Complaint is resolved");
                        }
                        else{
                            out.println("Notification has been send to user");
                        }%></td></tr>
                    <%}
                    %>
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
        <%
            if(rs.getInt(5)!=0){
                %>
                <tr><td>Resolved on </td>
                    <td><%out.println(rs.getString(11));%></td></tr>
                <%
            }
                    %>
                <tr>
                    <td>Registered by</td>
                    <td><%
            String r=rs.getString(13);
            String q1="select * from user where User_id='"+r+"'";
            rs1=st.executeQuery(q1);
            if(rs1.next()){
            out.println(r+"  "+ rs1.getString(3) );
            }%></td>
                </tr>
        

<%}
                  else{
                      out.println("<h3>Its not a Valid Complaint Id");
                  }%>
</table> 
        <input type="button" value ="Back" name ="Back" onclick="history.back();" id="button">
        <br>
        <br>
            <input type ="submit" value="Ok" id="submit">
        </form>
    </body>
</html>
