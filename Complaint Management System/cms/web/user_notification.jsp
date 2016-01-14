<%@include file="connection_db.jsp" %>
<%@include file="cache_user.jsp"%>
<%
    String qu="select * from Complaint where user_id='"+s1_u+"' and resolved=1 and notified=0";
    rs=st.executeQuery(qu);
    while(rs.next()){
        String f=rs.getString(1);
        %>
        <input type="hidden" value="<%=f%>" id="i">
        <script>
            var v =document.getElementById("i").value;
            alert("Your Complaint is resolved "+v );
            </script>
            
    <%
    }
    qu="update Complaint set notified=1 where user_id='"+s1_u+"' and resolved=1 and notified=0";
    st.executeUpdate(qu);
   
            
    
    %>