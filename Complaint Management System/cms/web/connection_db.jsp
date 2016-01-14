<%@page import ="java.sql.*"%>
<%
    
    Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","nishtha");
                ResultSet rs=null,rs1=null;
                Statement st=con.createStatement();

    %>
